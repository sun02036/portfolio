<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Websocket" name="title"/>
</jsp:include>

<!-- sock.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js" integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- stomp.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용 babel-standalone -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js" integrity="sha512-kp7YHLxuJDJcOzStgd6vtpxr4ZU9kjn77e6dBsivSz+pUuAuMlE2UTdKB7jjsWT84qbS8kdCWHPETnP/ctrFsA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용: babel-polyfill -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js" integrity="sha512-uzOpZ74myvXTYZ+mXUsPhDF+/iL/n32GDxdryI2SJronkEyKC8FBFRLiBQ7l7U/PTYebDbgTtbqTa6/vGtU23A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<c:if test="${loginMember.id eq 'admin' }">
	
		<!-- 관리자용 공지 modal -->
		<div class="modal fade" id="adminNoticeModal" tabindex="-1" role="dialog" aria-labelledby="#adminNoticeModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="adminNoticeModalLabel">Notice</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form>
		          <div class="form-group">
		            <label for="send-to-name" class="col-form-label">받는이 :</label>
		            <input type="text" class="form-control" id="send-to-name">
		          </div>
		          <div class="form-group">
		            <label for="message-text" class="col-form-label">메세지 :</label>
		            <textarea class="form-control" id="message-text"></textarea>
		          </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="adminNoticeSendBtn">전송</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div>
			<button 
				type="button" 
				class="btn btn-outline-primary"
				data-toggle="modal"
				data-target="#adminNoticeModal">공지</button>
		</div>
		
		<script>
		
		$(adminNoticeSendBtn).click((e) => {
			
			const to = $("#send-to-name").val() ? $("#send-to-name").val() : 'all';
			
			// obj 객체 생성
			const obj = {
				from : "${loginMember.id}", // admin
				to : to,
				msg : $("#message-text").val(),
				time : Date.now(),
				type : "NOTICE"
			};
			
			const url = `/app/admin/notice/\${obj.to}`;
			
			console.log(url, obj);
			
			// {} -> 빈 헤더를 던진다는 의미
			stompClient.send(url, {}, JSON.stringify(obj));
			
			// modal 해제
			$(adminNoticeModal)
				.modal('hide') // 해제하는 방법
				.find('form')[0].reset(); // [0] 실제 js dom 객체 반환 
				//안의 폼 초기화하는 것임. 0번지 제이쿼리 객체가 아니라 실제 js Dom 객체를 반환해서 리셋해주는 것임
			
		});
		
		</script>

	</c:if>
	
	<div style="margin: 0 auto;">
	<img src="https://i.ibb.co/y5BfF4K/websocket.png" alt="" style="width: 90%;"/>
	</div>

	<!-- stomp -->
    <div class="input-group mb-3">
    	<select id="destination" class="form-select mr-1">
    		<option value="/topic">/topic</option>
    		<option value="/app/a">/app/a</option>
    		<option value="/app/b">/app/b</option>
    		<option value="/app/c">/app/c</option>
    		<option value="/app/x">/app/x</option>
    	</select>
	    <input type="text" id="message" class="form-control" placeholder="Message">
	    <div class="input-group-append" style="padding: 0px;">
	        <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
	    </div>
    </div>
    <div>
        <ul class="list-group list-group-flush" id="data"></ul>
    </div>
    
<!-- <script type="text/babel"> -->
<script>

// 1. Stomp Client 객체 생성(websocket) // 웹소켓 시작해주세요. // servlet-context 설정과 상응됨
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`); // 맨 처음 요청하는 주소
const stompClient = Stomp.over(ws);
	
const messageHandler = (message) => {
	console.log("message from /topic", message);
	
	// {headers: {destination:"/app/a"}, body:"안녕", ...} headers라는 속성을 가져와라 뭐 이런 의미
	const {headers: {destination}, body} = message; // 구조 분해 할당
	$(data).append(`<li class="list-group-item">\${destination} : \${body}</li>`);
};

	// 2. 구독(subscribe)
	stompClient.connect({}, (frame) => {
		console.log("Stomp Connected: ", frame);
		
		// 2-1. 구독과 동시에 핸들러 등록
		stompClient.subscribe("/topic", messageHandler);
		stompClient.subscribe("/foo/a", messageHandler);
		stompClient.subscribe("/foo/b", messageHandler);
		stompClient.subscribe("/foo/c", messageHandler);
		
		stompClient.subscribe("/notice/all", (message) => {
			console.log("전체 공지: ", message);
			
			const {body} = message;
			const {msg} = JSON.parse(body); // JSON 문자열로 다시 변환
			
			alert(`[전체 공지사항]
-------------------------------------
\${msg}
-------------------------------------`);
			
		});
		
		stompClient.subscribe("/notice/${loginMember.id}", (message) => {
			
			console.log("개인 공지: ", message);	
			
			const {body} = message;
			const {to,msg} = JSON.parse(body);
			
			alert(`[${to}님에게]
-------------------------------------
\${msg}
-------------------------------------`);
		});
	});

	$(sendBtn).click((e) => { // 클릭했다면
		const $message = $(message);

		if(!$message.val()) return;
		
		const dest = $("#destination option:selected").val();
		stompClient.send(dest, {}, $message.val()); // topic에 message 발행
		$message.val(''); // 전송 후 초기화
	});
	
	$(message).keyup((e) => { // 엔터치면 보내주세요.
		if(e.keyCode == 13) { // 13이 엔터임
			$(sendBtn).trigger('click'); // click 핸들러 호출
		}
	});

</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="관리자와 Chat" name="title"/>
</jsp:include>

<div style="margin: 0 auto;">
	<img src="https://i.ibb.co/y5BfF4K/websocket.png" alt="" style="width: 90%; margin-bottom: 20px; margin: 0 auto;"/>
</div>

<div class="input-group mb-3">
  <input type="text" id="message" class="form-control" placeholder="Message...">
  <div class="input-group-append" style="padding: 0px;">
    <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
  </div>
</div>

<div>
	<ul class="list-group list-group-flush" id="data">
		<c:forEach items="${list }" varStatus="vs" var="list">	
			<li class="list-group-item">${list.memberId}: ${list.msg}</li>
		</c:forEach>
	</ul>
</div>

<script>

// 구독 주소: /chat/{chatId}

//1. Stomp Client 객체 생성(websocket) // 웹소켓 시작해주세요. // servlet-context 설정과 상응됨
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`); // 맨 처음 요청하는 주소
const stompClient = Stomp.over(ws);

	// 2. 연결 요청
	stompClient.connect({}, (frame) => {
		console.log("Stomp Client Connected: ", frame);
		
		// 3. 구독
		stompClient.subscribe("/chat/${chatId}", (message) => {
			console.log("message: ", message);
			
			const obj = JSON.parse(message.body); // JSON을 다시 js로 바꿀 때는 parse
			console.log(obj);
			
			const {memberId, msg} = obj; // obj의 memberId와 msg를 각각 담고
			
			$(data).append(`<li class="list-group-item">\${memberId}: \${msg}</li>`);
		});
	});
	
	$(sendBtn).click((e) => {
		const obj = {
				chatId : "${chatId}",
				memberId : "${loginMember.id}",
				msg : $(message).val(),
				logTime : Date.now()
		};
		
		console.log(obj); 
		// {chatId: 'chat_O58R44o8CtMj0M1', memberId: 'honggd', msg: '안녕하세여!!!', time: 1639370769330}
		
		stompClient.send("/app/chat/${chatId}", {}, JSON.stringify(obj)); // /app으로 시작해야 SimpleAnnotationMethod를 태워줌
		
		$(message).val(''); // message 초기화
	});
		
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
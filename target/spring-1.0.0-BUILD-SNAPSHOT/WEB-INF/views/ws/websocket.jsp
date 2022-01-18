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

<!-- sock.js 라이브러리 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js" integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용 babel-standalone -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js" integrity="sha512-kp7YHLxuJDJcOzStgd6vtpxr4ZU9kjn77e6dBsivSz+pUuAuMlE2UTdKB7jjsWT84qbS8kdCWHPETnP/ctrFsA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용: babel-polyfill -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js" integrity="sha512-uzOpZ74myvXTYZ+mXUsPhDF+/iL/n32GDxdryI2SJronkEyKC8FBFRLiBQ7l7U/PTYebDbgTtbqTa6/vGtU23A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
    <div class="input-group mb-3">
	    <input type="text" id="message" class="form-control" placeholder="Message">
	    <div class="input-group-append" style="padding: 0px;">
	        <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
	    </div>
    </div>
    <div>
        <ul class="list-group list-group-flush" id="data"></ul>
    </div>
    
<script type="text/babel">

// \$: 자바스크립트에서 처리되길 기대하는 | $: el 문법 -> 구분 잘하기

// 객체 생성
// const ws = new WebSocket(`ws://\${location.host}${pageContext.request.contextPath}/echo`);

// sockjs 적용한 객체 생성: http 프로토콜 사용
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/echo`);
	
	ws.onopen = (e) => {
		console.log("open: ", e);
	};
	
	ws.onmessage = (e) => {
		console.log("message: ", e);
		$(data).append(`<li class="list-group-item">\${e.data}</li>`)
	};
	
	ws.onclose = (e) => {
		console.log("close: ", e);
	};
	
	$(sendBtn).click((e) => { // 클릭했다면
		const $message = $(message);

		if(!$message.val()) return;
	
		ws.send($message.val()); // $message 내용을 전송해주세요.
		$message.val(''); // 전송 후 초기화
	});
	
	$(message).keyup((e) => { // 엔터치면 보내주세요.
		if(e.keyCode == 13) { // 13이 엔터임
			$(sendBtn).trigger('click'); // click 핸들러 호출
		}
	});

</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
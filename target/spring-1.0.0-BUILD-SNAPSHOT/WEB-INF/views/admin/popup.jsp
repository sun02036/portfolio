<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>관리자 채팅: ${memberId }</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할 것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- sock.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js" integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- stomp.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용: babel-standalone -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js" integrity="sha512-kp7YHLxuJDJcOzStgd6vtpxr4ZU9kjn77e6dBsivSz+pUuAuMlE2UTdKB7jjsWT84qbS8kdCWHPETnP/ctrFsA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용: babel-polyfill -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js" integrity="sha512-uzOpZ74myvXTYZ+mXUsPhDF+/iL/n32GDxdryI2SJronkEyKC8FBFRLiBQ7l7U/PTYebDbgTtbqTa6/vGtU23A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body class="m-2">
<div class="input-group mb-3"> <!-- m-2 -> margin 2 라는 소리 -->
  <input type="text" id="message" class="form-control" placeholder="Message">
  <div class="mr-2 input-group-append" style="padding: 0px;">
    <button id="sendBtn" class="btn btn-outline-secondary" type="button">Send</button>
  </div>
</div>
<div>
	<ul class="list-group list-group-flush" id="data">
		<c:forEach items="${list }" var="list">
			<li class="list-group-item">${list.memberId }: ${list.msg }</li>
		</c:forEach>
	</ul>
</div>
</body>

<script>

// websocket 연결(SockJS)
const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);

// StompClient객체 생성
const stompClient = Stomp.over(ws);

// connect
stompClient.connect({}, (frame) => {
	
	// 구독 신청 및 핸들러 등록
	stompClient.subscribe("/chat/${chatId}", (message) => {
		console.log("message : ", message);
		const {memberId, msg} = JSON.parse(message.body); // JSON.parse(): JSON으로 받은 것을 "구문 분석"하기 위한 것
		$(data).append(`<li class="list-group-item">\${memberId} : \${msg}</li>`);
	});	
});

// #sendBtn 클릭시 적절한 주소를 msg publish!
$(sendBtn).click((e) => {
	const msgVal = $(message).val();
	
	if(!msgVal) return; // 유효성검사
	
	const obj = {
		chatId: "${chatId}", // @PathVariable로 인해 이미 url에 존재하기 때문에 사용 가능 
		memberId: "${loginMember.id}",
		msg: msgVal,
		logTime: Date.now()
	};
	
	// publishUrl, headers, msg(json)
	stompClient.send("/app/chat/${chatId}", {}, JSON.stringify(obj));
	
	$(message).val(''); // 초기화
	
});

</script>

</html>
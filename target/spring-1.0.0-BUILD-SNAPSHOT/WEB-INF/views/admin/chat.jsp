<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="관리자 Chat" name="title"/>
</jsp:include>

<style>
table.table th, table.table td {text-align: center;}
</style>

<table id="chatList" class="table">
  <thead>
    <tr>
      <th scope="col">회원아이디</th>
      <th scope="col">메세지</th>
    </tr>
  </thead>
  <tbody>  
	<c:forEach items="${list }" var="list">
	    <tr id="${list.chatId }" data-chat-id="${list.chatId }" data-member-id="${list.memberId }">   
		    <td class="memberId">${list.memberId }</td>
		    <td class="msg">${list.msg }</td>
	    </tr>
	</c:forEach>
  </tbody>
</table>

<script>

/**
 * [채팅 팝업 띄우기] 
 */
 
$("tr[id]").click((e) => { // tr 속성 중에 id 값이 있는 애를 클릭하면
// 	console.log(e.target); // 얘는 td가 뜸
	const $tr = $(e.target).parent("tr"); // e.target(td)의 부모 tr
	
	const chatId = $tr.attr("id");	
	const memberId = $tr.data("memberId"); // tr 속성에 저장된 memberId라는 data 속성이 있다는데 // camelcasing
	
	console.log(chatId, memberId); // 해당 chatId, memberId가 뜸
	
	// 팝업 요청
	const url = `${pageContext.request.contextPath}/admin/\${chatId}/\${memberId}/chat.do`;
	const name = chatId; // 팝업창 Window객체의 name.
	const spec = "width=500px, height=500px";
	
	open(url, name, spec);
})

/**
 * [웹소켓 연결]
 * "/chat/admin" 구독
 */
 
//websocket 연결(SockJS)
 const ws = new SockJS(`http://\${location.host}${pageContext.request.contextPath}/stomp`);

 // StompClient객체 생성
 const stompClient = Stomp.over(ws);

 // connect
 stompClient.connect({}, (frame) => {
 	
 	// 구독 신청 및 핸들러 등록
 	stompClient.subscribe("/chat/admin", (message) => {
 		console.log("message : ", message);
 		
 		const obj = JSON.parse(message.body);
 		console.log(obj);
 		
 		const {chatId, memberId, msg} = obj; // 필요한 것만 빼기
 		
 		const $tr = $(`#\${chatId}`); // 특정 tr 찾기
 		console.log($tr);
 		
 		const $msgTd = $tr.children(".msg"); // tr의 children인 td의 .msg값을 가진 애를 찾기
 		console.log($msgTd);
 		
 		$msgTd.text(msg); // td.msg 갱신
 		
 		/**
 		 * 최근 메세지 온 순서로 나열하기
 		 */
 		 
 		$tr.prependTo($("#chatList tbody")); // 첫번째 자식 요소로 추가(이동)
 	});	
 });

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
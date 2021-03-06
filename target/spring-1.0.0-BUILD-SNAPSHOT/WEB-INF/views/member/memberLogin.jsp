<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />

<script>

// msg
<c:if test="${not empty msg}">
alert("${msg}");
</c:if>

// login modal 선택 시 스크립트(없으면 안 나옴)
	$(() => {
		$(loginModal)
			.modal() // loginModal 찾아서 modal 해주세요 하면 modal이 튀어나올 것
			.on("hide.bs.modal", (e) => { // modal이 감춰지는 이벤트(취소 버튼, 바깥 공간 클릭 등)가 발생한다면
				location.href = '${empty header.referer ? pageContext.request.contextPath : header.referer}'; // referer로 이동
			}) 
	});
	
</script>
</head>
<body>

	<!-- Modal 시작(Modal: 모두가 있는) -->
	<!-- https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
			<!-- header / body / footer의 형식 -->
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLabel">로그인</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!--로그인 폼 -->
				<!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
				<form
					action="${pageContext.request.contextPath}/member/memberLogin.do"
					method="post">
					<div class="modal-body">
						<input 
							type="text" class="form-control" name="id"
							placeholder="아이디" value="honggd" required> <br /> 
						<input
							type="password" class="form-control" name="password"
							placeholder="비밀번호" value="1234" required>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-outline-success">로그인</button>
						<button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal 끝-->
</body>
</html>

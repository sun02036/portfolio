﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 작성" name="title"/>
</jsp:include>

<style>
div#board-container{width:400px; margin:0 auto; text-align:center;}
div#board-container input{margin-bottom:15px;}
/* 부트스트랩: 파일라벨명 정렬 */
div#board-container label.custom-file-label{text-align:left;}
</style>

<script>

/* textarea에도 required 속성을 적용 가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
function boardValidate(){
	var $content = $("[name=content]");
	if(/^(.|\n)+$/.test($content.val()) == false){
		alert("내용을 입력하세요");
		return false;
	}
	return true;
}

/* 첨부파일 선택 시 파일명 보이게  */
$(() => {
	$("[name=upFile]").change((e) => {
		
		// 1. 파일명 가져오기
		const file = $(e.target).prop("files")[0];
		const filename = file?.name; // ?: optional chaining 객체가 undefined 경우에도 오류가 나지 않음
		
		console.dir(e.target);
		console.log(filename);
		
		// 2. label에 설정하기
		const $label = $(e.target).next(); // e.target의 다음 요소
		
		if(file != undefined) {
			$label.html(filename);
		}
		else {
			$label.html("파일을 선택하세요.");
		}
	})
});

</script>

<div id="board-container">
	<!-- 파일 업로드 시 enctype="multipart/form-data" 필수 -->
	<form 
		name="boardFrm" 
		action="${pageContext.request.contextPath}/board/boardEnroll.do" 
		method="post" 
		enctype="multipart/form-data"
		onsubmit="return boardValidate();"
	>
		
		<input type="text" class="form-control" placeholder="제목" name="title" id="title" required>
		<input type="text" class="form-control" name="memberId" value="${loginMember.id}" readonly required>
		
		<!-- input: file소스: https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
		
		<!-- upFile1 -->
		<div class="input-group mb-3" style="padding:0px;">
		  <div class="input-group-prepend" style="padding:0px;">
		    <span class="input-group-text">첨부파일1</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple="multiple" >
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
		  </div>
		</div>
		
		<!-- upFile2 -->
		<div class="input-group mb-3" style="padding: 0px;">
		  <div class="input-group-prepend" style="padding: 0px;">
		    <span class="input-group-text">첨부파일2</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile2" >
		    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
		  </div>
		</div>
		
	    <textarea class="form-control" name="content" placeholder="내용" required></textarea>
		<br />
		<input type="submit" class="btn btn-outline-success" value="저장" >
	</form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
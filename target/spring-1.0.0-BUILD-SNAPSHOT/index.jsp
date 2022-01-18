﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 한글 깨지지 않게 하는 설정-->
<fmt:requestEncoding value="utf-8"/>

<!-- \${param.title} -->
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="안녕 스프링" name="title"/> 
</jsp:include>

		<img src="${pageContext.request.contextPath }/resources/images/logo-spring.png" id="center-image" alt="스프링로고" class="d-block mx-auto mt-5"/>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
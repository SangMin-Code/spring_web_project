<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib uri ="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	all
</h1>

<sec:authorize access="isAnonymous()">
	<a href="/customLogin">로그인</a>
</sec:authorize>


<sec:authorize access="isAuthenticated()">
	<a href="/customLogout">로그아웃</a>
</sec:authorize>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>

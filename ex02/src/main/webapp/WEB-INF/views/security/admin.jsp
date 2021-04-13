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
	admin!  
</h1>
<a href="/customLogout">Logout</a>
<p>principal : <sec:authentication property ="principal"/></p>
<p>MemberVP : <sec:authentication property ="principal.member"/></p>
<p>사용자이름 : <sec:authentication property ="principal.member.userName"/></p>
<p>사용자아이디 : <sec:authentication property ="principal.username"/></p>
<p>사용자 권한 리스트 : <sec:authentication property ="principal.member.authList"/></p>



<P>  The time on the server is ${serverTime}. </P>
</body>
</html>

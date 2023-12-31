<%--
  Created by IntelliJ IDEA.
  User: minsu
  Date: 2023-08-27
  Time: 오후 2:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </head>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${contextPath}/test/boardList">Home</a></li>
      <c:if test="${empty mem}">
        <li><a href="${contextPath}/test/getBoardLogin">로그인</a></li>
        <li><a href="${contextPath}/test/getBoardMem">회원가입</a></li>
        <li><a href="#">Page 3</a></li>
      </c:if>
      <c:if test="${!empty mem}">
        <li><a href="#">Page 1</a></li>
        <li><a href="#">Page 2</a></li>
        <li><a href="#">Page 3</a></li>
      </c:if>
    </ul>
  </div>
</nav>
<div class="container">
  <c:if test="${!empty mem}">
    <div class="well well-sm">${mem.memName}님 반갑습니다.</div>
  </c:if>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: minsu
  Date: 2023-08-27
  Time: 오후 2:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" property="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Title</title>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
  <jsp:include page="/WEB-INF/resources/tabs.jsp"/>
  <div class="container">
    <h2>Vertical (basic) form</h2>
    <form action="${contextPath}/test/loginMember" method="post">
        <div class="form-group">
        <label for="memID">ID:</label>
        <input type="text" class="form-control" id="memID" placeholder="Enter ID" name="memID">
        </div>
        <div class="form-group">
        <label for="memPassword">Password:</label>
        <input type="password" class="form-control" id="memPassword" placeholder="Enter password" name="memPassword">
        </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
  </div>
</body>
</html>

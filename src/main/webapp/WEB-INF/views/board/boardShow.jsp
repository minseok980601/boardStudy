<%--
  Created by IntelliJ IDEA.
  User: minsu
  Date: 2023-08-23
  Time: 오후 4:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
  <div class="container">
    <h2>Striped Rows</h2>
    <p>The .table-striped class adds zebra-stripes to a table:</p>
    <jsp:include page="/WEB-INF/resources/tabs.jsp"/>
    <table class="table table-striped">
      <thead>
        <tr>
          <th>제목</th>
          <td>${showBoard.title}</td>
        </tr>
      </thead>
      <thead>
        <tr>
          <th>작성자</th>
          <td>${showBoard.creator_id}</td>
        </tr>
      </thead>
      <thead>
        <tr>
          <th>작성일</th>
          <td>${showBoard.created_datetime}</td>
        </tr>
      </thead>
      <tbody>
      <tr>
        <th>내용</th>
        <td>
          ${showBoard.contents}
        </td>

      </tr>
      <tr>
        <th>이미지</th>
        <td>
          <img src="images/20230824/438378347824300.png">
        </td>
        <c:forEach var="file" items="${showBoard.fileList}" end="0" begin="9">
          <td>
            <img src="${file.stored_file_path}">
          </td>
        </c:forEach>
      </tr>
      </tbody>
    </table>
  </div>
</body>
</html>

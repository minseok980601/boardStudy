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
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>작성일</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="list" items="${boardList}" begin="0" end="9">
        <tr>
          <td>${list.board_idx}</td>
          <td><a href="${contextPath}/test/showBoard?board_idx=${list.board_idx}">${list.title}</a></td>
          <td>${list.creator_id}</td>
          <td>${list.hit_cnt}</td>
          <td>${list.created_datetime}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

    <div>
      <form action="${contextPath}/test/boardList?keyword=${pag.cri.keyword}" method="get">
        <div>
          <input class="col-xs-2" type="text" name="keyword" value="${pag.cri.keyword}">
          <button class="btn-primary" type="submit">검색</button>
        </div>
      </form>
    </div>

    <div>
      <ul id="pageInfo" class="pagination">
        <c:if test="${pag.prev}">
          <li>
            <a href="${contextPath}/test/boardList?pageNum=${pag.startPage-1}&amount=${pag.cri.amount}">Previous</a>
          </li>
        </c:if>

        <c:forEach var="num" begin="${pag.startPage}" end="${pag.endPage}">
          <li class="pageInfo-btn">
            <a href="${contextPath}/test/boardList?pageNum=${num}&amount=${pag.cri.amount}">${num}</a>
          </li>
        </c:forEach>

        <c:if test="${pag.next}">
          <li>
            <a href="${contextPath}/test/boardList?pageNum=${pag.endPage + 1}&amount=${pag.cri.amount}">Next</a>
          </li>
        </c:if>

        <input type="hidden" name="keyword" value="${pag.cri.keyword}">
        <input type="hidden" name="pageNum" value="${pag.cri.pageNum}">
        <input type="hidden" name="amount" value="${pag.cri.amount}">

      </ul>
    </div>

    <a class="btn btn-primary" href="${contextPath}/test/insertBoard">작성하기</a>
  </div>
</body>
</html>

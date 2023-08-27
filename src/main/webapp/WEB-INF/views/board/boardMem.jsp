<%--
  Created by IntelliJ IDEA.
  User: minsu
  Date: 2023-08-27
  Time: 오후 4:21
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
    <script type="text/javascript">
        $(document).ready(function () {
            if (${!empty msgType}) {
                $("#messageType").attr("class", "modal-content panel-warning");
                $("#myMessage").modal("show");
            }
        });
        
        function registerCheck() {
            var memID = $("#memID").val();
            $.ajax({
                url: "${contextPath}/test/memRegisterCheck",
                type: "get",
                data: {"memID" : memID},
                success: function (result) {
                    alert(result);
                    if (result == 1) {
                        // alert("사용할 수 있는 아이디입니다.")
                        $("#checkMessage").html("사용할 수 잇는 아이디입니다.");
                        $("#checkType").attr("class", "modal-content panel-success");
                    } else {
                        // alert("사용할 수 없는 아이디입니다.")
                        $("#checkMessage").html("사용할 수 없는 아이디입니다.");
                        $("#checkType").attr("class", "modal-content panel-warning");
                    }
                    $("#myModal").modal("show");
                },
                error: function () {
                    alert("error");
                }
            });
        }

        function passwordCheck() {
            var memPassword1 = $("#memPassword1").val();
            var memPassword2 = $("#memPassword2").val();

            if (memPassword1 != memPassword2) {
                $("#passMessage").html("비밀번호가 서로 일치하지 않습니다.");
            } else {
                $("#passMessage").html("");
                // 비밀번호가 일치할경우 hidden에 memPassword를 집어 넣음.
                $("#memPassword").val(memPassword1);
            }
        }

        function goInsert() {
            var memAge = $("#memAge").val();
            if (memAge == null || memAge == "" || memAge == 0) {
                alert("나이를 입력하세요");
                return false;
            }
            document.frm.submit();
        }
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/resources/tabs.jsp"/>
<div class="container">
    <h2>Vertical (basic) form</h2>
    <form name="frm" action="${contextPath}/test/joinMember" method="post">
        <input type="hidden" id="memPassword" name="memPassword" value="">
        <div class="form-group">
            <label for="memID">ID:</label>
            <input type="text" class="form-control" id="memID" placeholder="Enter ID" name="memID">
            <input type="button" class="btn btn-primary btn-sm" onclick="registerCheck()" value="중복확인">
        </div>
        <div class="form-group">
            <label for="memPassword1">Password:</label>
            <input type="password" class="form-control" id="memPassword1" onkeyup="passwordCheck()" placeholder="Enter password" name="memPassword1">
        </div>
        <div class="form-group">
            <label for="memPassword2">ChkPassword:</label>
            <input type="password" class="form-control" id="memPassword2" onkeyup="passwordCheck()" placeholder="Enter password" name="memPassword2">
        </div>
        <div class="form-group">
            <label for="memName">Name:</label>
            <input type="text" class="form-control" id="memName" placeholder="Enter Name" name="memName">
        </div>
        <div class="form-group">
            <label for="memAge">Age:</label>
            <input type="text" class="form-control" id="memAge" placeholder="Enter Age" name="memAge">
        </div>
        <div class="form-group" style="text-align: center; margin: 0 auto;">
            <div class="btn-group" data-toggle="buttons">
                <label class="btn btn-primary active">
                    <input type="radio" id="memGender" name="memGender" autocomplete="off" value="남자" checked />남자
                </label>
                <label class="btn btn-primary">
                    <input type="radio" id="memGender" name="memGender" autocomplete="off" value="여자" />여자
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="memEmail">Email:</label>
            <input type="text" class="form-control" id="memEmail" placeholder="Enter Email" name="memEmail">
        </div>
        <span id="passMessage" style="color: red;" ></span>
        <button type="button" class="btn btn-default" value="등록" onclick="goInsert()">등록</button>
    </form>
</div>
<!-- 다이얼로그창(모달) -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div id="checkType" class="modal-content panel-info">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">메세지 확인</h4>
            </div>
            <div class="modal-body">
                <p id="checkMessage"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- 실패 메시지를 출력(Modal) -->
<div id="myMessage" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div id="messageType" class="modal-content panel-info">
            <div class="modal-header panel-heading">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">${msgType }</h4>
            </div>
            <div class="modal-body">
                <p>${msg }</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>

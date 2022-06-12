<%--
  Created by IntelliJ IDEA.
  User: iii
  Date: 2022/5/20
  Time: 下午 02:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<jsp:include page="firmPage.jsp"/>
<html>
<head>
    <title>更新房間資料</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="${contextRoot}/css/formtest.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-9" style="left: 37%;">
            <h1 class="info">房間資料</h1>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-1" style="z-index: -1">
        </div>
        <div style="top:0;left: 0;" class="col-11 mt-3">
            <form:form action="${contextRoot}/firmPostEditRoom" modelAttribute="roomBean" method="POST" enctype="multipart/form-data">
                <%--                沒加id欄位編輯會變成新增--%>
            <div class="form-group">
                <label>房間ID</label>
                <form:input type="text" class="form-control" path="roomId" cssStyle="width: 300px" readonly="true"/>
            </div>
            <div class="form-group">
                <label>旅館Id</label>
                <form:input type="text" class="form-control" path="hotel.hotelId" cssStyle="width: 300px" readonly="true"/>
            </div>
            <div class="form-group">
                <label>房間名字</label>
                <form:input type="text" class="form-control" path="roomName" cssStyle="width: 300px"/>
            </div>
            <div class="form-group">
                <label>價格</label>
                <form:input type="text" class="form-control" path="price" cssStyle="width: 300px"/>
            </div>
            <div class="form-group">
                <label>標籤</label>
                <form:input type="text" class="form-control" path="tag" cssStyle="width: 300px"/>
            </div>
            <div class="form-group">
                <label>人數限制</label>
                <form:input type="number" class="form-control" path="upperLimit" cssStyle="width: 300px"/>
            </div>
            <div class="form-group">
                <label>描述</label>
                <form:input type="text" class="form-control" path="description" cssStyle="width: 300px"/>
            </div>
                <div class="form-group">
                    <label>照片上傳</label>
                    <input type="file" class="" name="pic" multiple="multiple" accept="image/*, .jpeg, .png, .gif, .jpeg" id="uploadImg"/>
                </div>
                <c:forEach var="oneImg" items="${roomImgByRoomID}">
                    <td><img style="width: 250px;height: 250px;border-radius: 10px" src="${contextRoot}/downloadImage/${oneImg.roomImgId}"></td>
                    <td><a href="${contextRoot}/deleteImg?roomImgId=${oneImg.roomImgId}">刪除</a></td>
<%--                    <td><button class="deletebtn" id="${oneImg.roomImgId}">刪除</button></td>--%>
                </c:forEach>
                <input type="hidden" value="${roomImgByRoomID[0].room.roomId}" id="roomId">
                <div class="form-group">
                    <label>照片描述</label>
                    <input type="text" class="form-control" name="imgDescription" style="width: 300px"/>
                </div>

        </div>
        <div class="container">
            <div class="row justify-content-end">
                <div class="col-4">
                    <input type="submit" value="送出" id="btn">
                </div>
                <div class="col-4"></div>
            </div>
        </div>
        </form:form>
    </div>
</div>

<script>
    $('.deletebtn').click(function (){
        let roomId = document.getElementById('roomId').value
        let imgId = this.value
      $.ajax({
          url: "${contextRoot}/Booking/api/deleteImg/"+imgId,
          contentType: 'application/json; charset=UTF-8',
          dataType: 'json',
          method: 'GET',
          data:{
              "roomId":roomId,
              "imgId":imgId
          },success:function(rs){

          },error:function(err){

          }
      })
    })

</script>

</body>
</html>

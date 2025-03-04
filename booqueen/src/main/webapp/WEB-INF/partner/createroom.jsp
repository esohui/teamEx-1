<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/partner/css/createroom.css">
<title>구성 및 요금 · booqueen.com</title>
</head>
<body>
   <div class="container">
      <header>
         <span id="logo">
         	<a href="home.jsp"><img src="${contextPath}/resources/partner/images/logo.png" class="header_logo"></a>
         </span>
      </header>
   </div>
   <main class="contents">
      <div class="option">
         <label> <a href="#">
               <div class="basic">기본정보</div>
         </a>
         </label> <label> <a>
               <div class="price">구성 및 요금</div>
         </a>
         </label> <label> <a>
               <div class="service">시설 및 서비스</div></label> </a> <label> <a>

               <div class="fac">편의시설</div>
         </a>
         </label> <label> <a>
               <div class="pic">사진</div>
         </a>
         </label> <label> <a>

               <div class="policy">정책</div>
         </a>
         </label> <label> <a href="#">
               <div class="payment">결제</div>
         </a>
         </label>

      </div>
      <br>
      <h2>구성 및 요금</h2>
      우선 객실에 대해 알려주세요. 필요한 정보를 모두 입력한 뒤 다음 객실로 진행하실 수 있습니다.
      <div class="input">
        <c:if test="${empty room}">
         <div class="input-1">
            <div>
               <img
                  src="https://q.bstatic.com/static/img/join/segmentation/empty-state-createroom@2x.png"
                  class="img">
            </div>
            <div class="addroom">
               <p>숙소에 추가된 객실이 없습니다. 우선 객실을 추가한 뒤 침대 옵션, 구성, 요금에 관한 설명을 입력해주시기
                  바랍니다.</p>
               <input type="button" value="객실 추가" onClick="location.href='${contextPath}/room.pdo'">
            </div>
          </div>
          </c:if>
          <c:if test="${!empty room}">
           		<div class="input-1">
                    <table class="table">
                    	<c:forEach items="room" var="r">
                        <tr>
                            <td><h3>${r.type}</h3></td>
                            <td>이 유형의 개수: ${r.available}</td>
                            <td><div class="room_edit_delete"><a href="">삭제</a> <a href="#">수정</a></div></td>
                        </tr>
                        </c:forEach>
                    </table> 
                    </div>
                    <div class="bottom_button">
                        <input type="button" href="${contextPath}/room.pdo" id="other_room" value="다른 객실 추가">
                        <input type="button" href="${contextPath}/setpayment.pdo" id="continue" value="계속">
                    </div>
            </c:if>
         </div>
         <div class="right">
            <p>숙소 등록 후에도 온라인으로 숙소 판매가 시작되기 전에 정보를 수정하실 수 있습니다.</p>
         </div>
   </main>
</body>
</html>

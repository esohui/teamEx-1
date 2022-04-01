<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/partner/css/add-room.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<title>객실 추가</title>
<script type="text/javascript">
	function submitForm(){
		$("#myForm").submit()
	}
</script>
</head>
<body>
<div class="container">
            <header>
                <span id="logo">
                    <a href="#"><img src="${contextPath}/resources/partner/images/logo.png" class="header_logo"></a>
                </span>
         </header>
        </div>
        <main class="contents">
            <div class="option">
                <label>
                    <a href="#">
                        <div class="basic">기본정보</div>
                    </a>
                </label>
                <label>
                    <a>
                    	<div class="price">구성 및 요금</div>
                    </a>
                </label>
                <label>
                    <a>
                        <div class="service">시설 및 서비스</div>
                    </a>
                </label>
                <label>
                    <a>
                    	<div class="fac">편의시설</div>
                    </a>
                </label>

                <label>
                    <a >
                        <div class="pic">

                            사진
                        </div>
                    </a>
                </label>
                <label>
                    <a>

                        <div class="policy">

                            정책
                        </div>
                    </a>
                </label>

                <label>
                    <a href="#">
                        <div class="payment">

                            결제
                        </div>
                    </a>
                </label>

            </div>
            <br>
            <h2>구성 및 요금</h2>
            우선 객실에 대해 알려주세요. 필요한 정보를 모두 입력한 뒤 다음 객실로 진행하실 수 있습니다.
            <div class="input">
                <div>
                <form id="myForm" action="uploadPic.pdo">
                <div class="input-1">
                    <table class="table">
                    	<c:forEach var="room" items="${room}">
                        <tr>
                            <td><h3>${room.type}</h3></td>
                            <td>이 유형의 개수: ${room.available}</td>
                        </tr>
                        </c:forEach>
                    </table> 
                    </div>
                	</form>
                    <div class="bottom_button">
                        <input type="submit" href="${contextPath}/roomlist.pdo" id="other_room" value="다른 객실 추가">
                        <button type="button" id="continue" onclick="submitForm()">계속</button>
                    </div>
                 </div>
                <div class="right">
                    <p>숙소 등록 후에도 온라인으로 숙소 판매가 시작되기 전에 정보를 수정하실 수 있습니다.</p>
                </div>
               
            </div>
    </main>
</body>
</html>
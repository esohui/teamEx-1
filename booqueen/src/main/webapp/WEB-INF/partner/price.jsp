<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록</title>
<link rel="stylesheet" href="${contextPath}/resources/partner/css/price.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script type="text/javascript">
	
	function submitForm(){
		
		var availableRoom = $("#availableRoom").val()
		var quota = $("#quota").val()
		var bed = $("#bed").val()
		var price = $("#price").val()
		
		if(availableRoom == null || availableRoom == "" || availableRoom == undefined || availableRoom == "undefined") {
			alert("객실 수를 입력해 주세요.")
			return;
		}
		if(quota == null || quota == "" || quota == undefined || quota == "undefined") {
			alert("객실 수용 인원을 입력해 주세요.")
			return;
		}
		if(bed == null || bed == "" || bed == undefined || bed == "undefined") {
			alert("보유하고 있는 침대의 개수를 입력해 주세요.")
			return;
		}
		if(price == null || price == "" || price == undefined || price == "undefined") {
			alert("금액을 입력해 주세요.")
			return;
		}
		$("#myForm").submit();
		
	}
</script>
</head>
<body>

   <div class="container">
      <header>
         <span id="logo"><a href="#"><img src="${contextPath}/resources/partner/images/logo.png" class="header_logo"></a>
         </span>
      </header>
   </div>
   <main class="contents">
      <div class="option">

         <label> <a href="/hotel_reg/Basic_Info.html">
               <div class="basic">
                  <img alt="" src="/images/check.png"> 기본정보
               </div>
         </a>
         </label> <label> <a href="/hotel_reg/Price.html">
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
         </label> <label> <a>
               <div class="payment">결제</div>
         </a>
         </label>

      </div>
      <br>
      <h2>구성 및 요금</h2>
      <br> 우선 첫 번째 객실에 대해 알려주세요. 필요한 정보를 모두 입력한 뒤 다음 객실로 진행하실 수 있습니다.
      <form id="myForm" action="price.pdo" method="post">
      <div class="input">
         <fieldset class="roomtype">
            <p>선택하십시오.</p>
            <div class="roomtype-1">
               <p id="name">객실유형</p>
               <br> <select name="type">
               	  <option value="디럭스 싱글룸">디럭스 싱글룸</option>
               	  <option value="수페리어 싱글룸">수페리어 싱글룸</option>
               	  <option value="디럭스 더블룸">디럭스 더블룸</option>
               	  <option value="수페리어 더블룸">수페리어 더블룸</option>
               	  <option value="디럭스 트리플룸">디럭스 트리플룸</option>
               	  <option value="수페리어 트리플룸">수페리어 트리플룸</option>
               	  <option value="주니어 스위트룸">주니어 스위트룸</option>
               	  <option value="이그제큐티브 스위트룸">이그제큐티브 스위트룸</option>
               </select>
            </div>
            <div>
               <p id="name">흡연정책</p>
               <br> <select name="smoking">
                  <option value="0">금연</option>
                  <option value="1">흡연</option>
                  <option value="2">이 객실유형은 흡연/금연 둘 다 설정 가능합니다.</option>
               </select>
            </div>
            <div>
               <p id="name">이 유형에 해당하는 객실 수</p>
               <br> <input type="number" id="availableRoom" name="available">
            </div>
            <div>
               <p id="name">객실 정원</p>
               <br> <input type="number" id="quota" name="quota">
            </div>
            <div>
               <p id="name">침대 수</p>
               <br> <input type="number" id="bed" name="bed">
            </div>
         </fieldset>
         <div class="right">
            <p>숙소 등록 후에도 온라인으로 숙소 판매가 시작되기 전에 정보를 수정하실 수 있습니다.</p>
         </div>
      </div>
      <fieldset class="roomprice">
         <p>1박 최저가</p>
         <div id="control">
            <span>해당 객실의 모든 날자에 자동으로 적용할 최저 요금입니다. 귀사의 숙소 페이지가 실제로 온라인에
               게재되기 전에 관리자 페이지에서 계정별 요금을 설정하실 수 있습니다.</span>
         </div>
         <div>
            <p id="name">1인 숙박 요금</p>
            <br>
            <div class="price-1">
               <span class="input-group-addon">KRW/1박</span> <input type="number" id="price" name="price">
            </div>
         </div>
      </fieldset>
      </form>
      <div>
      	<button type="button" id="continue" onclick="submitForm()">계속</button>
      </div>
   </main>

</body>
</html>
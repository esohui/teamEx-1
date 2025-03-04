<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>자주묻는 질문 수정</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="${contextPath}/resources/admin/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="/WEB-INF/admin/header.jsp"/>
	<div id="layoutSidenav">
		<jsp:include page="/WEB-INF/admin/menubar.jsp"/>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<div class="card mb-4"></div>
					<div class="card mb-4">
						<div class="card-header" style="font-size: 20px;"><svg class="svg-inline--fa fa-table fa-w-16 me-1" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="table" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.49 32 0 53.49 0 80v352c0 26.51 21.49 48 48 48h416c26.51 0 48-21.49 48-48V80c0-26.51-21.49-48-48-48zM224 416H64v-96h160v96zm0-160H64v-96h160v96zm224 160H288v-96h160v96zm0-160H288v-96h160v96z"></path></svg>FAQ 수정 및 삭제</div>
						<form action="${contextPath}/updateFaq.mdo" method="post" id="updateFaq" >
							<table style="width: 90%; margin-top: 25px;"> 
								<tbody>
									<tr>
										<td style="text-align: center">구분</td>
										<td>
											<select name="category" style="padding: 10px; margin-bottom: 8px; width: 90%;">
												<option value="선택" <c:if test="${faqVO.category eq '선택'}">selected</c:if>>선택</option>
												<option value="코로나19(COVID-19) 관련 지원" <c:if test="${faqVO.category eq '코로나19(COVID-19) 관련 지원'}">selected</c:if>>코로나19(COVID-19) 관련 지원</option>
												<option value="예약 취소" <c:if test="${faqVO.category eq '예약 취소'}">selected</c:if>>예약 취소</option>
												<option value="예약 상세 정보" <c:if test="${faqVO.category eq '예약 상세 정보'}">selected</c:if>>예약 상세 정보</option>
												<option value="커뮤니케이션" <c:if test="${faqVO.category eq '커뮤니케이션'}">selected</c:if>>커뮤니케이션</option>
												<option value="요금" <c:if test="${faqVO.category eq '요금'}">selected</c:if>>요금</option>
												<option value="숙소 정책" <c:if test="${faqVO.category eq '숙소 정책'}">selected</c:if>>숙소 정책</option>
												<option value="보안의식" <c:if test="${faqVO.category eq '보안의식'}">selected</c:if>>보안의식</option>
											</select>
										</td>
									</tr>
									<tr>
										<td style="text-align: center">제목<input type="hidden" name="faq_seq" value="1"></td>
										<td><textarea id="faq_title" name="title" style="width: 90%; padding: 11px;">${faqVO.title}</textarea></td>
									</tr>
									<tr>
										<td style="text-align: center">공지내용</td>
										<td><textarea id="faq_content" name="contents" style="width: 90%; height: 200px; padding: 11px;">${faqVO.contents}</textarea></td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="seq" value="${faqVO.seq}"/>
						</form>
						<div style="text-align: center; margin: 12px 0 24px;">
							<button form="updateFaq" type="submit" id="submit" class="btn btn-primary">수정하기</button>
							<a href="${contextPath}/deleteFaq.mdo?seq=${faqVO.seq}" class="btn btn-danger">삭제하기</a>
							<a href="${contextPath}/faq.mdo" class="btn btn-warning">돌아가기</a>
						</div>
					</div>
				</div>
			</main>
			<jsp:include page="/WEB-INF/admin/footer.jsp"/>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/admin/javascript/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/admin/javascript/datatables-simple-demo.js"></script>
</body>
</html>

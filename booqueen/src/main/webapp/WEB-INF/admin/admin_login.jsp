<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Login - SB Admin</title>
	<link  rel="stylesheet" href="${contextPath}/resources/admin/css/styles.css" >
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
	<form action="${contextPath}/login.mdo" method="post">
		<div id="layoutAuthentication">
			<div id="layoutAuthentication_content">
				<main>
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-5">
								<div class="card shadow-lg border-0 rounded-lg mt-5">
									<div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
									<div class="card-body">
										<div class="form-floating mb-3">
											<input class="form-control" id="inputEmail" name="userId" type="text" placeholder="name@example.com"/>
											<label for="inputEmail">Email address</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="inputPassword" name="password" type="password" placeholder="Password"/>
											<label for="inputPassword">Password</label>
										</div>
										<div class="form-check mb-3">
											<input class="form-check-input" id="inputRememberPassword" type="checkbox" value=""/>
											<label class="form-check-label" for="inputRememberPassword">Remember Password</label>
										</div>
										<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small" href="#">Forgot Password?</a>
											<input type="submit" id="submit" value="로그인">
										</div>
									</div>
									<div class="card-footer text-center py-3"><div class="small">
										<!-- <a href="register.html">  -->
										Need an account? Sign up!
										<!-- </a> -->
									</div></div>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
			<div id="layoutAuthentication_footer">
				<jsp:include page="/WEB-INF/admin/footer.jsp"/>
			</div>
		</div>
	</form>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/admin/javascript/scripts.js"></script>
</body>
</html>
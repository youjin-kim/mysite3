<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link
	href="${pageContext.servletContext.contextPath }/assets/css/user.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/includes/header.jsp" />
		<div id="content">
			<div id="user">

				<form id="update-form" name="updateForm" method="post"
					action="${pageContext.servletContext.contextPath }/user/update">
					<input type='hidden' name="no" value="${authUser.getNo() }">
					<label class="block-label" for="name">이름</label> <input id="name"
						name="name" type="text" value=""> <label
						class="block-label" for="email">이메일</label>
					<h4>${authUser.getEmail() }</h4>

					<label class="block-label">패스워드</label> <input name="password"
						type="password" value="">

					<fieldset>
						<c:choose>
							<c:when test="${authUser.getGender().equals('female') }">
								<legend>성별</legend>
								<label>여</label>
								<input type="radio" name="gender" value="female"
									checked="checked">
								<label>남</label>
								<input type="radio" name="gender" value="male">
							</c:when>
							<c:otherwise>
								<legend>성별</legend>
								<label>여</label>
								<input type="radio" name="gender" value="female">
								<label>남</label>
								<input type="radio" name="gender" value="male" checked="checked">
							</c:otherwise>
						</c:choose>
					</fieldset>

					<input type="submit" value="수정하기">

				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/includes/navigation.jsp" />
		<c:import url="/WEB-INF/views/includes/footer.jsp" />
	</div>
</body>
</html>
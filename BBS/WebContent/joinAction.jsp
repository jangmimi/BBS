<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body> 
	<% 
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserEmail() == null) {
			%>
			<script>
				alert('입력이 안된 사항이 있습니다.')
				history.back();
			</script>
		<%
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);

			if(result == -1) { %>
				<script>
					alert('이미 존재하는 아이디입니다.')
					history.back()
				</script>
			<%
			} else { %>
			<script>
				alert('회원가입 완료!')
				location.href='main.jsp'
			</script>
		<% }
		}%>
</body>
</html>
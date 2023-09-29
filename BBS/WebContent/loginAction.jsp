<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body> 
	<% System.out.println("로그인액션");
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		System.out.println("result = " + result);
		if(result == 1) { %>
		<script>
			location.href='main.jsp'
		</script>
		<%
		} else if(result == 0) {%>
			<script>
				alert('비밀번호가 틀립니다.')
				history.back()
			</script>
		<%
		} else if(result == -1) {%>
			<script>
				alert('존재하지 않는 아이디입니다.')
				history.back()
			</script>
		<%
		} else if(result == -2){ %>
			<script>
				alert('데이터베이스 오류가 발생했습니다.')
				history.back()
			</script>
	<%}%>
</body>
</html>
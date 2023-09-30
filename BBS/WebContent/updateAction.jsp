<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body> 
	<% 
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null) { %>
			<script>
				alert('로그인을 하세요.');
				location.href='login.jsp';
			</script>
	<%	}
		
		int bbsID = 0;
		if(request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0) { %>
			<script>
				alert('유효하지 않은 글입니다.');
				location.href='bbs.jsp';
			</script>
		<%		
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())) { %>
			<script>
				alert('권한이 없습니다.');
				location.href='bbs.jsp';
			</script>
		<%
		} else {
			if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
					|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) {
			%>
				<script>
					alert('입력이 안된 사항이 있습니다.')
					history.back();
				</script>
			<%
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle") , request.getParameter("bbsContent"));

				if(result == -1) { %>
					<script>
						alert('글 수정에 실패했습니다.');
						history.back();
					</script>
				<%
				} else { 
				%>
				<script>
					alert('게시글 수정 완료!');
					location.href='bbs.jsp';
				</script>
			<% 
				}
			}
		} 
		%>
</body>
</html>
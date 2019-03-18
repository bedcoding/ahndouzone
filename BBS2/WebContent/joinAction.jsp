<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title> JSP 게시판 웹 사이트 </title>
</head>

<!-- 실질적으로 사용자의 로그인 시도를 처리 -->
<body>
	<%
		// 이미 로그인이 되어 있는 경우
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	
		// 아무것도 입력 안한 경우
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			
			System.out.println(user.getUserID());
			System.out.println(user.getUserPassword());
			System.out.println(user.getUserName());
			System.out.println(user.getUserGender());
			System.out.println(user.getUserEmail());

			
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();  // DB에 접근할 수 있는 객체 만들기
			int result = userDAO.join(user);  // 위에서 user에 넣은 값들이 여기서 매개변수로 들어감
			if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			
			else {   // 회원가입이 완료되면 메인화면으로 이동
				session.setAttribute("userID", user.getUserID());  // 로그인 성공시 : 세션부여
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	%>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title> 안성민 (더존 이력서 제출용) </title>
        <meta charset="UTF-8">
        
        <!-- 부트스트랩 -->
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/custom.css">
       
        <body>
            <%
                // 로그인이 된 사람은 그 로그인 정보를 담는다
                String userID = null;
                if(session.getAttribute("userID") != null) 
                {
                    userID = (String) session.getAttribute("userID");
                }
                
                // 예시: bbsID가 7이면, 7번째 페이지를 보여줌
                int bbsID = 0;
                if(request.getParameter("bbsID") != null) {
                    bbsID = Integer.parseInt(request.getParameter("bbsID"));
                }
                
                if(bbsID == 0) {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('유효하지 않은 글입니다.')");
                    script.println("location.href = 'bbs.jsp'");
                    script.println("</script>");
                }
                Bbs bbs = new BbsDAO().getBbs(bbsID);
            %>


     <div class="container-fluid">
         <div class="row d-flex d-md-block flex-nowrap wrapper">	    
			<nav class="navbar navbar-default"  style="background-color: #515151;">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="main.jsp" style="color:white"> 안성민 사이트</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav"> 
						<!-- class="active"를 통해 현재 접속한 페이지를 표시한다 -->
						<li>
							<a href="main.jsp" style="color:white">
								<span class="d-none d-md-inline"> 메인화면 </span>
							</a>
						</li>
						
						<li class="active">
							<a href="bbs.jsp">자유게시판</a>
						</li>
						
						<li>
							<a href="http://ggavi2000.cafe24.com/douzone/" style="color:white">포트폴리오</a>
						</li>
					</ul>
					<%
						// 로그인이 되어 있지 않는 경우
						if(userID == null) {
					%>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"  style="color:white"> 회원가입 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="login.jsp"> 로그인 </a></li>
									<li><a href="join.jsp"> 회원가입 </a></li>
								</ul>
							</li>
						</ul>
					<%
						} else {
						// 로그인이 되어 있는 경우
					%>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false" style="color:white"> 회원관리 <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="logoutAction.jsp"> 로그아웃 </a></li>
								</ul>
							</li>
						</ul>
					<%
						}
					%>
				</div>	
			</nav>


                    <!-- 메인 화면 -->
                    <main id="main" class="col-md-12 float-left col px-5 pl-md-5 pt-3 main">
                        <div class="page-header mt-3">
                            <h2> 글 보기 </h2>
                        </div>

                        <div class="pt-3" style="margin: 10px 10px 10px 10px; padding: 15px;">
                                <div class="row">	
                                    <table class="table table-striped" style="text-align; center; border; 1px solid #dddddd;">
                                        
                                        <tbody>
                                            <tr>
                                                <td class="mobile" style="width: 80px;"> 제목 </td>
                                                <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %> </td>
                                            </tr>
                                            
                                            <tr>
                                                <td class="mobile" style="width: 80px;"> 필자 </td>
                                                <td colspan="2"><%= bbs.getUserID() %> </td>
                                            </tr>
                                            
                                            <tr>
                                                <td class="mobile" style="width: 80px;"> 날짜 </td>
                                                <td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %> </td>
                                            </tr>
                                            
                                            <tr>
                                                <!-- 게시물 내용에 특수문자를 넣을 경우 자동변환한다. -->
                                                <td class="mobile" style="width: 80px;"> 내용 </td>
                                                <td colspan="2" style="word-break:break-all; min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %> </td>
                                            </tr>
                                            
                                        </tbody>					
                                    </table>
                                    <a href = "bbs.jsp" class="btn btn-success btn-arrow-left"> 목록 </a> &nbsp;
                                    <%
                                        // 게시물 작성자와 로그인한 계정이 동일인물일 경우 아래 버튼이 추가로 노출된다
                                        if(userID != null && userID.equals(bbs.getUserID())) {
                                    %>
                                            <a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary"> 수정 </a> &nbsp;
                                            <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary"> 삭제 </a>
                                    <%
                                        }
                                    %>
                                                        
                                </div>
                            </div>




                        <br><br><br><br><br>
                        <footer class="text-center">
                            <p> Copyright &copy; 2019 <b>안성민</b> </p> 
                        </footer>

                    </main>
                </div>
            </div>
            <script src="./js/jquery.min.js"></script>
            <script src="./js/popper.min.js"></script>
            <script src="./js/bootstrap.min.js"></script>
        </body>
    </head>
</html>
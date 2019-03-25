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
                
                else //if(userID == null) 
                {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('로그인이 필요합니다.')");
                    script.println("location.href = 'login.jsp'");
                    script.println("</script>");
                }
        
                // 현재 수정하고자 하는 글의 번호가 들어오지 않았을 경우
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
        
                // 수정하기 전에 이 글을 작성한 사람과 동일인물인지 확인
                Bbs bbs = new BbsDAO().getBbs(bbsID);
                if(!userID.equals(bbs.getUserID())) {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('수정할 권한이 없습니다.')");
                    script.println("location.href = 'bbs.jsp'");
                    script.println("</script>");
                }
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
						
						</div>	
					</nav>


                    <!-- 회원가입 메인 화면 -->
                    <main id="main" class="col-md-12 float-left col px-5 pl-md-5 pt-3 main">
                        <div class="page-header mt-3">
                            <h2> 글 수정 </h2>
                        </div>


                        <form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>" class="pt-3">
                            <div class="form-group">
                                <label> 제목 </label>
                                <input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>">
                            </div>

                            <div class="form-group">
                                <label> 내용 </label>
                                <textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent() %> %></textarea>
                            </div>

                            <input type="submit" class="btn btn-primary pull-right" value="글수정">
                        </form>

                        <br><br><br><br><br>
                        <footer class="text-center" >
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
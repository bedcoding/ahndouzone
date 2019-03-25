<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE HTML>
<html>
    <head>
        <title> 안성민 (더존 이력서 제출용) </title>

        <!-- 마우스 커서 갖다대면 밑줄 안생기고 검정으로 바뀜 -->
        <style type="text/css">
            a, a:hover 
            {
                color: #000000;
                text-decoration: none;
            }
        </style>

        <meta charset="UTF-8">

        
        
        <!-- 부트스트랩 -->
		<meta name="viewport" content="width=device-width", initial-scale="1">
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/custom.css">
        
        
        
        
        <body>
        <%
            // 로그인이 된 사람은 그 로그인 정보를 담는다
            String userID = null;
            if(session.getAttribute("userID") != null) {
                userID = (String) session.getAttribute("userID");
            }
            
            // 게시판
            int pageNumber = 1;  // 기본 페이지 : 1페이지
            if(request.getParameter("pageNumber") != null) {
                pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
									<a href="http://ggavi2000.cafe24.com/douzone" style="color:white">포트폴리오</a>
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
			
			
			



					<!-- 게시판 화면 -->
                    <main id="main" class="col-md-12 float-left col px-5 pl-md-5 pt-3 main">
                        <div class="page-header mt-3"> <h2> 자유게시판 </h2> </div>
                        
                        <table class="table table-striped" style="max-width: 1080px">
                            <thead>
                                <tr>
                        			<th class="mobile" style="width: 80px; text-align: center;"> 번호 </th>
                        			<th class="mobile" style="text-align: center;"> 제목 </th>
                        			<th class="mobile" style="width: 90px; text-align: center;"> 작성자 </th>
                        			<th class="mobile" style="width: 200px; text-align: center;"> 날짜 </th>
                                </tr>
                            </thead>
                            
                            <tbody>
                            <%
                                // 게시판
                                BbsDAO bbsDAO = new BbsDAO();
                                ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                                
                                for(int i=0; i<list.size(); i++) {
                            %>
                            
                                <tr>
                                    <td class="mobile" style="text-align: center;"> <%= list.get(i).getBbsID() %> </td>
                                    <td style="text-align: center;"> <a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"> <%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %> </a></td>  <!-- 제목을 누르면 해당 view 페이지로 이동 / 특수문자 들어가도 뜨도록 변환 -->
                                    <td style="text-align: center;"> <%= list.get(i).getUserID() %> </td>
                                    <td class="mobile" style="text-align: center;"> <%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %> </td>
                                </tr>					
                            <%	
                                }
                            %>
                            </tbody>
                        </table>
                        
                        <%
                            // 페이지가 1p가 아니라면 이전 페이지로 돌아가는 버튼이 생성됨
                            if(pageNumber != 1) 
                            {
                        %>
                            	<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left"> 이전 </a>
                        <%	
                            } 
                        
                            // 다음 페이지가 존재한다면 넘어가는 버튼
                            if(bbsDAO.nextPage(pageNumber + 1)) 
                            {
                        %>
                            	<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left"> 다음 </a>
                        <%
                            }
                        %>
                        
                        <%
                            // 로그인이 되어 있지 않는 경우
                            if(userID == null) 
                            {
                        %>
	                            <a href="login.jsp" class="btn btn-primary btn-arrow-left"> 로그인 </a>
                        <%
                            } 
                            
                            else 
                            {
                        %>
                            	<a href="write.jsp" class="btn btn-primary btn-arrow-left"> 글쓰기 </a>
                        <%
                            }
                        %>
                    
                     <br><br><br><br><br>
                     <p> Copyright &copy; 2019 <b>안성민</b> </p> 
                     
                    
                </main>
            </div>
        </div>
        
            <script src="./js/jquery.min.js"></script>
            <script src="./js/popper.min.js"></script>
            <script src="./js/bootstrap.min.js"></script>
        </body>
    </head>
</html>
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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/custom.css">
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
                    
                    <nav class="col-md-2 float-left col-1 p1-0 pr-0 collapse width show" id="sidebar" >
                    <!-- 내비게이션 -->
                    <div class="list-group border-0 card text-center text-md-left">
                            
                            <!-- 메인 버튼 -->
                            <a href="./main.jsp" class="list-group-item d-inline-block collapsed" data-parent="#sideber">
                                <img style="width: 20px;" src="./img/home.svg"> <span class="d-none d-md-inline"> 메인 </span>
                            </a>

                            <!-- 회원관리 버튼 4개 -->
                            <a href="#usermenu" class="list-group-item d-inline-block collapsed" 
                                data-parent="#sidebar" data-toggle="collapse" aria-expanded="false">
                                <img style="width: 20px;" src="./img/user.svg"> <span class="d-none d-md-inline"> 회원 </span>
                            </a>

                            
                            <%
                                // 로그인이 되어 있지 않는 경우
                                if(userID == null) 
                                {
                            %>
                                    <div class="collapse" id="usermenu">
                                        <a href="join.jsp" class="list-group-item" data-parent="#sidebar"> 회원가입 </a>
                                        <a href="login.jsp" class="list-group-item" data-parent="#sidebar"> 로그인 </a>
                                    </div>    
                            <%
                                }
                                
                                else 
                                {
                                    // 로그인이 되어 있는 경우
                            %>
                                    <div class="collapse" id="usermenu">
                                        <!-- <a href="./userEdit.html" class="list-group-item" data-parent="#sidebar"> 회원정보 수정 </a> -->
                                        <a href="logoutAction.jsp" class="list-group-item" data-parent="#sidebar"> 로그아웃 </a>
                                    </div>
                            <%
				                }
			                %>

                            <!-- 자유게시판 버튼 -->
                            <a href="bbs.jsp" class="list-group-item d-inline-block collapsed" data-parent="#sideber">
                                <img style="width: 20px;" src="./img/board.svg"> <span class="d-none d-md-inline"> 게시판 </span>
                            </a>

                            <!-- Q&A 버튼 -->
                            <a href="qna.jsp" class="list-group-item d-inline-block collapsed" data-parent="#sideber">
                                <img style="width: 20px;" src="./img/qna.svg"> <span class="d-none d-md-inline"> Q & A </span>
                            </a>

<!-- 
                            검색 버튼
                            <a href="#search" class="list-group-item d-inline-block collapsed" 
                            data-parent="#sidebar" data-toggle="collapse" aria-expanded="false">
                                <img style="width: 20px;" src="./img/search.svg"> <span class="d-none d-md-inline"> 검색 </span>
                            </a>

                            <div class="collapse" id="search">
                                <div class="input-group p-2" style="background-color: #1c1c1c;">
                                    <input type="text" class="form-control" placeholder="내용을 입력하세요.">
                                </div>
                            </div> 
-->
                        </div>
                    </nav> <!-- 메뉴 버튼 끝 -->






					<!-- 게시판 화면 -->
                    <main id="main" class="col-md-9 float-left col px-5 pl-md-5 pt-3 main">
                        <div class="page-header mt-3"> <h2> 자유게시판 </h2> </div>
                        
                        <table class="table table-striped" style="max-width: 1080px">
                            <thead>
                                <tr>
                        			<th class="mobile" style="width: 80px; text-align: center;"> 번호 </th>
                        			<th style="text-align: center;"> 제목 </th>
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
                                    <td style="text-align: center;"> <%= list.get(i).getBbsID() %> </td>
                                    <td style="text-align: center;"> <a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"> <%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %> </a></td>  <!-- 제목을 누르면 해당 view 페이지로 이동 / 특수문자 들어가도 뜨도록 변환 -->
                                    <td style="text-align: center;"> <%= list.get(i).getUserID() %> </td>
                                    <td style="text-align: center;"> <%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %> </td>
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
	                            <a href="login.jsp" class="btn btn-primary pull-right"> 글쓰기 </a>
                        <%
                            } 
                            
                            else 
                            {
                        %>
                            	<a href="write.jsp" class="btn btn-primary pull-right"> 글쓰기 </a>
                        <%
                            }
                        %>
                    
                     <br><br><br><br><br>
                     <footer class="text-center" style="max-width:1080px;">
                         <p> Copyright &copy; 2019 <b>안성민</b> duzon bizon 이력서 제출용 </p> 
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
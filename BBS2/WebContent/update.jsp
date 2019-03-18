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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/custom.css">
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
                    
                    <nav class="col-md-2 float-left col-1 p1-0 pr-0 collapse width show" id="sidebar" >
                            <!-- 내비게이션 -->
                    <div class="list-group border-0 card text-center text-md-left">
                            
                            <!-- 메인 버튼 -->
                            <a href="main.jsp" class="list-group-item d-inline-block collapsed" data-parent="#sideber">
                                <img style="width: 20px;" src="./img/home.svg"> <span class="d-none d-md-inline"> 메인 </span>
                            </a>

                            <!-- 회원관리 버튼 4개 -->
                            <a href="#usermenu" class="list-group-item d-inline-block collapsed" 
                                data-parent="#sidebar" data-toggle="collapse" aria-expanded="false">
                                <img style="width: 20px;" src="./img/user.svg"> <span class="d-none d-md-inline"> 회원 </span>
                            </a>
                            
                            <div class="collapse" id="usermenu">
                            	<!-- <a href="./userEdit.html" class="list-group-item" data-parent="#sidebar"> 회원정보 수정 </a> -->
                            	<a href="logoutAction.jsp" class="list-group-item" data-parent="#sidebar"> 로그아웃 </a>
                            </div>


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


                    <!-- 회원가입 메인 화면 -->
                    <main id="main" class="col-md-9 float-left col px-5 pl-md-5 pt-3 main">
                        <div class="page-header mt-3">
                            <h2> 글 수정 </h2>
                        </div>
                        <hr>


                        <form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>" class="pt-3" style="max-width:920px;">
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
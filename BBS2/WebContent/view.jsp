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


                    <!-- 메인 화면 -->
                    <main id="main" class="col-md-9 float-left col px-5 pl-md-5 pt-3 main">
                        <div class="page-header mt-3" style="max-width:1080px;">
                            <h2> 글 보기 </h2>
                            <hr>
                        </div>

                        <div class="pt-3" style="max-width:1080px;">
                                <div class="row">	
                                    <table class="table table-striped" style="text-align; center; border; 1px solid #dddddd">
                                        
                                        <tbody>
                                            <tr>
                                                <td style="width: 20%;"> 글 제목 </td>
                                                <td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %> </td>
                                            </tr>
                                            
                                            <tr>
                                                <td> 작성자 </td>
                                                <td colspan="2"><%= bbs.getUserID() %> </td>
                                            </tr>
                                            
                                            <tr>
                                                <td> 작성일자 </td>
                                                <td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %> </td>
                                            </tr>
                                            
                                            <tr>
                                                <!-- 게시물 내용에 특수문자를 넣을 경우 자동변환한다. -->
                                                <td> 내용 </td>
                                                <td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %> </td>
                                            </tr>
                                            
                                        </tbody>					
                                    </table>
                                    <a href = "bbs.jsp" class="btn btn-primary"> 목록 </a> &nbsp;
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
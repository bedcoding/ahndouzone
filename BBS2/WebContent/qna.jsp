<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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

						<!-- 검색 버튼
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
                            <h2> Q & A </h2>
                        </div>
                        <p class="lead"> 그냥 만들어봤습니다... </p>
                        <hr>

                        <div class="panel panel-default">
                            <div class="panel-heading mt-3">
                                <h4 class="paneltitle">
                                    <a data-toggle="collapse" href="#collapse1"> ▷질문1 집이 어디신가요? </a>
                                </h4>
                            </div>

                            <div id="collapse1" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <strong> 음... </strong>
                                  	 센텀 어딘가에 살고 있습니다.
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading mt-3">
                                <h4 class="paneltitle">
                                    <a data-toggle="collapse" href="#collapse2"> ▷질문2 당신은 사람인가요? </a>
                                </h4>
                            </div>

                            <div id="collapse2" class="panel-collapse collapse in">
                                <div class="panel-body">
                                    <strong> 음... </strong>
                                   	 아마 그렇습니다.
                                </div>
                            </div>
                        </div>

                        <br>
                        <div class="alert alert-warning">
                          	  감사합니다.
                        </div>

                        <br><br><br><br><br>
                        <footer class="text-center" style="max-width: 1080px">
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
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
                                <img style="width: 20px;" src="./img/board.svg"> <span class="d-none d-md-inline"> 자유게시판 </span>
                            </a>

                            <!-- Q&A 버튼 -->
                            <a href="http://ggavi2000.cafe24.com/douzone/" class="list-group-item d-inline-block collapsed" data-parent="#sideber">
                                <img style="width: 20px;" src="./img/qna.svg"> <span class="d-none d-md-inline"> 포트폴리오 </span>
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


                    <!-- 메인 화면 -->
                    <main id="main" class="col-md-9 float-left col px-5 pl-md-5 pt-3 main">
                        <div class="page-header mt-3">
                            <h2> 안성민 사이트 </h2>
                        </div>
                        <p class="lead"> 더존 부산지점 입사지원용 </p>
                        <hr> 

                        <!--                         
                            <button class="btn btn-success"> 자세히 알아보기 </button>
                            <div class="width collapse show me-3" aria-expanded="true">
                                <p> 본 사이트는 더존 이력서에 넣기 위해 만든 웹사이트입니다. </p>
                            </div>
                         -->

                        <!-- 메인에 사진 넣기 -->
                        <div id="carousel" class="carousel slide" style="max-width: 1080px;" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel" data-slide-to="1"> </li>
                                <li data-target="#carousel" data-slide-to="2"> </li>
                                <li data-target="#carousel" data-slide-to="3"> </li>
                                <li data-target="#carousel" data-slide-to="4"> </li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="./img/image1.jpg" alt="첫번째 이미지">
                                </div>

                                <div class="carousel-item">
                                    <img class="d-block w-100" src="./img/image2.jpg" alt="두번째 이미지">
                                </div>

                                <div class="carousel-item">
                                    <img class="d-block w-100" src="./img/image3.jpg" alt="세번째 이미지">
                                </div>

                                <div class="carousel-item">
                                        <img class="d-block w-100" src="./img/image4.jpg" alt="네번째 이미지">
                                </div>

                                <div class="carousel-item">
                                        <img class="d-block w-100" src="./img/image5.jpg" alt="다섯번째 이미지">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carousel" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only"> 이전 사진 </span>
                            </a>
                            <a class="carousel-control-next" href="#carousel" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only"> 다음 사진 </span>
                            </a>
                        </div>
                        
                        
                        
                        <br> <br> <br>
                        
                        
                        
                        <!-- 지도 삽입 -->
                        <section style="max-width: 1080px;">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d815.3251526890693!2d129.12560362917986!3d35.17405939876972!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x356892c25142b721%3A0x1f6b71747180cedd!2z67aA7IKw6rSR7Jet7IucIO2VtOyatOuMgOq1rCDsmrDrj5kg7IS87YWA7KSR7JWZ66GcIDc5!5e0!3m2!1sko!2skr!4v1552750594924" 
                            width="100%" height="480px" frameborder="0" style="max-width: 1080px; border:0" allowfullscreen></iframe>
                        </section>
                        
                        <br> <br> <br> <br> <br>
                        <footer class="text-center" style="max-width: 1080px;">
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
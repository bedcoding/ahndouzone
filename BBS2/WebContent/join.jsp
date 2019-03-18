<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
        <title> 안성민 (더존 이력서 제출용) </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/custom.css">
        <body>
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
                                        <a href="join.jsp" class="list-group-item" data-parent="#sidebar"> 회원가입 </a>
                                        <a href="login.jsp" class="list-group-item" data-parent="#sidebar"> 로그인 </a>
                                    </div>    

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
                            <h2> 회원 가입 </h2>
                        </div>
                        <hr>









                        
                        <form method="post" action="joinAction.jsp" class="pt-3" style="max-width:720px;">

                            <div class="form-group">
                                <label> 아이디 </label>
                                <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                            </div>

                            <div class="form-group">
                                <label> 비밀번호 </label>
                                <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
                            </div>

                            <div class="form-group">
                                <label> 이름 </label>
                                <input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
                            </div>
                            
                            <div class="form-group" style="text-align:center;">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary active">
                                        <input type="radio" name="userGender" autocomplete="off" value="남자" checked> 남자
                                    </label>
                                        
                                    <label class="btn btn-primary">
                                        <input type="radio" name="userGender" autocomplete="off" value="여자"> 여자
                                    </label>
                                </div>
                            </div>
            
                            <!-- 
                                <div class="form-group">
                                    <label> 성별 </label>
                                    <select class="form-control">
                                        <option selected> 남성 </option>
                                        <option> 여성 </option>
                                    </select>
                                </div>
                             -->

                            <div class="form-group">
                                <label> 이메일 </label>
                                <input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="50">
                            </div>

                            <!-- <button type="submit" class="btn btn-primary"> 회원가입 </button> -->
                            <input type="submit" class="btn btn-primary form-control" value="회원가입">
                        </form>

                        <br><br><br><br><br>
                        <footer class="text-center" style="max-width:720px;">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
<script src="/resources/js/jquery-3.7.0.js"></script>
<title>비밀번호 변경 또는 찾기</title>
</head>
<body>
  <div id="con" class="find_pw">
    <div id="login">
      <div id="login_form">
        <!--로그인 폼-->
        <form action="/member/find" method="post" id="find-form">
          <div class="logo">
            <a href="/"> <img src="/resources/img/intro/LOGO-gray.png"
              alt="logo">
            </a>
          </div>
          <hr>


          <!--이메일-->
          <p class="input-title">E-mail</p>
          <label> <input type="email" name="email" id="email"
            placeholder="가입하신 이메일주소를 입력해주세요" class="size" required="required">
            <input onclick="fn_idChk();" type="button" value="회원 인증 "
            class="btn">
          </label>
          <!--이메일 인증번호 입력-->
          <p class="input-title">E-mail 인증번호 입력</p>
          <label> <input type="text" class="size" name="checkInput"
            id="checkInput" placeholder="인증번호 6자리를 입력해주세요"
            disabled="disabled" maxlength="6"> <input type="button"
            id="mail-Check-Btn" value="인증번호 전송 " class="btn"> <span
            id="mail-check-warn"></span>
          </label>

          <!--새로운 비밀번호-->
          <p class="input-title">새로운 Password</p>
          <label for="password"> 
          <input name="password" id="password" type="password"
            class="size wide" placeholder="비밀번호는 8이상 12자 이하로 설정바랍니다" required>
            <span class="error-message" id="password_error"></span>
          </label>

          <!--비밀번호 확인-->
          <p class="input-title">새로운 Password 확인</p>
          <label for="confirm_password"> <input id="confirm_password" name="confirm_password" type="password"
            class="size wide" required oninput="validateForm()" placeholder="변경할 비밀번호를 다시 한번 입력하세요"> <span class="error-message"
            id="confirm_password_error"></span>
          </label>

          <!-- 버튼 -->
          <p>
            <input id="register" type="submit" value="비밀번호 변경"
              class="btn w100">
          </p>
        </form>

        <hr>
        <p class="find">
          <span><a href="login">로그인 페이지로 이동</a></span>
        </p>
      </div>
    </div>
  </div>
  <script src="/resources/js/find.js"></script>
</body>
</html>
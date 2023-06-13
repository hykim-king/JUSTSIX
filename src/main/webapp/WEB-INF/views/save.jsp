<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2023-06-08
  Time: 오후 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
<title>회원가입</title>
</head>
<body>
	<div id="con">
		<div id="login">
			<div id="login_form">
				<form action="/member/save" method="post">
					<div class="logo">
						<a href="index.html"> <img src="/resources/img/intro/LOGO-gray.png"
							alt="logo">
						</a>
					</div>
					<hr>
					<!--이메일-->
					<!--로그인 폼-->
					<p class="input-title">E-mail</p>
					<label> <input type="email" name="email"
						placeholder="example@naver.com" class="size" required="required"> <input
						type="button" value="중복확인 " class="btn">
					</label>
					<!--이메일 인증번호 입력-->
					<p class="input-title">E-mail 인증번호 입력</p>
					<label> <input type="text" class="size" required="required"> <input
						type="button" value="인증번호 전송 " class="btn">
					</label>


					<!--비밀번호-->
					<p class="input-title">Password</p>
					<label for="password"> <input
						placeholder="비밀번호는 8이상 12자 이하로 설정바랍니다." type="password"
						class="size wide" id="password" name="password" required>
						<span class="error-message" id="password_error"></span>
					</label>

					<!--비밀번호 확인-->
					<p class="input-title">Password확인</p>
					<label for="confirm_password"> <input type="password"
						class="size wide" id="confirm_password" name="confirm_password"
						required oninput="validateForm()"> <span
						class="error-message" id="confirm_password_error"></span>
					</label>
					<!--이름-->
					<p class="input-title">이름</p>
					<label> <input type="text" class="size wide" name="name"
						required>
					</label>

					<!--이용약관동의-->
					<p class="h-zero input-title">
						이용약관동의 <span><a href="agree.html">[이용약관 자세히 읽기]</a></span>
					</p>


					<!-- 메일수신 -->
					<p class="input-chek">
						<input checked="checked" type="radio" name="mail" value="Y"
							id="m_y" required> <label for="m_y">약관내용을 확인하였으며
							동의합니다</label>
					</p>
					<p class="input-chek">
						<input checked="checked" type="radio" name="mail" value="Y"
							id="m_y" required> <label for="m_y">메일 수신</label>
					</p>
					<p class="input-chek">
						<input type="radio" name="mail" value="N" id="m_n" required>
						<label for="m_n">메일 수신 안 함</label>
					</p>

					<!-- 버튼 -->
					<p>
						<input type="submit" value="회원가입" class="btn w100">
					</p>
				</form>
				<hr>
				<p class="find">
					<span><a href="login">로그인 페이지로 이동</a></span>
				</p>
			</div>
		</div>
	</div>

	<script>
		function validateForm() {
			var password = document.getElementById("password").value;
			var confirm_password = document.getElementById("confirm_password").value;
			var password_error = document.getElementById("password_error");
			var confirm_password_error = document
					.getElementById("confirm_password_error");

			     if (password.trim().length === 0) {
			 password_error.innerHTML = "";
			 } else if (password.length < 8 || password.length > 12) {
			 password_error.innerHTML = "비밀번호는 8이상 12자 이하로 설정바랍니다.";
			 } else {
			 password_error.innerHTML = "";
			 } 

			if (confirm_password.trim().length === 0) {
				confirm_password_error.innerHTML = "";
			} else if (password !== confirm_password) {
				confirm_password_error.innerHTML = "비밀번호가 일치하지 않습니다.";
			} else {
				confirm_password_error.innerHTML = "비밀번호가 일치합니다!";
			}

			if (password_error.innerHTML === ""
					&& confirm_password_error.innerHTML === "") {
				return true;
			} else {
				return false;
			}
		}

		function clearPasswordError() {
			var password_error = document.getElementById("password_error");
			var confirm_password_error = document
					.getElementById("confirm_password_error");

			password_error.innerHTML = "";
			confirm_password_error.innerHTML = "";
		}
	</script>
</body>
</html>

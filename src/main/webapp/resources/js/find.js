//공백 문자 처리 함수
let eUtil = {}
var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // 이메일 정규
// 표현식
var email_Check = false;
var certified_Email = false;
var password_Check = false;
var password_Confirm_Check = false;


// 숫자만 입력되도록 처리
$(".numberOnly").on("keyup", function(e) {
	console.log('numberOnly keyup' + $(this).val());
	// REG EXP
	$(this).val($(this).val().replace(/[^0-9]/g, ""));
}); // numberOnly end------------------------
// str이 비어있으면 true
// 그렇지 않으면 false
eUtil.ISEmpty = function(str) {
	if (str != null && undefined != str) {
		str = str.toString();

		// 공백 제거: " james " -> "james"
		if (str.replace(/ /gi, "").length == 0) {
			return true;
		}
	}

	return false;

}

// 회원여부 확인 체크
function fn_idChk() {
	const email = $('#email').val();
	if (exptext.test(email) == false) {
		// 이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
		alert("이메일 형식이 올바르지 않습니다.");
		$("#email").focus();
	} else {
		$.ajax({
			url : "/member/idChk",
			type : "get",
			dataType : "json",
			data : 'email=' + email,

			success : function(data) {
				if (data == 1) {
					console.log("data : " + data);
					alert("just listen의 회원이십니다");
					email_Check = true;
				} else if (data == 0) {
					$('#mail-Check-Btn').attr('disabled', false);
					console.log("data : " + data);
					alert("가입된 이메일이 아닙니다. 회원가입을 진행해주세요.")
					email_Check = false;
				}
			}

		})
	}
}
// 이메일 인증 버튼
$('#mail-Check-Btn').click(function() {
	const email = $('#email').val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
	const checkInput = $('#checkInput'); // 인증번호 입력하는곳

	$.ajax({
		type : 'get',
		url : "findCheck?email=" + email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		success : function(data) {
			console.log("data : " + data);
			$('#checkInput').attr('disabled', false);
			code = data;
			alert('인증번호가 전송되었습니다.')
		}
	}); // end ajax
}); // end send eamil

// 인증번호 비교
// blur -> focus가 벗어나는 경우 발생
$('#checkInput').blur(function() {
	const inputCode = $(this).val();
	const $resultMsg = $('#mail-check-warn');

	if (inputCode === code) {
		$resultMsg.html('인증번호가 일치합니다.');
		$resultMsg.css('color', 'green');
		$('#mail-Check-Btn').attr('disabled', true);
		$('#email').attr('readonly', true);
		$('#register').attr('disabled', false);
		certified_Email = true;
	} else {
		certified_Email = false;
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
		$resultMsg.css('color', 'red');
	}
});

// 비밀번호 변경 폼 유효성 검사
const form = document.getElementById('find-form');

form.addEventListener('submit', function(event) {
	event.preventDefault(); // 전송 안되게 처리
	$('#register').on("click", function() {
		console.log(email_Check);
		console.log(certified_Email);

		if ((email_Check == true) && (certified_Email == true)) {
			form.submit();
			alert("비밀번호 변경에 성공하였습니다. 변경하신 비밀번호로 재 로그인 해주세요.");
			$("#register").off("click");
		} else {
			alert("인증번호를 재확인 해주십시오.");
			$("#register").off("click");

		}

	});
});

// 비밀번호 관련 로직 처리
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
		$('#register').attr('disabled', true);
		$('.error-message').css('color', 'red');
	} else {
		password_error.innerHTML = "사용가능한 비밀번호 입니다!";
		$('.error-message').css('color', 'green');
		$('#register').attr('disabled', true);

		if (confirm_password.trim().length === 0) {
			confirm_password_error.innerHTML = "";
		} else if (password !== confirm_password) {
			confirm_password_error.innerHTML = "비밀번호가 일치하지 않습니다.";
			$('#register').attr('disabled', true);
			$('.error-message').css('color', 'red');
		} else {
			confirm_password_error.innerHTML = "비밀번호가 일치합니다!";
			$('#register').attr('disabled', false);
			$('.error-message').css('color', 'green');
		}
	}

	if (password_error.innerHTML === ""
			&& confirm_password_error.innerHTML === "") {
		return true;
	} else {
		return false;
	}
}

$('#register').on("click", function() {
	console.log(email_Check);
	console.log(certified_Email);
	if ((email_Check == false) || (certified_Email == false)) {
		alert("이메일 회원인증 및 인증번호를 입력해주세요");
	} else if ((email_Check == true) && (certified_Email == true)) {
		if ((password_Check == true) && (password_Confirm_Check == true)) {
			alert("비밀번호 변경이 완료되었습니다.");
		} else {
			alert("아래 조건에 맞는 비밀번호를 재설정 해주십시오.")
		}

	}
});

function clearPasswordError() {
	var password_error = document.getElementById("password_error");
	var confirm_password_error = document
			.getElementById("confirm_password_error");

	password_error.innerHTML = "";
	confirm_password_error.innerHTML = "";
}
package com.just.six.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.just.six.dto.MemberDTO;
import com.just.six.dto.MessageDTO;
import com.just.six.service.MailSendService;
import com.just.six.service.MemberService;

@Controller
@RequestMapping("/member") // 공통 주소 처리
public class MemberController {

	@Autowired
	MailSendService mailService;

	private final MemberService memberService;

	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	// 이용약관 동의 페이지
	@GetMapping("/agree")
	public String agreeForm() {
		return "agree";
	}

	// 회원 가입 페이지 이동
	@GetMapping("/save")
	public String saveForm() {
		return "save";
	}

	// 비밀번호변경 페이지 이동
	@GetMapping("/find")
	public String findForm() {
		return "find";
	}
	
	@GetMapping("/delete")
	public String delete() {
		return "delete";
	}
	
	// 회원탈퇴 페이지 이동
	@RequestMapping(value = "/delete", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(@ModelAttribute MemberDTO memberDTO, HttpSession session)throws SQLException{
		String jsonString = "";
		int flag = memberService.delete(memberDTO);

		MessageDTO message = new MessageDTO();
		if (flag == 1) {
			message.setMsgId("3");
			message.setMsgContents(memberDTO.getEmail() + "님의 계정이 탈퇴되었습니다.");
			jsonString = new Gson().toJson(message);
			return jsonString;
		} else {
			message.setMsgId("4");
			message.setMsgContents("아이디 또는 비밀번호를 다시 확인해주세요.");
			jsonString = new Gson().toJson(message);
			return jsonString;
		}
	}


	// 비밀번호변경 페이지 에서 로그인 페이지로 이동
	@PostMapping("/find")
	public String find(@ModelAttribute MemberDTO memberDTO) {
		int saveResult = memberService.find(memberDTO);
		System.out.println("saveResult" + saveResult);
		if (saveResult > 0) {
			return "login";
		} else {
			return "save";
		}
	}

	// 회원 가입 페이지 에서 로그인 페이지로 이동
	@PostMapping("/save")
	public String save(@ModelAttribute MemberDTO memberDTO) {
		int saveResult = memberService.save(memberDTO);
		if (saveResult > 0) {
			return "login";
		} else {
			return "save";
		}
	}

	// 회원가입 이메일 인증
	@GetMapping("/**/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}

	// 비밀번호찾기 이메일 인증
	@GetMapping("/**/findCheck")
	@ResponseBody
	public String findCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.findEmail(email);
	}

	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}

	// 로그인  
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		String jsonString = "";
		boolean loginResult = memberService.login(memberDTO);
		MessageDTO message = new MessageDTO();
		if (loginResult) {
			session.setAttribute("loginEmail", memberDTO.getEmail());
			message.setMsgId("1");
			message.setMsgContents(memberDTO.getEmail() + "님 환영합니다!");
			jsonString = new Gson().toJson(message);
			return jsonString;
		} else {
			message.setMsgId("2");
			message.setMsgContents("아이디 또는 비밀번호를 확인해주세요.");
			jsonString = new Gson().toJson(message);
			return jsonString;
		}
	}

	@GetMapping("/")
	public String findAll(Model model) {
		List<MemberDTO> memberDTOList = memberService.findAll();
		model.addAttribute("memberList", memberDTOList);
		return "list";
	}

	// 아이디 중복 체크
	@GetMapping("/**/idChk")
	@ResponseBody
	public int idChk(MemberDTO memberDTO) throws Exception {
		String str = "";
		str = memberDTO.getEmail();
		System.out.println(str);
		int result = memberService.idChk(memberDTO);
		return result;
	}

	// 회원가입 post
	@PostMapping("/**/register")
	public String postRegister(MemberDTO memberDTO) throws Exception {
		int result = memberService.idChk(memberDTO);
		try {
			if (result == 1) {
				return "/register";
			} else if (result == 0) {
				memberService.save(memberDTO);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) throws Exception {
		String referer = request.getHeader("Referer");
		session.invalidate();
		return "redirect:" + referer;
	}
}

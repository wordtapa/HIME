package com.spring.test;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.test.service.memberService;
import com.spring.test.vo.memberVO;


@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private memberService service;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String MoveTojoin() {
		logger.info("MoveTojoin(GET)메소드 실행");
		
		return "member/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(memberVO member) {
		logger.info("join(POST)메소드 실행");
		
		String path = service.join(member);

		logger.info("현재 등록된 사용자 정보: {}", member);
		
		return path;
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(String id) {
		logger.info("idCheck 메소드 실행(POST)");
		
		logger.info("memberId: {}", id);
		
		String result = service.selectMemberId(id);
		if (result == null) {
			return "yes";
		}else {
			return "no";
		}
	}

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		logger.info("login 메소드 실행(GET)");
		
		return "member/login";
	}
	@RequestMapping(value = "/login", method  = RequestMethod.POST)
	public String login(HttpSession session, String id, String password) {
		logger.info("login 메소드 실행(POST)");
		
		logger.info("id: {}" , id);
		logger.info("password: {}", password);
		
		
		String loginId = service.selectMember(id, password);
		logger.info("loginId: {}", loginId);
		
		
		String returnUrl = null;
		if(loginId == null) {
			logger.info("로그인 실패");
			returnUrl = "member/login";
		}else {
			logger.info("로그인 성공");
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			returnUrl = "redirect:/";
		}
		
		return returnUrl;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("logout 메소드 실행(GET)");
		
		session.removeAttribute("id");
		return "redirect:/";
	}
	
	
}

package com.spring.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.dao.memberDAO;
import com.spring.test.vo.memberVO;


@Service
public class memberService {
	
	@Autowired
	private memberDAO dao;
	
	public String join(memberVO member) {
		int result = dao.join(member);
		
		String path;
		if(result == 0) {
			System.out.println("회원가입 실패");
			path = "redirect:/member/join";
		}else {
			System.out.println("회원가입 성공");
			path = "redirect:/";
		}
		
		return path;
	}
	
	public String selectMemberId(String id) {
		return dao.selectMemberId(id);
	}

	public String selectMember(String id, String password) {
		memberVO loginMember = new memberVO();
		loginMember.setId(id);
		loginMember.setPassword(password);

		return dao.selectMember(loginMember);
	}

}

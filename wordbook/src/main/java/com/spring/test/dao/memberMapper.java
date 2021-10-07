package com.spring.test.dao;

import com.spring.test.vo.memberVO;

public interface memberMapper {

	int join(memberVO member);
	
	String selectMemberId(String id);

	String selectMember(memberVO loginMember);
	

}

package com.spring.test.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.test.vo.memberVO;

@Repository
public class memberDAO {
	
	@Autowired
	private SqlSession session;
	
	public int join(memberVO member) {
		int result = 0;
		memberMapper mapper = null;
		
		try {
			mapper = session.getMapper(memberMapper.class);
			result = mapper.join(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	public String selectMemberId(String id) {
		String result = null;
		memberMapper mapper = null;
		
		try {
			mapper = session.getMapper(memberMapper.class);
			result = mapper.selectMemberId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	
	}
	public String selectMember(memberVO loginMember) {
		String result = null;
		memberMapper mapper = null;
		
		try {
			mapper= session.getMapper(memberMapper.class);
			result = mapper.selectMember(loginMember);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

}

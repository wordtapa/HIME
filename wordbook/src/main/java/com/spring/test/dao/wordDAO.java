package com.spring.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.spring.test.vo.wordVO;

@Repository
public class wordDAO {

	@Autowired
	private SqlSession session;

	public ArrayList<wordVO> allList(String id) {
		ArrayList<wordVO> result = null;
		wordMapper mapper = null;

		try {
			mapper = session.getMapper(wordMapper.class);
			result = mapper.allList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int writeWord(wordVO newWord) {
		int result = 0;
		wordMapper mapper = null;

		try {
			mapper = session.getMapper(wordMapper.class);
			result = mapper.writeWord(newWord);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public wordVO readWord(int word_order) {
		wordVO result = null;
		wordMapper mapper = null;

		try {
			mapper = session.getMapper(wordMapper.class);
			result = mapper.readWord(word_order);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int updateWord(wordVO word) {
		int result = 0;
		wordMapper mapper = null;

		try {
			mapper = session.getMapper(wordMapper.class);
			result = mapper.updateWord(word);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int deleteWord(int word_order) {
		int result = 0;
		wordMapper mapper = null;

		try {
			mapper = session.getMapper(wordMapper.class);
			result = mapper.deleteWord(word_order);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public ArrayList<HashMap<String, Object>> getBoardList(HashMap<String, Object> map) {
		ArrayList<HashMap<String, Object>> result = null;
		wordMapper mapper = null;

		try {
			mapper = session.getMapper(wordMapper.class);
			result = mapper.getBoardList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int getTotalCount(String id) {
		int result = 0;
		wordMapper mapper = null;

		try {
			mapper = session.getMapper(wordMapper.class);
			result = mapper.getTotalCount(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int changeFavorite(wordVO word) {
		int result = 0;
		wordMapper mapper = null;

		try {
			mapper = session.getMapper(wordMapper.class);
			result = mapper.changeFavorite(word);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<wordVO> practice(String id) {
		ArrayList<wordVO> result = null;
		wordMapper mapper = null;

		try {
			mapper = session.getMapper(wordMapper.class);
			result = mapper.practice(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	
	  public ArrayList<HashMap<String, Object>> getBoardList1(HashMap<String,Object> map) { 
		  ArrayList<HashMap<String, Object>> result = null; 
		  wordMapper mapper = null;
	  
		 try { 
		  mapper = session.getMapper(wordMapper.class); 
		  result = mapper.getBoardList1(map);
		  
		} catch(Exception e) { 
			e.printStackTrace(); 
		}
		 return result; 
	  }
	  
		public int getTotalCount_1(wordVO p_word) {
			int result = 0;
			wordMapper mapper = null;

			try {
				mapper = session.getMapper(wordMapper.class);
				result = mapper.getTotalCount_1(p_word);
			} catch (Exception e) {
				e.printStackTrace();
			}

			return result;
		}


	

}

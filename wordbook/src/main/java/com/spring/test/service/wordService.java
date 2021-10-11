package com.spring.test.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.test.dao.wordDAO;
import com.spring.test.vo.wordVO;




@Service
public class wordService {
	
	@Autowired
	private wordDAO dao;

	public ArrayList<wordVO> allList(String id) {
		return dao.allList(id);
	}

	public boolean writeWord(String word, String word_kor, String language, String word_sentence, String word_explain,
			String id) {
		wordVO newWord = new wordVO();
		newWord.setId(id);
		newWord.setLanguage(language);
		newWord.setWord(word);
		newWord.setWord_kor(word_kor);
		newWord.setWord_explain(word_explain);
		newWord.setWord_sentence(word_sentence);
		
		
		if (dao.writeWord(newWord) > 0 )
			return true;
		
		else return false;
	}
	
	public wordVO readWord(int word_order) {
		return dao.readWord(word_order);
	}

	public boolean updateWord(wordVO word) {
		if(dao.updateWord(word) > 0)
			return true;
		else
			return false;
	}

	public boolean deleteWord(int word_order) {
		int result = dao.deleteWord(word_order);
		if(result > 0)
			return true;
		else
			return false;
	}

	public int getTotalCount(String id) {
		return dao.getTotalCount(id);
	}

	public ArrayList<HashMap<String, Object>> getBoardList(int startRecord, int countPerPage, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRecord", startRecord);
		map.put("countPerPage", countPerPage);
		map.put("id", id);
		
		return dao.getBoardList(map);
	}

	public int changeFavorite(wordVO word) {
		return dao.changeFavorite(word);
		
	}

	public ArrayList<wordVO> practice(String id) {
		return dao.practice(id);
	}

	
	public ArrayList<HashMap<String, Object>> getBoardList1(int startRecord, int countPerPage, String id){ 
	HashMap<String, Object> map = new HashMap<String,Object>(); 
	map.put("startRecord", startRecord); 
	map.put("countPerPage",countPerPage);
	map.put("id", id);
	  
	return dao.getBoardList1(map); 
	}
	

	public int getTotalCount_1(String id, String favorite) {
		wordVO p_word = new wordVO();
		p_word.setId(id);
		p_word.setFavorite(favorite);
		
		return dao.getTotalCount_1(p_word);
	}


	


	

	

}

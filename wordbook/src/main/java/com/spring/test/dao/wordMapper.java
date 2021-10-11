package com.spring.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.test.vo.wordVO;

public interface wordMapper {

	ArrayList<wordVO> allList(String id);

	int writeWord(wordVO newWord);

	wordVO readWord(int word_order);

	int updateWord(wordVO word);
	
	int deleteWord(int word_order);

	ArrayList<HashMap<String, Object>> getBoardList(HashMap<String, Object> map);

	int getTotalCount(String id);
	
	int getTotalCount_1(wordVO p_word);

	int changeFavorite(wordVO word);

	ArrayList<wordVO> practice(String id);

	ArrayList<HashMap<String, Object>> getBoardList1(HashMap<String, Object> map);



}

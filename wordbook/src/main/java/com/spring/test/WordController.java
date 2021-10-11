package com.spring.test;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.test.service.wordService;
import com.spring.test.util.PageNavigator;
import com.spring.test.vo.wordVO;



@Controller
@RequestMapping(value="/word")
public class WordController {
	
	private static final Logger logger = LoggerFactory.getLogger(WordController.class);
	
	@Autowired
	private wordService service;
	
	@Autowired
	private HttpSession session;
	
	private static final int COUNT_PER_PAGE = 10; // 페이지 당 글 수(ex. 1~10, 11~20, 21~30)
	private static final int PAGE_PER_GROUP = 5; // 그룹 당 페이지 수 (ex. 12345, 678910, 1112)
	
	
	  @RequestMapping(value="/wordList0" , method = RequestMethod.GET) public String
	  wordList(String id, Model model) { logger.info("wordList 메소드 실행(GET)");
	  model.addAttribute("id", id); logger.info("id: {}" , id);
	  
	  ArrayList<wordVO> wordList = service.allList(id);
	  
	  logger.info("wordList: {}", wordList); model.addAttribute("wordList",
	  wordList);
	  
	  
	  return "redirect:/word/paging?=id"+id; }
	 
	
	@RequestMapping(value="/wordList" , method = RequestMethod.GET)
	public String wordList(String id, Model model, int currentPage) {
		logger.info("wordList 메소드 실행(GET)");
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("id", id);
		logger.info("id: {}" , id);
		
		ArrayList<wordVO> wordList = service.allList(id); 
		
		logger.info("wordList: {}", wordList);
		model.addAttribute("wordList", wordList);
		
		
		return "redirect:/word/paging?=id"+id;
	}
	
	@RequestMapping(value = "/paging", method = RequestMethod.GET)
	public String home(@RequestParam(defaultValue = "1") int currentPage, Model model, HttpSession session) {
		logger.info("home 메소드 실행(GET)");
		
	
		logger.info("currentPage: {}", currentPage); // 현재 페이지 번호 출력
		
		String id = (String)session.getAttribute("id");
		int totalRecordsCount = service.getTotalCount(id); // 전체 게시글 수
		logger.info("totalRecordsCount : {}", totalRecordsCount); // 전체 게시글 수 출력		
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, 
				PAGE_PER_GROUP, currentPage, totalRecordsCount); // 페이지 네비게이터 구성 
		model.addAttribute("navi", navi); // jsp로 네비게이터 전달
		
		ArrayList<HashMap<String, Object>> wordList = service.getBoardList(
				navi.getStartRecord(), COUNT_PER_PAGE, id); // 게시글 불러오기
		logger.info("wordList: {}", wordList); // 불러온 게시글 출력
		logger.info("id: {}", id);
		model.addAttribute("wordList", wordList); // jsp로 게시글 전달
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("id",id);
		
		return "word/wordList";
	}
	
	@RequestMapping(value="/writeWord", method =RequestMethod.GET)
	public String writeWord(String id, Model model) {
		logger.info("writeWord 메소드 실행(GET)");
		model.addAttribute("id",id);
		return "word/writeWord";
	}
	
	@RequestMapping(value="/writeWord", method =RequestMethod.POST)
	public String writeMoney(String id, String word, String language, String word_kor, String word_sentence, String word_explain, Model model) {
		logger.info("writeWord 메소드 실행(POST)");
		
		logger.info("word : {}",word);
		logger.info("word_kor : {}",word_kor);
		logger.info("language: {} ", language);
		logger.info("word_sentence: {}", word_sentence);
		logger.info("word_explain: {}", word_explain);
		
		logger.info("id : {}",id);
		boolean result = service.writeWord(word, word_kor, language, word_sentence,word_explain,id);
		
		String returnUrl = null;
		if(result) {
			logger.info("단어 작성 성공!");
			returnUrl = "redirect:/word/wordList0?id=" + id;
		}else {
			logger.info("단어 작성 실패!");
			returnUrl = "word/writeWord";
		}
		return returnUrl;
	}
	
	@RequestMapping(value = "/updateWord", method = RequestMethod.GET)
	public String MoveToupdateWord(int word_order, Model model, int currentPage) {
		logger.info("MoveToupdateWord 메소드 실행(GET)");
		logger.info("word_order: {}", word_order);
		
		wordVO word = service.readWord(word_order);
		model.addAttribute("word", word);
		model.addAttribute("currentPage",currentPage);
		return "word/updateWord";	
	}
	
	@RequestMapping(value = "/updateWord", method = RequestMethod.POST)
	public String updateWord(wordVO word, Model model, int currentPage) {
		logger.info("updateWord 메소드 실행(POST)");
		logger.info("word : {}", word);
		model.addAttribute("currentPage",currentPage);
		String id = word.getId();
		
		boolean result = service.updateWord(word);
		if(result) {
			logger.info("단어 수정 성공.");
		}else {
			logger.info("단어 수정 실패.");
		}
		
		return "redirect:/word/wordList?id="+ id;
	}
	
	@RequestMapping(value = "/deleteWord", method = RequestMethod.GET)
	public String deleteWord(int word_order, int currentPage, Model model) {
		logger.info("deleteWord 메소드 실행(GET)");
		logger.info("word_order : {}", word_order);
		model.addAttribute("currentPage",currentPage);
		String id = (String) session.getAttribute("id");
		logger.info("id: {}", id);
	
		boolean result = service.deleteWord(word_order);
		if(result)
			logger.info("단어 삭제 성공");
		else
			logger.info("단어 삭제 실패");
		
		return "redirect:/word/wordList?id="+ id;
	}
	
	
	@ResponseBody
	@RequestMapping(value ="/favorite", method = RequestMethod.POST)
	public void favorite(int word_order, String favorite) {
		logger.info("favorite 메소드 실행(POST)");
		
		logger.info("word_order: {}", word_order);
		logger.info("favorite : {}", favorite);
		wordVO word= new wordVO();
		word.setWord_order(word_order);
		word.setFavorite(favorite);
		
		int res = service.changeFavorite(word);
		logger.info("res: {}", res);
		
	}
	/*
	 * @RequestMapping(value="/favorite_change", method = RequestMethod.GET) public
	 * HashMap<String, Object> favorite_change() {
	 * 
	 * HashMap<String, Object> map = new HashMap<>(); String favorite_ch =
	 * service.favorite_change();
	 * 
	 * map.put("favorite_ch", favorite_ch);
	 * 
	 * return map; }
	 */
	
	@RequestMapping(value="/practice" , method = RequestMethod.GET)
	public String practice(String id, Model model) {
		logger.info("practice 메소드 실행(GET)");
		
		model.addAttribute("id", id);
		logger.info("id: {}" , id);
		
		ArrayList<wordVO> wordList = service.practice(id); 
		
		logger.info("wordList1: {}", wordList);
		model.addAttribute("wordList", wordList);
		
		
		return "redirect:/word/paging1";
	}
	
	
	@RequestMapping(value = "/paging1", method = RequestMethod.GET)
	public String p_home(@RequestParam(defaultValue = "1") int currentPage, Model model, HttpSession session) {
		logger.info("p_home 메소드 실행(GET)");
		
		
		logger.info("currentPage: {}", currentPage); // 현재 페이지 번호 출력
		
		String id = (String)session.getAttribute("id");
		String favorite=(String)session.getAttribute("favorite");
		
		int totalRecordsCount = service.getTotalCount_1(id,favorite); // 전체 게시글 수
		logger.info("totalRecordsCount : {}", totalRecordsCount); // 전체 게시글 수 출력		
		PageNavigator navi = new PageNavigator(COUNT_PER_PAGE, 
				PAGE_PER_GROUP, currentPage, totalRecordsCount); // 페이지 네비게이터 구성 
		model.addAttribute("navi", navi); // jsp로 네비게이터 전달
		
		
		ArrayList<HashMap<String, Object>> wordList = service.getBoardList1(
				navi.getStartRecord(), COUNT_PER_PAGE, id); // 게시글 불러오기
		logger.info("wordList: {}", wordList); // 불러온 게시글 출력
		logger.info("id: {}", id);
		model.addAttribute("wordList", wordList); // jsp로 게시글 전달
		
		return "practice/practice";
	}
	
}

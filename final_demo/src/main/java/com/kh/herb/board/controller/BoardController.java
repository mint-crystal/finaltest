package com.kh.herb.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.board.model.service.BoardService;
import com.kh.herb.board.model.vo.Board;

@Controller
public class BoardController {
	@Autowired
	private BoardService bs;
	
	@RequestMapping("test.do")
	public ModelAndView test(ModelAndView mav) {
		mav.setViewName("test");
		return mav;
	}
	
	@RequestMapping("cktest.do")
	public ModelAndView cktest(ModelAndView mav) {
		mav.setViewName("cktest");
		return mav;
	}
	
	@RequestMapping(value="cktest.do", method=RequestMethod.POST)
	public ModelAndView insertBoard(ModelAndView mav, Board board) throws Exception{
		int result = bs.insertBoard(board);
		mav.setViewName("board/boardList");
		return mav;
	}
	
	@RequestMapping("boardList.do")
	public ModelAndView boardList(ModelAndView mav) throws Exception{
		List<Board> boardList = bs.boardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("board/boardList");
		return mav;
	}
	
	@RequestMapping("boardDetail.do")
	public ModelAndView selectBoard(ModelAndView mav, int num) throws Exception{
		Board board = bs.selectBoard(num);
		mav.addObject("board", board);
		mav.setViewName("board/boardDetail");
		return mav;
	}
}

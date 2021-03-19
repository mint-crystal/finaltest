package com.kh.herb.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.board.model.dao.BoardDAO;
import com.kh.herb.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO bdao;
	
	@Override
	public int insertBoard(Board board) throws Exception {
		return bdao.insertBoard(board);
	}

	@Override
	public List<Board> boardList() throws Exception {
		return bdao.boardList();
	}

	@Override
	public Board selectBoard(int num) throws Exception {
		return bdao.selectBoard(num);
	}

}

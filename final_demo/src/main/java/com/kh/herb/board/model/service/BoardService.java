package com.kh.herb.board.model.service;

import java.util.List;

import com.kh.herb.board.model.vo.Board;

public interface BoardService {
	public int insertBoard(Board board) throws Exception;
	public List<Board> boardList() throws Exception;
	public Board selectBoard(int num) throws Exception;
}

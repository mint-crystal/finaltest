package com.kh.herb.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.board.model.vo.Board;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public BoardDAO() {}
	
	public int insertBoard(Board board) throws Exception{
		int result = sqlSession.insert("Board.insertBoard", board);
		return result;
	}
	
	public List<Board> boardList() throws Exception{
		List<Board> boardList = sqlSession.selectList("Board.boardList");
		return boardList;
	}
	
	public Board selectBoard(int num) throws Exception{
		Board board = sqlSession.selectOne("Board.selectBoard", num);
		return board;
	}
}

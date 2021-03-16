package com.kh.herb.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.herb.member.model.vo.Member;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MemberDAO() {}
	
	public Member loginMember(Member member) throws Exception{
		member = sqlSession.selectOne("Member.loginMember", member);
		return member;
	}
	
	public int insertMember(Member member) throws Exception{
		int result = sqlSession.insert("Member.insertMember", member);
		return result;
	}

	public int updateMember(Member member) throws Exception{
		int result = sqlSession.update("Member.updateMember", member);
		return result;
	}
	
	public int deleteMember(String userId) throws Exception{
		int result = sqlSession.update("Member.deleteMember", userId);
		return result;
	}
	
	public Member selectMember(String userId) throws Exception{
		Member member = sqlSession.selectOne("Member.selectMember", userId);
		return member;
	}
	
	public String findId(Member member) throws Exception{
		String result = sqlSession.selectOne("Member.findId", member);
		return result;
	}
	
	public String findPw(Member member) throws Exception{
		String userPw = sqlSession.selectOne("Member.findPw", member);
		return userPw;
	}
}

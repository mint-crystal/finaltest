package com.kh.herb.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.herb.member.model.dao.MemberDAO;
import com.kh.herb.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO mdao;

	@Override
	public Member loginMember(Member member) throws Exception {
		return mdao.loginMember(member);
	}

	@Override
	public int insertMember(Member member) throws Exception {
		return mdao.insertMember(member);
	}

	@Override
	public int updateMember(Member member) throws Exception {
		return mdao.updateMember(member);
	}

	@Override
	public int deleteMember(String userId) throws Exception {
		return mdao.deleteMember(userId);
	}

	@Override
	public Member selectMember(String userId) throws Exception {
		return mdao.selectMember(userId);
	}

	@Override
	public String findId(Member member) throws Exception {
		return mdao.findId(member);
	}

	@Override
	public String findPw(Member member) throws Exception {
		return mdao.findPw(member);
	}

}

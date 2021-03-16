package com.kh.herb.member.model.service;

import java.util.List;

import com.kh.herb.member.model.vo.Member;

public interface MemberService {
	public Member loginMember(Member member) throws Exception;
	public int insertMember(Member member) throws Exception;
	public int updateMember(Member member) throws Exception;
	public int deleteMember(String userId) throws Exception;
	public Member selectMember(String userId) throws Exception;
	public String findId(Member member) throws Exception;
	public String findPw(Member member) throws Exception;
}

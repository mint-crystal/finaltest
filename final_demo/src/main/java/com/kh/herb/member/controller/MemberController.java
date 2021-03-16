package com.kh.herb.member.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.herb.member.model.service.MemberService;
import com.kh.herb.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping("index.do")
	public String index() throws Exception {
		return "index";
	}
	
	@RequestMapping(value="memberLogin.do")
	public ModelAndView loginPage(ModelAndView mav) {
		mav.setViewName("member/memberLogin");
		return mav;
	}
	
	@RequestMapping(value="memberLogin.do", method=RequestMethod.POST)
	public ModelAndView memeberLogin(ModelAndView mav, @RequestParam String userId, @RequestParam String userPw, HttpSession session) throws Exception {
		System.out.println("id : "+userId);
		System.out.println("pw : "+userPw);
		
		Member member =  new Member();
		member.setUserId(userId);
		member.setUserPw(userPw);
		member = ms.loginMember(member);
		session.setAttribute("member", member);
		session.setAttribute("userPw", userPw); //회원탈퇴시 비밀번호 확인을 위한 용도
		mav.addObject("member", member);
		mav.setViewName("member/memberLoginComplete");
		return mav;
	}
	
	@RequestMapping("memberLogout.do")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("memberIns.do")
	public String memberInsPage(){
		return "member/memberIns";
	}
	
	@RequestMapping(value="memberIns.do", method=RequestMethod.POST)
	public ModelAndView insertMember(ModelAndView mav, Member member) throws Exception {
		int result = ms.insertMember(member);
		mav.addObject("result", result);
		mav.setViewName("member/memberInsComplete");
		return mav;
	}
	
	@RequestMapping("memberUpt.do")
	public ModelAndView memberUptPage(ModelAndView mav, Member member, HttpSession session) throws Exception {
		member = (Member)session.getAttribute("member");
		mav.addObject("member", member);
		mav.setViewName("member/memberUpt");
		return mav;
	}
	
	@RequestMapping(value="memberUpt.do", method=RequestMethod.POST)
	public ModelAndView updateMember(ModelAndView mav, Member member, HttpSession session) throws Exception{
		int result = ms.updateMember(member);
		session.setAttribute("member", member);
		mav.addObject("result", result);
		mav.setViewName("member/memberUptComplete");
		return mav;
	}
	
	@RequestMapping("memberDel.do")
	public String memberDelPage() {
		return "member/memberDel";
	}
	
	@RequestMapping(value="memberDel.do", method=RequestMethod.POST)
	public ModelAndView deleteMember(ModelAndView mav, @RequestParam String userId, HttpSession session, Member member, @RequestParam String userPw) throws Exception {
//		System.out.println("세션 비밀번호 : "+session.getAttribute("userPw"));
//		System.out.println("입력 비밀번호 : "+userPw);
//		System.out.println("아이디 : "+userId);
		
		int result = 0;
		
		//세션에 저장된 비밀번호 값과 비교
		if(userPw.equals((String) session.getAttribute("userPw"))) {
			result = ms.deleteMember(userId);	
			session.invalidate();
		}
		
		mav.addObject("result", result);
		mav.setViewName("member/memberDelComplete");
		return mav;
	}
	
	//아이디 중복체크
	@RequestMapping("idCheck.do")
	@ResponseBody
	public String idCheck(String userId) throws Exception {
		Member member = ms.selectMember(userId);
		
		JSONObject jsonData = new JSONObject();
		if(member==null) 
			jsonData.put("idDup", "");
		else
			jsonData.put("idDup", "dup");
		return jsonData.toJSONString();
	}
	
	@RequestMapping("findId.do")
	public String findIdPage() {
		return "member/findId";
	}
	
	@RequestMapping(value="findId.do", method=RequestMethod.POST)
	public ModelAndView findId(ModelAndView mav, Member member) throws Exception{
		String result = ms.findId(member);
		mav.addObject("member", result);
		mav.setViewName("member/findIdSuccess");
		return mav;
	}
	
	@RequestMapping("findPw.do")
	public String findPwPage() {
		return "member/findPw";
	}
	
	@RequestMapping(value="findPw.do", method=RequestMethod.POST)
	public ModelAndView findPw(ModelAndView mav, Member member) throws Exception{
		String userPw = ms.findPw(member);
		mav.addObject("userPw", userPw);
		mav.setViewName("member/findPwSuccess");
		return mav;
	}
}

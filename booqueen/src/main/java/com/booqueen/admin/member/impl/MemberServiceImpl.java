package com.booqueen.admin.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booqueen.admin.member.BlockUserVO;
import com.booqueen.admin.member.MemberService;
import com.booqueen.admin.member.MemberVO;
import com.booqueen.admin.member.UserAgeGroupVO;
import com.booqueen.admin.member.UserVO;
import com.booqueen.user.member.vo.MemberProfileVO;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberVO getAdminMember(MemberVO vo) {
		return memberDAO.getAdminMember(vo);
	}

	@Override
	public List<com.booqueen.user.member.vo.MemberVO> getUserMember() {
		return memberDAO.getUserMember();
	}
	
	@Override
	public List<UserAgeGroupVO> selectUserAgeGroupList() {
		return memberDAO.selectUserAgeGroupList();
	}
	
	@Override
	public List<UserVO> getUserGender() {
		return memberDAO.getUserGender();
	}
	
	@Override
	public List<UserVO> getUserInfoDetail(String userid) {
		return memberDAO.getUserInfoDetail(userid);
	}
	
	@Override
	public MemberProfileVO getProfileByUserid(String userid) {
		return memberDAO.getProfileByUserid(userid);
	}
	
	@Override
	public List<BlockUserVO> selectBlockUserList() {
		return memberDAO.selectBlockUserList();
	}
	
	@Override
	public int  updateBlockUser(int sequence) {
		return memberDAO.updateBlockUser(sequence);
	}
	
	@Override
	public BlockUserVO selectBlockUserVO(int sequence) {
		return memberDAO.selectBlockUserVO(sequence);
	}
	
}

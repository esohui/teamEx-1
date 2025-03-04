package com.booqueen.admin.member;

import java.util.List;

import com.booqueen.user.member.vo.MemberProfileVO;

public interface MemberService {

	public MemberVO getAdminMember(MemberVO vo);
	public List<com.booqueen.user.member.vo.MemberVO> getUserMember();
	public List<UserAgeGroupVO> selectUserAgeGroupList();
	public List<UserVO> getUserGender();
	public List<UserVO> getUserInfoDetail(String userid);
	public MemberProfileVO getProfileByUserid(String userid);
	public List<BlockUserVO> selectBlockUserList();
	public int  updateBlockUser(int sequence);
	public BlockUserVO selectBlockUserVO(int sequence);
	
}

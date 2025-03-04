package com.booqueen.admin.partner;

import java.util.List;

import com.booqueen.admin.hotel.HotelVO;

public interface PartnerService {

	public List<com.booqueen.admin.partner.PartnerVO> getPartnerMember();
	public int blockPartner(PartnerVO vo);
	List<PartnerVO> selectBlockPartnerList();
	public int unblockPartner(PartnerVO vo);
	List<HotelVO> selectHotelByEmail(String email);
}

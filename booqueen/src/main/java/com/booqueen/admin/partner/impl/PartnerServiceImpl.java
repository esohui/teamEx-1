package com.booqueen.admin.partner.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.booqueen.admin.hotel.HotelVO;
import com.booqueen.admin.partner.PartnerService;
import com.booqueen.admin.partner.PartnerVO;

@Service
public class PartnerServiceImpl implements PartnerService {

	@Autowired
	private PartnerDAO partnerDAO;
	
	@Override
	public List<com.booqueen.admin.partner.PartnerVO> getPartnerMember() {
		return partnerDAO.getPartnerMember();
	}
	
	@Override
	public int blockPartner(PartnerVO vo) {
		return partnerDAO.blockPartner(vo);
	}
	
	@Override
	public List<PartnerVO> selectBlockPartnerList() {
		return partnerDAO.selectBlockPartnerList();
	}
	
	@Override
	public int unblockPartner(PartnerVO vo) {
		return partnerDAO.unblockPartner(vo);
	}
	
	@Override
	public List<HotelVO> selectHotelByEmail(String email) {
		return partnerDAO.selectHotelByEmail(email);
	}
	
	public PartnerVO selectPartnerByEmail(String email) {
		return partnerDAO.selectPartnerByEmail(email);
	}
}

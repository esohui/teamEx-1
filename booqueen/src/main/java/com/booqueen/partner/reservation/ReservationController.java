package com.booqueen.partner.reservation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.booqueen.partner.hotel.HotelService;
import com.booqueen.partner.hotel.HotelVO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

@Controller
public class ReservationController {
	
	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private ReservationService reservationService;
	
	//예약 내역(페이징 처리 추가)
	@RequestMapping(value = "/reservation.pdo")
	public String getReservationList(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage, 
									@ModelAttribute("hotel")HotelVO hotel, Model model, HttpSession session) {
		
		try {
			hotel = hotelService.getHotelByMemberEmail(session.getAttribute("email").toString());
			int listCount = reservationService.getListCount(hotel.getSerialnumber());	//전체 게시물 수
			PagingVO paging = Pagination.getPagingVO(currentPage, listCount);
			List<ReservationVO> reservation = reservationService.selectReservationPagingByHotelSerial(hotel.getSerialnumber(), paging);
			model.addAttribute("paging", paging);
			model.addAttribute("reservation", reservation);
			model.addAttribute("hotel", hotel);
		} catch(Exception e) {
			e.printStackTrace();
		}		
		return "search-reservation";
	}
	
	//예약 상세보기 페이지
	@RequestMapping(value = "/details.pdo", method = RequestMethod.GET)
	public String getReservationDetails(@ModelAttribute("hotel")HotelVO hotel, @RequestParam("reservation_number")int reservation_number, Model model, HttpSession session) {
		try {
			hotel = hotelService.getHotelByMemberEmail(session.getAttribute("email").toString());
			if(hotel != null) {
				ReservationDetailVO details = reservationService.selectReservationDetailByRSVN(reservation_number);
				
				ReportUserVO search = new ReportUserVO();
				search.setSerialnumber(hotel.getSerialnumber());
				search.setUserid(details.getUserid());
				try {
					ReportUserVO report = reservationService.selectReportedUser(search);
					model.addAttribute("report", report);
				} catch(Exception e) {
					System.out.println("no report record");
				}
				
				model.addAttribute("details", details);
				model.addAttribute("hotel", hotel);
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "reservation-details";
	}
	
	//조건 검색(예약일, 체크인 일자 기준)
	@RequestMapping(value = "/searchByCondition.pdo", method = RequestMethod.GET)
	public String selectReservationListByCondition(@RequestParam(value="currentPage", required=false, defaultValue="1")int currentPage,
									@RequestParam(value="condition")String condition, SearchVO search, HotelVO hotel, Model model, HttpSession session) {
		try {
			hotel = hotelService.getHotelByMemberEmail(session.getAttribute("email").toString());
			if(hotel != null) {
				int listCount = reservationService.getListCount(hotel.getSerialnumber());	//전체 게시물 수
				System.out.println("총 게시글 수 : " + listCount);
				PagingVO paging = Pagination.getPagingVO(currentPage, listCount);
				System.out.println(paging.toString());
				search.setSerialnumber(hotel.getSerialnumber());
				search.setCondition(condition);
				System.out.println(search.toString());
				List<ReservationVO> reservation = reservationService.selectReservationListOnCondition(search, paging);
				model.addAttribute("paging", paging);
				model.addAttribute("reservation", reservation);
				model.addAttribute("hotel", hotel);
				System.out.println(reservation.toString());
				System.out.println(model.toString());
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "search-reservation";
	}
	
	@RequestMapping(value = "/selectReservationInfo.pdo", method = RequestMethod.POST)
	@ResponseBody
	public ReservationVO selectReservationInfo(@RequestBody ReservationVO vo) {
		ReservationVO reservation = reservationService.selectReservationDetailByUserId(vo);
		//예약 정보 불러오기(예약번호 컬럼 추가 필요함)
		return reservation;
	}
	
	//체크인 처리
	@RequestMapping(value = "/updateCheckInStatus.pdo", method = RequestMethod.POST)
	@ResponseBody
	public String updateCheckInStatus(@RequestBody ReservationVO reservation) {
		int updateNumber = reservationService.updateCheckInStatus(reservation);
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		String result = "";
		if(updateNumber == 0) {
			jsonObject.addProperty("msg", "FAIL");
			result = gson.toJson(jsonObject);
		} else {
			jsonObject.addProperty("msg", "SUCCESS");
			result = gson.toJson(jsonObject);
		}
		
		return result;
	}
	
	@RequestMapping(value = "/updateCheckOutStatus.pdo", method = RequestMethod.POST)
	@ResponseBody
	public String updateCheckOutStatus(@RequestBody ReservationVO reservation) {
		int updateNumber = reservationService.updateCheckoutStatus(reservation);
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		String result = "";
		if(updateNumber == 0) {
			jsonObject.addProperty("msg", "FAIL");
			result = gson.toJson(jsonObject);
		} else {
			jsonObject.addProperty("msg", "SUCCESS");
			result = gson.toJson(jsonObject);
		}
		return result;
	}
	
	@RequestMapping(value = "/selectReservationByRSVN.pdo", method = RequestMethod.GET)
	@ResponseBody
	public ReservationVO selectReservationByRSVN(@RequestParam("searchKeyword")int searchKeyword, HttpSession session) {
		HotelVO hotel = hotelService.getHotelByMemberEmail(session.getAttribute("email").toString());
		SearchVO search = new SearchVO();
		search.setSerialnumber(hotel.getSerialnumber());
		search.setReservation_number(searchKeyword);
		ReservationVO searchResult = reservationService.selectReservationByRSVN(search);
		return searchResult;
	}
	
	@RequestMapping(value = "reportUser.pdo", method = RequestMethod.POST)
	@ResponseBody
	public String reportUser(@RequestBody ReportUserVO reportUser, HttpSession session) {
		HotelVO hotel = hotelService.getHotelByMemberEmail(session.getAttribute("email").toString());
		reportUser.setSerialnumber(hotel.getSerialnumber());
		reportUser.setHotelname(hotel.getHotelname());
		System.out.println(reportUser.toString());
		
		int insertNumber = 0;
		String result = "";
		
		insertNumber = reservationService.reportUser(reportUser);
		
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonObject();
		
		if(insertNumber == 0) {
			jsonObject.addProperty("msg", "FAIL");
			result = gson.toJson(jsonObject);
		} else {
			jsonObject.addProperty("msg", "SUCCESS");
			result = gson.toJson(jsonObject);
		}
		
		
		return result;
	}
}

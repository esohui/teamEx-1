package com.booqueen.partner.room;

import java.util.HashMap;
import java.util.List;

import com.booqueen.partner.hotel.HotelImageVO;
import com.booqueen.partner.hotel.HotelServiceVO;

public interface RoomService {

	public void addRoom(RoomVO vo);
	
	public RoomVO getIdBySerial(int serial);

	public FacilitiesBasicVO getBasicInfoByRoomId(int room_id);

	public FacilitiesBathVO getBathInfoByRoomId(int room_id);

	public FacilitiesMediaVO getMediaInfoByRoomId(int room_id);

	public FacilitiesViewVO getViewInfoByRoomId(int room_id);

	public FacilitiesAccessVO getAccessInfoByRoomId(int room_id);

	public FacilitiesServiceVO getServiceInfoByRoomId(int room_id);

	public void updateHotelService(HotelServiceVO service);

	public void updateFaciliteisBasic(FacilitiesBasicVO basic);

	public void updateFacilitiesAccess(FacilitiesAccessVO access);

	public void updateFacilitiesMedia(FacilitiesMediaVO media);

	public void updateFacilitiesView(FacilitiesViewVO view);

	public void updateFacilitiesBath(FacilitiesBathVO bath);

	public void updateFacilitiesService(FacilitiesServiceVO service);

	public List<RoomVO> getRoomByHotelSerial(int serialnumber);

	public void insertRoomAvailable(HashMap<String, Object> setPrice);

	public List<RoomAvailableVO> selectRoomAvailable(int room_id);

	public HotelImageVO selectImageBySerial(int serialnumber);
	
	public List<HotelImageVO> deleteImageBySerial(int serialnumber);

	public List<UpdateImageVO> selectRoomImageBySerial(int serialnumber);
	
	public int insertRoomImage(UpdateImageVO vo);
	
	public List<UpdateImageVO> selectTypeBySerial(int serialnumber);
	
	public List<RoomVO> selectRoom_idBySerial(RoomVO vo);

	public List<RoomVO> selectRoomListByHotelSerial(int serialnumber);

	public RoomVO getRoomAvailableByRoomType(RoomVO room);

	public RoomAvailableVO selectRoomIdByType(RoomAvailableVO vo);

	public List<RoomVO> getRoomListByHotelSerial(int searchSerial);

	public RoomVO getRoomIdByRoomType(RoomVO search);

	public int deleteRoomFromAvailable(RoomAvailableVO roomAvailable);

	public RoomVO selectRoomByRoomType(RoomVO room);

	public int insertNewRoom(RoomVO room);

	public void insertRoomBasic(int room_id);

	public void insertRoomAccess(int room_id);

	public void insertRoomService(int room_id);

	public void insertRoomBath(int room_id);

	public void insertRoomFood(int room_id);

	public void insertRoomMedia(int room_id);

	public void insertRoomView(int room_id);

}
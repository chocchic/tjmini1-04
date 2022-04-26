package com.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.domain.CartnProdVO;
import com.shop.domain.CouponVO;
import com.shop.domain.MemberCVO;

public interface KakaoMapper {

	public int getSumCart(Long mnum);

	public int getCartCount(Long mnum);
	
	public CouponVO getCoupon(Long cnum);
	
	public long getOrdSeq(Long mnum);

	public void removeAllCart(Long mnum);

	public void removeCoupon(Long cnum);

	public void deleteOrd(Long onum);

	public void setOrdSeq(@Param("onum")Long onum, @Param("mem")MemberCVO vo, @Param("ofee")int ofee,@Param("cpwon")int cpwon, @Param("total_amount")int t);

	public List<CartnProdVO> getOD(Long mnum);

	public int addDoder(@Param("mnum") Long mnum,@Param("onum")Long onum, @Param("vo") CartnProdVO vo);
	
	public void addOder(@Param("otype")String otype, @Param("onum")Long onum);
	
	public void updateMem(@Param("mnum")Long mnum, @Param("sum")int sum);
}

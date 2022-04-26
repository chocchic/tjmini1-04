package com.shop.service;

import com.shop.domain.KakaoPayApprovalVO;
import com.shop.domain.MemberCVO;

public interface KakaoPayService {
	// 결제 준비 처리
	public String kakaoPayReady(MemberCVO vo1, Long cnum);
		
	// 결제 승인 요청
	public KakaoPayApprovalVO kakaoPayApprove(String pg_token);

	public int registerOrd(KakaoPayApprovalVO vo);
}

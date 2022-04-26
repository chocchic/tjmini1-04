package com.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.domain.KakaoPayApprovalVO;
import com.shop.domain.MemberCVO;
import com.shop.service.KakaoPayService;

@Controller
@RequestMapping("/kakao/*")
public class KakaoController {
	@Autowired
	private KakaoPayService service;
	
	@GetMapping("kakaoPay")
	public String kakaoPay(MemberCVO vo, @RequestParam("cpnum")Long cnum) {
		System.out.println("kakaoPay Post 요청");
		// 자바를 통해서 kakao api에서 제공한 주소로 http 요청
		System.out.println("mem : " + vo);
		String responseURL = service.kakaoPayReady(vo, cnum);
		// 서비스 처리 결과중 카카오 페이지 준비 결과에 따른 이동할 페이지 주소로 redirect해주기
		// 위에서 리턴받은 페이지 주소로 redirect:
		return "redirect:" + responseURL; // 주소연결
	}
	// 준비 요청성공시 실행될 요청 메서드
	// 파라미터로 넘어오는 pg_token 받고
	@GetMapping("kakaoPaySuccess")
	public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
		System.out.println("kakaoPaySuccess.......");
		System.out.println("pg_token : "+ pg_token);
		// 결제 승인 요청(pg_token 전달하면서)
		KakaoPayApprovalVO orderVO = service.kakaoPayApprove(pg_token);
		// db detail 에 카트에 있는 상품 별로 추가
		// cart에 있는 mnum이 같은거 전부 삭제
		// order에 mem으로 하나의 record 추가
		// 사용한 쿠폰 있으면 삭제
		int product = service.registerOrd(orderVO);
		
		model.addAttribute("onum",orderVO.getPartner_order_id());
		model.addAttribute("count", product);
	}
}

package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.MemberVO;
import com.project.domain.ProductVO;
import com.project.mapper.SelectedMapper;

@Service
public class SelectedServiceImpl implements SelectedService{
	@Autowired
	private SelectedMapper selectedM; 
	
	@Override
	public List<ProductVO> likeSelect() {
		List<ProductVO> list = selectedM.likeSelect();
		//메인 페이지에 노출 시킬 상품 정보를 반환해주는 likeSelect매퍼 메서드를 호출해주고 반환 받은 객체를 변수에 저장...
		return list;
	}

	@Override
	public List<ProductVO> getMemRecomm() {
		//회원이 선택한 영양소 정보 가져오기
		MemberVO vo = selectedM.getMemRecomm();
		List<ProductVO> list=null;
		if(vo.getMnutr1() != null || vo.getMnutr2() != null || vo.getMnutr3() != null) {
			list= selectedM.getRecommProd(vo);
		}
		return list;
		
	}

	@Override
	public List<ProductVO> getStarProd() {
		List<ProductVO> list = selectedM.starSelect();
		return list;
	}



}

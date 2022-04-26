package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.ReviewVO;
import com.project.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewMapper reviewM;

	@Override
	public void register(ReviewVO vo) {
		int result = reviewM.insert(vo);
		System.out.println("register result : " + result);
		
	}


	@Override
	public ReviewVO get(Integer rnum) {
		return reviewM.read(rnum);
	}


	@Override
	public float getStarAvg(Integer pnum) {
		return reviewM.getStarAvg(pnum);
	}

	@Override
	public void saveStar(float starAvg, Integer pnum) {
		reviewM.updateStar(starAvg, pnum);

	}

	@Override
	public void modify(ReviewVO vo) {
		reviewM.update(vo);
	}

	//글 하나 삭제
	@Override
	public int remove(Integer rnum) {
		return reviewM.delete(rnum);
	}

	//관리자 리뷰 리스트 
	@Override
	public List<ReviewVO> getAdminList(Integer pnum) {
		return reviewM.getAdminList(pnum);
	}


	@Override
	public List<ReviewVO> myReviewList() {
		return reviewM.myReviewList();
	}
	
	
	
	

}

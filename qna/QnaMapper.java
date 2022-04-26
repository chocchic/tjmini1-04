package com.qna.mapper;

import java.util.List;

import com.qna.domain.QnaVO;

public interface QnaMapper {

	//문의 등록 
	public void insert(QnaVO vo);

	//나의 문의 리스트 
	public List<QnaVO> getList(Integer qmnum);

	//문의 목록 하나 가져오기 
	public QnaVO read(Integer qnum);

	//문의 수정하기 
	public void update(QnaVO vo);

	//문의 삭제 
	public int delete(Integer qnum);


}

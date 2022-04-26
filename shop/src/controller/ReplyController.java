package com.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop.service.ReplyService;
import com.shop.domain.Criteria;
import com.shop.domain.PageDTO;
import com.shop.domain.ReviewVO;
import com.shop.domain.QnaVO;
import com.shop.domain.ReplyPageDTO;
import com.shop.domain.ReplyPageDTO2;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/")
@Log4j
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	/*
//		consumes : 브라우저에서 요청시 지정한 content-type과 일치해야함. 
//		produces : 서버에서 브라우저에 리턴해주는 데이터의 형태
//					브라우저에서 요청시 지정한 accept 요청헤더값과 일치 
//	*/

//	// 특정 상품의 리뷰 목록 확인 (댓글 전체) 
	@GetMapping(value="/r/{pnum}/{page}",
			produces = { MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDTO> getReviewList(
			@PathVariable("page") int page,
			@PathVariable("pnum") Long pnum) {
		
		log.info("getReviewList 요청!!!!");
		
		Criteria cri = new Criteria(page, 10); 
		log.info("new cri " + cri);
		
		return new ResponseEntity<>(replyService.getReviewListPage(pnum, cri), HttpStatus.OK); 
		
	}
	// 특정 상품의 문의 목록 확인 (댓글 전체) 
		@GetMapping(value="/q/{pnum}/{page}",
				produces = { MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE })
		public ResponseEntity<ReplyPageDTO2> getQnaList(
				@PathVariable("page") int page,
				@PathVariable("pnum") Long pnum) {
			
			log.info("getQnaList 요청!!!!");
			
			Criteria cri = new Criteria(page, 10); 
			log.info("new cri " + cri);
			
			return new ResponseEntity<>(replyService.getQnaListPage(pnum, cri), HttpStatus.OK); 
			
		}

		
	// 리뷰 삭제 
		@DeleteMapping(value="/r/{rnum}")
//		@is~ // 작성자와 같은 아이디로 로그인 했을경우 & 관리자인 경우만
		public ResponseEntity<String> removeR(@PathVariable("rnum") Long rno) {
			log.info("remove : " + rno);
			return replyService.removeReview(rno) == 1 ? 
					new ResponseEntity<>("success", HttpStatus.OK) : 
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
		}
	
	// 문의 삭제 
		@DeleteMapping(value="/q/{qnum}")
//		@is~ // 작성자와 같은 아이디로 로그인 했을경우 & 관리자인 경우만
		public ResponseEntity<String> removeQ(@PathVariable("qnum") Long rno) {
			log.info("remove : " + rno);
			return replyService.removeQna(rno) == 1 ? 
					new ResponseEntity<>("success", HttpStatus.OK) : 
					new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
		}	

}

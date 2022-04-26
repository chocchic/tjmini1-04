package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.ProductVO;
import com.project.service.SelectedService;

@Controller
@RequestMapping("/main/*")
public class SelectedController {
	@Autowired
	private SelectedService selectedS;
	
	
	@GetMapping("select")
	public void select(Model model) {
		model.addAttribute("recommList",selectedS.likeSelect());		
	}
	
	@GetMapping("nuselect")
	public String nuSelect(Model model) { 
		List<ProductVO> list = null; 
		if (isAuthenticated()) {//여기 트루 값이 오면 로그인이 된거. 
			//여기에서 서비스호출 .. 두개를 만들
			//serviceS.getRecommProd(Integer mnum); //이때 아이디가 필요하니 던져주기. 시큐리티에서 멤넘 뽑는거 찾아기 하
			//브이오 달라고 하고 엠넘을 디비에 있는 걸로 타이핑해서 넘겨서 테스트 해보기 . 
			
			list = selectedS.getMemRecomm(); //시큐리티로 mnum 뽑아오기. list = selectedS.getRecommProd(Integer mnum); 일단 테스트는 내가 mnum값 넣기.
		    model.addAttribute("recommList", list); //jsp페이지에서 recommList으로 썸네일, 이름 뽑기..
		    return "/main/nuSelect";	
	    }
		//로그인안했다. 
		 list = selectedS.getStarProd(); 
		   model.addAttribute("recommList", list); //랜덤하게 뽑아주기 (별점순..?
		   return "/main/randomselect";
	}
	
	private boolean isAuthenticated() { //로그인 됐는지 여부 트루 폴스로 리턴해준다. 
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	    if (authentication == null || AnonymousAuthenticationToken.class.
	      isAssignableFrom(authentication.getClass())) {
	        return false;
	    }
	    return authentication.isAuthenticated();
	}
	
	@GetMapping("testselect") //회원 정보가 없어서 일단 테스트 용으로 내가 mnum줘서 가져오기.. 
	public String testSelect(Model model) { 
		List<ProductVO> list = null; 
			list = selectedS.getMemRecomm(); //시큐리티로 mnum 뽑아오기. list = selectedS.getRecommProd(Integer mnum); 일단 테스트는 내가 mnum값 넣기.
		    model.addAttribute("recommList", list); //jsp페이지에서 recommList으로 썸네일, 이름 뽑기..
		    return "/main/nuselect";	
	    }


}

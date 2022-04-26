package com.shop.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shop.domain.AddressVO;
import com.shop.domain.Criteria;
import com.shop.domain.MemberCVO;
import com.shop.domain.PageDTO;
import com.shop.service.ShopService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/shop/*")
@Log4j
public class ShopController {

	// 브라우저 -> C -> S -> M -> DB 
	
	@Autowired
	private ShopService shopService; 
		
	@GetMapping("list") // list 요청시 pageNum, listQty 가 들어와야함.
	public void list(Criteria cri, Model model) {
		//로그인 했는지 확인하여 하트 눌렀는지 여부 확인할 수 있을만한 값 넘겨주기
		//model.addAttribute("heart", shopService.getHeart(mnum));
		//정기구독도 보여줄지 말지
		model.addAttribute("list", shopService.getCateList(cri));
		int total = shopService.getCateTotal(cri);
		
		System.out.println("controller total :" + total );
		model.addAttribute("pageMaker", new PageDTO(cri, total));	
	}
	
	@GetMapping("content")
	public void content(@RequestParam("pnum") Long pnum, @ModelAttribute("cri")Criteria cri, Model model) {
		model.addAttribute("shop", shopService.get(pnum));
		model.addAttribute("sold", shopService.getSold(pnum));
		model.addAttribute("reviewcount", shopService.getReviewCount(pnum));
		model.addAttribute("reviewlist",shopService.getReview(pnum));
		model.addAttribute("qnacount", shopService.getQnaCount(pnum));
		model.addAttribute("qnalistt",shopService.getQna(pnum));
	}
	
	@GetMapping("cart")
	//public void cart(@AuthenticationPrincipal User user, Model model) {
	public void cart(Model model) {
		/*if(user!=null) {
			String mid = user.getUsername();
		    Long mnum = shopService.findMnum(mid);
			model.addAttribute("cart", shopService.getCart(mnum));
		}*/
		Long mnum = new Long(75);
		model.addAttribute("cart", shopService.getCart(mnum));
		model.addAttribute("member", shopService.getMem(mnum));
		model.addAttribute("coupon",shopService.getCoupons(mnum));
		model.addAttribute("addrs",shopService.getAddrs(mnum));
	}
	
	@GetMapping("updatecart")
	public String updatecart(@RequestParam("pnum")Long pnum, @RequestParam("quantity")int quantity,Model model) {
		Long mnum = new Long(75);
		if(shopService.updateCart(quantity, pnum, mnum) > 0) {
			System.out.println("updated");
			return "redirect:/shop/cart";
		}else {
			return "/shop/list";
		}
	}
	
	@GetMapping("deletecart")
	//public void cart(@AuthenticationPrincipal User user, Model model) {
	public String deletecart(Model model, @RequestParam("pnum")Long pnum) {
		/*if(user!=null) {
			String mid = user.getUsername();
		    Long mnum = shopService.findMnum(mid);
			model.addAttribute("cart", shopService.getCart(mnum));
		}*/
		Long mnum = new Long(75);
		shopService.removeCart(mnum, pnum);
		return "redirect:/shop/cart";
	}
	
	@GetMapping("addcart")
	public String addCart(@RequestParam("pnum") Long pnum ,RedirectAttributes rttr) {
    //public String addCart(@RequestParam("pnum") Long pnum , @AuthenticationPrincipal User user, RedirectAttributes rttr) {
		//if(user != null) {
        //	String mid = user.getUsername();
        //	Long mnum = shopService.findMnum(mid);
			Long mnum = 75L;
        	if(shopService.findCart(pnum,mnum)==1) {
        		shopService.updateCart(1, pnum,mnum);
        		rttr.addFlashAttribute("result", "addCart success");
        	}else {
        		shopService.addCart(pnum, mnum);
        		rttr.addFlashAttribute("result", "add to Heart success");
        	}
        //}else {
       // 	rttr.addFlashAttribute("result", "no user info");
       // }
        
        rttr.addFlashAttribute("result", "addCart success");
        
        return "redirect:/shop/list";
    }
	
	@GetMapping("addheart")
	public String addHeart(@RequestParam("pnum") Long pnum ,RedirectAttributes rttr) {
    //public String addHeart(@RequestParam("pnum") Long pnum , @AuthenticationPrincipal User user, RedirectAttributes rttr) {
        //if(user != null) {
        //	String mid = user.getUsername();
        //	Long mnum = shopService.findMnum(mid);
			Long mnum = 75L;
        	if(shopService.findHeart(pnum,mnum)>1) {
        		shopService.removeHeart(pnum,mnum);
        		rttr.addFlashAttribute("result", "remove from Heart success");
        	}else {
        		shopService.addHeart(pnum, mnum);
        		rttr.addFlashAttribute("result", "add to Heart success");
        	}
       // }else{
        	rttr.addFlashAttribute("result", "no user info");
     //   }
        
        return "redirect:/shop/list";
    }
	
	@GetMapping("order") // cpnum=0&is_default=Y&mnum=75&alias=
	//public void checkout(@AuthenticationPrincipal User user, Model model) {
	public void checkout(@RequestParam("cpnum")Long cnum,@RequestParam("is_default") String is_default,
			@RequestParam("alias")String alias, Model model) {
		Long mnum = new Long(75);
			MemberCVO vo = shopService.getMem(mnum);			
		if(is_default.equals("N")) {
			AddressVO avo = shopService.getAddr(mnum, alias);
			vo.setMname(avo.getRep());
			vo.setMpnum(avo.getPnum());
			vo.setMtel(avo.getReptel());
			vo.setMaddr(avo.getAddr());
		}	
		model.addAttribute("member", vo);
		model.addAttribute("coupon",shopService.getCoupon(cnum));
		model.addAttribute("total",shopService.getSumCart(mnum));
	}
		
}

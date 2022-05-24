package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		
		// 全体記事の数を取得、ページングに反映
		int pageCount = service.getArticlesCount();

		log.info("list");
		model.addAttribute("list", service.getAllArticle(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, pageCount));
	}
	
	// GET方式でアクセスした場合
	@GetMapping("/register")
	public void register() {
		
		log.info("register");
	}
	
	// POST方式でアクセスした場合
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("register: " + board);
		
		service.registerArticle(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		
		return "redirect:/board/list";
	}
	
	@GetMapping({"/read", "/modify"})
	public void readOrModify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/read or /modify");
		model.addAttribute("board", service.getArticle(bno));
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		log.info("modify: " + board);
		
		if (service.modifyArticle(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addFlashAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());

		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		log.info("remove: " + bno);
		
		if (service.removeArticle(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addFlashAttribute("pageNum", cri.getPageNum());
		rttr.addFlashAttribute("amount", cri.getAmount());
		
		return "redirect:/board/list";
	}
	
}

package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
//XML設定を使う場合
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	@Test
	public void testExists() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	/*
	@Test
	public void testRegister() {
		
		BoardVO board = new BoardVO();
		board.setTitle("登録タイトル");
		board.setContent("登録コンテンツ");
		board.setWriter("新規作成者");
		
		service.registerArticle(board);
		
		log.info("生成された記事の番号: " + board.getBno());
	}
	*/
	
	@Test
	public void testGetAllArticles() {
		
		Criteria cri = new Criteria();
		//pageNum, amount 設定
		cri.setPageNum(1);
		cri.setAmount(10);
		
		service.getAllArticle(cri).forEach(board -> log.info(board));
	}
	
	@Test
	public void testGetArticle() {
		
		log.info(service.getArticle(3L));
	}
	
	@Test
	public void testModifyArticle() {
		
		long bno = 13;
		
		BoardVO board = service.getArticle(bno);
		
		if (board == null) {
			return;
		}
		
		board.setTitle("修正されたタイトル");
		log.info("MODIFY RESULT: " + service.modifyArticle(board));
	}
	
	@Test
	public void testRemoveArticle() {
		
		long bno = 11;
		
		log.info("REMOVE RESULT: " + service.removeArticle(bno));
	}
}

package org.zerock.persistence;

import java.util.List;

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
public class BoardMapperTests {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
	/* tbl_boardテーブルのデーター確認
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	*/

	/* insert テスト
	@Test
	public void testInsert() {
		
		BoardVO board = new BoardVO();
		board.setTitle("追加タイトル");
		board.setContent("追加コンテンツ");
		board.setWriter("新規作成者");
		
		mapper.insert(board);
		
		log.info(board);
	}
	*/
	
	/* insertSelectKey テスト
	@Test
	public void testInsertSelectKey() {
		
		BoardVO board = new BoardVO();
		board.setTitle("追加タイトル_SelectKey");
		board.setContent("追加コンテンツ_SelectKey");
		board.setWriter("新規作成者");
		
		mapper.insertSelectKey(board);
		
		log.info(board);
	}
	*/
	
	/*
	@Test
	public void testRead() {
		// 必ずboardテーブルに存在するbnoを指定する
		int bno = 2;
		
		BoardVO board = mapper.readArticle(bno);
		
		log.info(board);
	}
	*/
	
	/* delete テスト 
	@Test
	public void testDelete() {
		// 存在するbnoを指定すれば1、なければ0を返却する
		int bno = 12;
		
		log.info("DELETE COUNT: " + mapper.deleteArticle(bno));
	}
	*/
	
	/* update テスト
	@Test
	public void testUpdate() {
		// 必ずboardテーブルに存在するbnoを指定する		
		int bno = 11;
		
		// bno=11の記事を取得後、タイトル・コンテンツ・作成者を修正する
		BoardVO board = mapper.readArticle(bno);
		board.setTitle("更新タイトル");
		board.setContent("更新コンテンツ");
		board.setWriter("作成者更新");
		
		int count = mapper.updateArticle(board);
		log.info("UPDATE COUNT: " + count);
	}
	*/
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		//pageNum, amount 設定
		cri.setPageNum(1);
		cri.setAmount(10);
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}
}

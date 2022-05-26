package org.zerock.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
//XML設定を使う場合
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {
	
	private Long[] bnoArr = { 24L, 25L, 26L };
	
	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper mapper;
	
	@Test
	public void TestMapper() {
		
		log.info(mapper);
	}
	
	/* コメント投稿テスト
	@Test
	public void TestInsert() {
		
		IntStream.range(1, 10).forEach(i -> {
			
			ReplyVO vo = new ReplyVO();
			
			// コメント投稿に必要な情報
			vo.setBno(bnoArr[i % 3]);
			vo.setReply("コメント投稿テスト " + i);
			vo.setReplyer("replyer " + i);
			
			mapper.insert(vo);
		});
	}
	*/
	
	/* 単一コメント照会テスト
	@Test
	public void TestRead() {
		
		Long targetRno = 8L;
		
		ReplyVO vo = mapper.readOne(targetRno);
		
		log.info(vo);
	}
	*/
	
	/* コメント削除テスト
	@Test
	public void TestDelete() {
		
		Long targetRno = 9L;
		
		log.info("DELETE COUNT : " + mapper.delete(targetRno));
	}
	*/
	
	/* コメント更新テスト
	@Test
	public void TestUpdate() {
		
		Long targetRno = 8L;
		
		ReplyVO vo = mapper.readOne(targetRno);
		
		vo.setReply("更新したコメント");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT : " + count);
	}
	*/
	
	@Test
	public void testList() {
		
		Criteria cri = new Criteria();
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		
		replies.forEach(reply -> log.info(reply));
	}
}

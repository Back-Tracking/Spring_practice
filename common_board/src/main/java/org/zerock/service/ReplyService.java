package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReplyService implements ReplyServiceImpl {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Override
	public int registerComment(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("コメント登録を行います。" + vo);
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO getOneComment(long rno) {
		// TODO Auto-generated method stub
		
		log.info("単一コメントを取得します。" + rno);
		
		return mapper.readOne(rno);
	}

	@Override
	public int modifyComment(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("コメント修正を行います。" + vo);
		
		return mapper.update(vo);
	}

	@Override
	public int removeComment(long rno) {
		// TODO Auto-generated method stub
		
		log.info("コメント削除を行います。" + rno);
		
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getCommentList(Criteria cri, long bno) {
		// TODO Auto-generated method stub
		
		log.info("記事に紐づくコメントリストを取得します。" + bno);
		
		return mapper.getListWithPaging(cri, bno);
	}
	
}

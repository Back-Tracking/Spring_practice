package org.zerock.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {

	// コメント登録	
	public int insert(ReplyVO vo);
	
	// コメント削除
	public int delete(long rno);
	
	// コメント修正
	public int update(ReplyVO vo);
	
	// 単一コメント取得
	public ReplyVO readOne(long bno);
	
	// ページング済みコメントリスト取得
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") long bno);
}

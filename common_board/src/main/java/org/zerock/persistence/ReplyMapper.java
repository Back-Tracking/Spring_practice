package org.zerock.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public int delete(long rno);
	
	public int update(ReplyVO vo);
	
	public ReplyVO readOne(long bno);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") long bno);
}
package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

	//annotation style : @Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public void insertArticle(BoardVO board);
	
	public void insertArticleSelectKey(BoardVO board);
	
	public BoardVO readArticle(long bno);
	
	public int deleteArticle(long bno);
	
	public int updateArticle(BoardVO board);

}

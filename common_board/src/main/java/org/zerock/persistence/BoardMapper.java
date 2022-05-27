package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

	// 記事リスト取得
	//annotation style : @Select("select * from tbl_board where bno > 0")
	public List<BoardVO> getList();
	
	// ページング済み記事リスト取得
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	// 記事数取得
	public int getArticlesCount();
	
	// 記事登録
	public void insertArticle(BoardVO board);
	
	// 記事登録（番号指定）
	public void insertArticleSelectKey(BoardVO board);
	
	// 単一記事取得
	public BoardVO readArticle(long bno);
	
	// 記事削除
	public int deleteArticle(long bno);
	
	// 記事修正
	public int updateArticle(BoardVO board);

}

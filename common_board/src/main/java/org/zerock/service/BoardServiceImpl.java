package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardServiceImpl {

  /**
   * 記事登録メソッド
   * 引数として受け取った記事オブジェクトをDBに登録する
   * @param　BoardVO 記事オブジェクト
   */
	public void registerArticle(BoardVO board);
	
  /**
   * 記事取得メソッド
   * 特定の記事番号を持つ記事を取得する
   * @param　bno 記事番号
   * @return BoardVO 記事オブジェクト
   */
	public BoardVO getArticle(Long bno);
	
  /**
   * 記事修正メソッド
   * 特定の記事番号を持つ記事のデーターを修正する
   * @param　BoardVO 記事オブジェクト
   * @return bool 結果フラグ
   */
	public boolean modifyArticle(BoardVO board);
	
  /**
   * 記事削除メソッド
   * 特定の記事番号を持つ記事のデーターを削除する
   * @param　bno 記事番号
   * @return bool 結果フラグ
   */
	public boolean removeArticle(Long bno);
	
  /**
   * 記事リスト取得メソッド
   * 全体記事のオブジェクトを取得する
   * @return List<BoardVO> 記事リスト
   */
	public List<BoardVO> getAllArticle();
}

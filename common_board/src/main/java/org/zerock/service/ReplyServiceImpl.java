package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyServiceImpl {

  /**
   * コメント登録メソッド
   * 引数として受け取ったコメントオブジェクトをDBに登録する
   * @param　vo コメントオブジェクト
   */
	public int registerComment(ReplyVO vo);

  /**
   * 単一コメント取得メソッド
   * 特定のコメント番号を持つコメントを取得する
   * @param　rno コメント番号
   */
	public ReplyVO getOneComment(long rno);

  /**
   * コメント修正メソッド
   * 引数として受け取ったコメントオブジェクトのデーターを修正する
   * @param　vo コメントオブジェクト
   */
	public int modifyComment(ReplyVO vo);

  /**
   * コメント削除メソッド
   * 特定のコメント番号を持つコメントを削除する
   * @param　rno コメント番号
   */
	public int removeComment(long rno);

  /**
   * コメントリスト取得メソッド
   * 特定の記事に紐づいたコメントのリストを取得する
   * @param　cri ページングオブジェクト
   * @param　bno 記事番号
   */
	public List<ReplyVO> getCommentList(Criteria cri, long bno);
}

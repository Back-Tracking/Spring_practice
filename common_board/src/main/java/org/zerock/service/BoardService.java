package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.persistence.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardService implements BoardServiceImpl {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public void registerArticle(BoardVO board) {
		// TODO Auto-generated method stub
		
		log.info("記事登録を行います。" + board);
		
		mapper.insertArticleSelectKey(board);
	}

	@Override
	public BoardVO getArticle(Long bno) {
		// TODO Auto-generated method stub
		
		log.info("番号に該当する記事の取得を行います。記事番号: " + bno);
		
		return mapper.readArticle(bno);
	}

	@Override
	public boolean modifyArticle(BoardVO board) {
		// TODO Auto-generated method stub
		
		log.info("該当する記事データーの修正を行います。記事番号: " + board.getBno());
		
		return mapper.updateArticle(board) == 1;
	}

	@Override
	public boolean removeArticle(Long bno) {
		// TODO Auto-generated method stub
		
		log.info("番号に該当する記事データーの削除を行います。記事番号: " + bno);
		
		return mapper.deleteArticle(bno) == 1;
	}

	@Override
	public List<BoardVO> getAllArticle(Criteria cri) {
		// TODO Auto-generated method stub
		
		/* ページング無しのSQL
		log.info("全体記事を取得します。");
		
		List<BoardVO> articles = mapper.getList();
		*/
		
		// ページング有りのSQL
		log.info("ページングデータを用いて記事リストを取得します。criteria : " + cri);
		
		return mapper.getListWithPaging(cri);
	}

}

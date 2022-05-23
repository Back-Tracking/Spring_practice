package org.zerock.domain;

import lombok.Data;

@Data
public class PageDTO {
	
	// 1ページごと表示する記事数
	final double COUNT_PER_PAGE = 10.0;
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	public PageDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / COUNT_PER_PAGE)) * (int) COUNT_PER_PAGE;
		this.startPage = this.endPage - ((int) COUNT_PER_PAGE - 1);
		
		int realEnd = (int) (Math.ceil( (total * 1.0) / cri.getAmount() ));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
	}
}

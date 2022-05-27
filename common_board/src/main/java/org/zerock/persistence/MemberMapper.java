package org.zerock.persistence;

import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String userid);
}

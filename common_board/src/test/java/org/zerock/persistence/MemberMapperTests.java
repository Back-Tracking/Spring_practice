package org.zerock.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
//XML設定を使う場合
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})

public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	/*
	@Test
	public void testInsertMember() {
		
		String sql = "insert into tbl_member(userid, userpw, username) values (?,?,?)";
		
		for(int i=0; i < 30; i++) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(2, pwencoder.encode("pw" + i));
				
				if(i < 20) {
					pstmt.setString(1, "user"+i);
					pstmt.setString(3, "一般ユーザー"+i);
				} else if(i < 26) {
					pstmt.setString(1, "manager"+i);
					pstmt.setString(3, "マネージャー"+i);
				} else {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(3, "管理者"+i);
				}
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				
				if(pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
				if(conn != null) { try { conn.close(); } catch (Exception e) {} }
			}
		}
	}
	*/
	
	@Test
	public void testInsertAuth() {
		
		String sql = "insert into tbl_member_auth (userid, auth) values (?,?)";

		for(int i=0; i < 30; i++) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				
				if (i < 20) {
					pstmt.setString(1, "user"+i);
					pstmt.setString(2, "ROLE_USER");
				} else if (i < 26) {
					pstmt.setString(1, "manager"+i);
					pstmt.setString(2, "ROLE_MEMBER");					
				} else {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(2, "ROLE_ADMIN");					
				}
				
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();				
			} finally {
				
				if(pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
				if(conn != null) { try { conn.close(); } catch (Exception e) {} }				
			}
		}
	}
	
}

package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.DBManager;
import dto.MemberDTO;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<MemberDTO> list = new ArrayList<>();
	MemberDTO mDto;
	int result;
	
	//1.아이디로 정보가져오기
	public List<MemberDTO> listMemberID(String id) {
		try {
			conn = DBManager.getConnection();
			
			String sql = "SELECT * FROM SHOPMEMBER WHERE shopid = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs= pstmt.executeQuery();
			
			list.clear();
			while(rs.next()) {
				id = rs.getString("shopid");
				String shoppw = rs.getString("shoppw");
				String shopname = rs.getString("shopname");
				String shopzipcode = rs.getString("shopzipcode");
				String shopaddr1 = rs.getString("shopaddr1");
				String shopaddr2 = rs.getString("shopaddr2");
				String shopphone = rs.getString("shopphone");
				String shopemail = rs.getString("shopemail");
				Date regdate = rs.getDate("regdate");
				
				MemberDTO mDto = new MemberDTO(id, shoppw, shopname, shopzipcode, shopaddr1, shopaddr2, shopphone, shopemail, regdate);
				list.add(mDto);
			}
			
			for (MemberDTO memberDTO : list) {
				System.out.print(memberDTO.getShopid());
				System.out.print(memberDTO.getShoppw());
				System.out.print(memberDTO.getShopname());
				System.out.print(memberDTO.getShopzipcode());
				System.out.print(memberDTO.getShopaddr1());
				System.out.print(memberDTO.getShopaddr2());
				System.out.print(memberDTO.getShopphone());
				System.out.print(memberDTO.getShopemail());
				System.out.print(memberDTO.getRegdate());
				System.out.println();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;	
	}
	
	//2. 아이디랑 비번 됬을때 정보가져오기
	public MemberDTO ckLogin(String id, String pw) {
		try {
			conn = DBManager.getConnection();
			String sql = "SELECT * FROM shopmember WHERE shopid = ? AND shoppw = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			list.clear();
			
			while (rs.next() == true) {
				System.out.println("값이 있습니다");
				System.out.println("rs 값 id: " + rs.getString("shopid"));
				System.out.println("rs 값 pw: " + rs.getString("shoppw"));
				System.out.println("rs 값 name: " + rs.getString("shopname"));
				System.out.println("rs 값 zip: " + rs.getString("shopzipcode"));
				System.out.println("rs 값 addr1: " + rs.getString("shopaddr1"));
				System.out.println("rs 값 addr2: " + rs.getString("shopaddr2"));
				System.out.println("rs 값 phone: " + rs.getString("shopphone"));
				System.out.println("rs 값 email: " + rs.getString("shopemail"));
				System.out.println("rs 값 regdate: " + rs.getString("regdate"));
				
				String shopid = rs.getString("shopid");
				String shoppw = rs.getString("shoppw");
				String shopname = rs.getString("shopname");
				String shopzipcode = rs.getString("shopzipcode");
				String shopaddr1 = rs.getString("shopaddr1");
				String shopaddr2 = rs.getString("shopaddr2");
				String shopphone = rs.getString("shopphone");
				String shopemail = rs.getString("shopemail");
				Date regdate = rs.getDate("regdate");
				
				mDto = new MemberDTO(shopid, shoppw, shopname, shopzipcode, shopaddr1, shopaddr2, shopphone, shopemail, regdate);
				
				System.out.println("id: " + mDto.getShopid());
				System.out.println("pw: " + mDto.getShoppw());
				System.out.println("name: " + mDto.getShopname());
				System.out.println("zip: " + mDto.getShopzipcode());
				System.out.println("addr1: " + mDto.getShopaddr1());
				System.out.println("addr2: " + mDto.getShopaddr2());
				System.out.println("phone: " + mDto.getShopphone());
				System.out.println("email: " + mDto.getShopemail());
				
			} /*else if (rs.next() == false) {
				System.out.println("값이 없습니다");
			}*/
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mDto;
	}
	
	//3.로그인됬을때 정보 수정업데이트하기
	public int memberUpdate(MemberDTO mDto) {
		try {
			conn = DBManager.getConnection();
			
			String sql = "UPDATE shopmember "
					+ "SET shoppw = ?, shopname = ?, shopzipcode = ?, shopaddr1 = ?, shopaddr2 = ?, shopphone = ?, shopemail = ? "
					+ "WHERE shopid = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mDto.getShoppw());
			pstmt.setString(2, mDto.getShopname());
			pstmt.setString(3, mDto.getShopzipcode());
			pstmt.setString(4, mDto.getShopaddr1());
			pstmt.setString(5, mDto.getShopaddr2());
			pstmt.setString(6, mDto.getShopphone());
			pstmt.setString(7, mDto.getShopemail());
			pstmt.setString(8, mDto.getShopid());
			
			result = pstmt.executeUpdate();
			
			if(result > 0) {
				System.out.println("수정하였습니다");
			}else {
				System.out.println("수정실패하였습니다");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
			
		}
		return result;
	}
	
	
	//.4 회원가입 등록하기
	public int memberInsert(MemberDTO mDto) {
		
		try {
			conn = DBManager.getConnection();
			
			String sql = "INSERT INTO shopmember (shopid, shoppw, shopname, shopzipcode, shopaddr1, shopaddr2, shopphone, shopemail) "
					+ "VALUES (?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mDto.getShopid());
			pstmt.setString(2, mDto.getShoppw());
			pstmt.setString(3, mDto.getShopname());
			pstmt.setString(4, mDto.getShopzipcode());
			pstmt.setString(5, mDto.getShopaddr1());
			pstmt.setString(6, mDto.getShopaddr2());
			pstmt.setString(7, mDto.getShopphone());
			pstmt.setString(8, mDto.getShopemail());
			
			result = pstmt.executeUpdate();
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;
	}
	
	//5.ID만 다 불러오기 
	public List<MemberDTO> memberCheck() {
		try {
			conn = DBManager.getConnection();
			
			String sql = "SELECT shopid FROM shopmember ";
			Statement st = conn.createStatement();
			
			rs = st.executeQuery(sql);
			
			while(rs.next()) {
				
				String shopid = rs.getString("shopid");
				
				
				MemberDTO mDto = new MemberDTO(shopid);
				list.add(mDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
	//6.아이디 불러오기
	public int checkId(String ckid) {
		try {
			conn = DBManager.getConnection();
			
			String sql = "SELECT shopid FROM SHOPMEMBER WHERE shopid = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ckid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next() == true) {
				result = 1;
				System.out.println("아이디값이 있습니다");
			} else {
				result = 0;
				System.out.println("아이디값이 없습니다");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return result;	
	}

}















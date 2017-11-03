package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBManager;
import dto.ProductDTO;

public class ProductDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<ProductDTO> bestlist = new ArrayList<ProductDTO>();
	ArrayList<ProductDTO> newlist = new ArrayList<ProductDTO>();
	
	
	//1.new_pro_view
	public ArrayList<ProductDTO> listNewProduct() {
		try {
			conn = DBManager.getConnection();
			
			String sql = "SELECT * FROM new_pro_view ";
			pstmt = conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			
			newlist.clear();
			while(rs.next()) {
				String p_code = rs.getString("p_code");
				String p_name = rs.getString("p_name");
				int p_price2 = rs.getInt("p_price2");
				String p_img = rs.getString("p_img");
				System.out.println();
				
				ProductDTO pDto = new ProductDTO(p_code, p_name, p_price2, p_img);
				newlist.add(pDto);
				
				
				
			}
			
			for(int i=0; i< newlist.size(); i++) {
				System.out.println(newlist.get(i).getP_code());
				System.out.println(newlist.get(i).getP_name());
				System.out.println(newlist.get(i).getP_price2());
				System.out.println(newlist.get(i).getP_img());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return newlist;
	}
	
	//2.best_pro_view
	public ArrayList<ProductDTO> listBestProduct() {
		try {
			conn = DBManager.getConnection();
			
			String sql = "SELECT * FROM best_pro_view ";
			pstmt = conn.prepareStatement(sql);
			
			rs= pstmt.executeQuery();
			bestlist.clear();
			
			while(rs.next()) {
				String p_code = rs.getString("p_code");
				String p_name = rs.getString("p_name");
				int p_price2 = rs.getInt("p_price2");
				String p_img = rs.getString("p_img");
				System.out.println();
				
				ProductDTO pDto = new ProductDTO(p_code, p_name, p_price2, p_img);
				bestlist.add(pDto);
				
				
			}
			
			for(int i=0; i< bestlist.size(); i++) {
				System.out.println(bestlist.get(i).getP_code());
				System.out.println(bestlist.get(i).getP_name());
				System.out.println(bestlist.get(i).getP_price2());
				System.out.println(bestlist.get(i).getP_img());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bestlist;
	}
	

}

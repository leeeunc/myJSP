package model2.mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;
import dto.Criteria;


public class MVCBoardDao {

	public MVCBoardDao() {
		// TODO Auto-generated constructor stub
	}

	// 총건수 조회
	public int totalCount() {
		int res = 0;
		
		return res;
	}
	
	// 목록 조회
	public List<MVCBoardDto> getList(Criteria cri){
		List<MVCBoardDto> list = new ArrayList<>();
		String sql = "select * from mvcboard";
		
		//검색어가 null이 아니라면 검색 기능을 추가
		if(cri.getSearchWord() != null && !cri.getSearchWord().equals("")) {
			sql += " where " + cri.getSearchField() + " like '%" + cri.getSearchWord() + "%'";
		}
		sql += " order by idx desc";
		
		System.out.println("sql : " + sql);
		
		
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);
				ResultSet rs = psmt.executeQuery();) {
			
			while( rs.next()) { // rs.next == 다음행이 있으면 불러오기
				MVCBoardDto mvcboard = new MVCBoardDto();
				mvcboard.setIdx(rs.getString("idx"));
				mvcboard.setName(rs.getString("name"));
				mvcboard.setTitle(rs.getString("title"));
				mvcboard.setContent(rs.getString("content"));
				mvcboard.setPostdate(rs.getString("postdate"));
				mvcboard.setOfile(rs.getString("ofile"));
				mvcboard.setSfile(rs.getString("sfile"));
				mvcboard.setDowncount(rs.getInt("downcount"));
				mvcboard.setPass(rs.getString("pass"));
				mvcboard.setVisitcount(rs.getInt("visitcount"));

				list.add(mvcboard);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	public List<MVCBoardDto> getListPage(Criteria cri){
		List<MVCBoardDto> list = new ArrayList<>();
		String sql = "select * from"
				+ " (select tb.*, rownum rn from"
				+ " (select * from mvcboard ";
		
		
		//검색어가 null이 아니라면 검색 기능을 추가
		if(cri.getSearchWord() != null && !cri.getSearchWord().equals("")) {
			sql += " where " + cri.getSearchField() + " like '%" + cri.getSearchWord() + "%'";
		}
		
		
		sql += " order by idx desc) tb)"
				+ " where rn between ? and ?";
		
		System.out.println("sql : " + sql);
		
		
		try(Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
				
				psmt.setInt(1, cri.getStartNo());
				psmt.setInt(2, cri.getEndNo());	
				ResultSet rs = psmt.executeQuery(); 
			
			while( rs.next()) { // rs.next == 다음행이 있으면 불러오기
				MVCBoardDto mvcboard = new MVCBoardDto();
				mvcboard.setIdx(rs.getString("idx"));
				mvcboard.setName(rs.getString("name"));
				mvcboard.setTitle(rs.getString("title"));
				mvcboard.setContent(rs.getString("content"));
				mvcboard.setPostdate(rs.getString("postdate"));
				mvcboard.setOfile(rs.getString("ofile"));
				mvcboard.setSfile(rs.getString("sfile"));
				mvcboard.setDowncount(rs.getInt("downcount"));
				mvcboard.setPass(rs.getString("pass"));
				mvcboard.setVisitcount(rs.getInt("visitcount"));

				list.add(mvcboard);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}


	
	public int getTotalCnt(Criteria criteria) {
		int totalCnt = 0;
		String sql = "select count(*) "
					+ "from mvcboard ";
		if(criteria.getSearchWord() != null && !"".equals(criteria.getSearchWord())) {
			// 		where title like '%내용%'
			sql += "where "+ criteria.getSearchField() +" like '%"+ criteria.getSearchWord() +"%'";
		}	
		
		sql += "order by idx desc";
		
		System.out.println(sql);
		
		try (Connection conn = DBConnPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery();
			rs.next();
			totalCnt = rs.getInt(1); // 첫번째 컬럼의 값을 반환
			
			rs.close();
		} catch (SQLException e) {
			System.out.println("총 게시물의 수를 조회 하던중 예외가 발생 하였습니다.");
			e.printStackTrace();
		}
		
		return totalCnt;
	}

	public MVCBoardDto selectOne(String idx) {
		MVCBoardDto dto = new MVCBoardDto();
		
		String sql = "select * from mvcboard where idx = ?";
		
		 try(Connection conn = DBConnPool.getConnection();
				 PreparedStatement psmt = conn.prepareStatement(sql);) {
		psmt.setString(1, idx);	 
		
		ResultSet rs = psmt.executeQuery();
					 
		if(rs.next()) {
			dto.setIdx(rs.getString("idx"));
			dto.setName(rs.getString("name"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setPostdate(rs.getString("postdate"));
			dto.setOfile(rs.getString("ofile"));
			dto.setSfile(rs.getString("sfile"));
			dto.setDowncount(rs.getInt("downcount"));
			dto.setPass(rs.getString("pass"));
			dto.setVisitcount(rs.getInt("visitcount"));
		}
		
		} catch (SQLException e) {
			System.out.println("게시물 상세보기 조회중 오류가 발생 하였습니다.");
			e.printStackTrace();
		}
		
		return dto;
	}

	public boolean comfirmPassword(String pass, String idx) {
		boolean res = false;
		String sql = "select * from mvcboard where idx = ? and pass = ?";
		
		try(Connection conn = DBConnPool.getConnection();
			PreparedStatement psmt = conn.prepareStatement(sql);) {
			
			psmt.setString(1, idx);
			psmt.setString(2, pass);
			
			ResultSet rs = psmt.executeQuery();
			
			res = rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return false;
	}
	
	
}

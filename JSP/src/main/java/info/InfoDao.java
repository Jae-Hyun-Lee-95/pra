package info;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import temp.EmpDao;
import temp.EmpVO;

public class InfoDao {
	
	private static InfoDao  instance;
	
	// DB 연결시  관한 변수  
			private static final String 	dbDriver	=	"com.mysql.cj.jdbc.Driver";
			private static final String		dbUrl		=	"jdbc:mysql://localhost:3306/basic";
			private static final String		dbUser		=	"scott";
			private static final String		dbPass		=	"tiget";
	
			
	private InfoDao() throws Exception {
		Class.forName( dbDriver );	
		}
	
	public static InfoDao getInstance( ) throws Exception {
		if( instance == null )
		{
			instance = InfoDao();
		}
		return instance;
	}
	
	public void insertinfo(InfoDao vo) throws Exception {
		Connection	con = null;	
		ResultSet rs = null;
		Statement stmt	= null;
		PreparedStatement ps = null;
		try{
			// 1. 연결객체 얻어오기
			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
			// 2. sql 문장 만들기
			String sql		= "INSERT INTO 					"
					+ " info(id, pw, pwCk, name, tel, addr)		"
					+ "	VALUES(?,?,?,?,?)				";  
			// 3. 전송객체 얻어오기 + ? 지정
			ps	= con.prepareStatement( sql );
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPw());
			ps.setString(3, vo.getPwCk());
			ps.setString(4, vo.getName());
			ps.setString(5, vo.getTel());
			ps.setString(5, vo.getAddr());
			
			// 4. 전송하기
			ps.executeUpdate();
			
		}catch( Exception ex ){
			throw new Exception("사원정보 ) DB에 입력시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( stmt != null ) { try{ stmt.close(); } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
	}
	
	
	
}

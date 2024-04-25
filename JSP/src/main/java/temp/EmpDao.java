package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmpDao {

	private static EmpDao  instance;
	
	// DB 연결시  관한 변수  
		private static final String 	dbDriver	=	"com.mysql.cj.jdbc.Driver";
		private static final String		dbUrl		=	"jdbc:mysql://localhost:3306/basic";
		private static final String		dbUser		=	"scott";
		private static final String		dbPass		=	"tiget";
		
		
	private EmpDao() throws Exception {
		Class.forName( dbDriver );	
	}
	
	public static EmpDao getInstance( ) throws Exception {
		if( instance == null )
		{
			instance = new EmpDao();
		}
		return instance;
	}
	
	public boolean loginCheck(EmpVO vo) throws Exception{
		Connection	con = null;	
		ResultSet rs = null;
		Statement stmt	= null;
		PreparedStatement ps = null;
		
		boolean result = false;
		
		// 1. 연결객체 얻어오기 
		con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
		// 2. sql 문장 만들기
		String sql = "SELECT * FROM emp  "
				+ "	WHERE ename=? AND empno=?	";
		// 3. 전송객체 얻어오기 + ? 지정
		ps	= con.prepareStatement( sql );
		ps.setString(1, vo.getEname());
		ps.setInt(2, vo.getEmpno());
		
		// 4. 전송하기
		rs = ps.executeQuery();
		if(rs.next()) {
			result = true;
		}
		
		
		return result;
	}
	
	public void insertEmp(EmpVO vo) throws Exception {
		Connection	con = null;	
		ResultSet rs = null;
		Statement stmt	= null;
		PreparedStatement ps = null;
		try{
			// 1. 연결객체 얻어오기
			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
			// 2. sql 문장 만들기
			String sql		= "INSERT INTO 					"
					+ " EMP(empno, ename, deptno, job, sal)		"
					+ "	VALUES(?,?,?,?,?)				";  
			// 3. 전송객체 얻어오기 + ? 지정
			ps	= con.prepareStatement( sql );
			ps.setInt(1, vo.getEmpno());
			ps.setString(2, vo.getEname());
			ps.setInt(3, vo.getDeptno());
			ps.setString(4, vo.getJob());
			ps.setInt(5, vo.getSal());
			
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
	public List<EmpVO> selectEmp() throws Exception{
		List<EmpVO> list = new ArrayList<EmpVO>();
		
		Connection	con = null;	
		ResultSet rs = null;
		Statement stmt	= null;
		PreparedStatement ps = null;
		try{
		//1) 연결객체
			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
		//2) sql문장
			String sql = " SELECT empno, ename, deptno, job, sal "
					+ " FROM EMP ";

		//3) 전송객체
			ps = con.prepareStatement(sql);

		//4) 전송
			rs = ps.executeQuery();
			
		
			while(rs.next()) {
				EmpVO r = new EmpVO();
				r.setEmpno(rs.getInt("empno"));
				r.setEname(rs.getString("ename"));
				r.setDeptno(rs.getInt("deptno"));
				r.setJob(rs.getString("job"));
				r.setSal(rs.getInt("sal"));
			//5) 결과집합을 받아서 List<EmpVO>에 지정하기 
				list.add(r);
			}
		
		}catch( Exception ex ){
			throw new Exception("사원정보 ) DB에 입력시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( stmt != null ) { try{ stmt.close(); } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
		return list;
	}
	
	
	
	
}

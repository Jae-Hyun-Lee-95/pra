package reply_ex.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class ReplyDao {
	
	private static ReplyDao instance;
	
	private static final String 	dbDriver	=	"com.mysql.cj.jdbc.Driver";
	private static final String		dbUrl		=	"jdbc:mysql://127.0.0.1:3306/basic";
	private static final String		dbUser		=	"scott";
	private static final String		dbPass		=	"tiget";
	
	private Connection	 		con;
	
	public static ReplyDao	getInstance() throws ReplyException
	{
		if( instance == null )
		{
			instance = new ReplyDao();
		}
		return instance;
	}
	
	private ReplyDao() throws ReplyException
	{
	
		try{
			
			/********************************************
			1. 오라클 드라이버를 로딩
				( DBCP 연결하면 삭제할 부분 )
		*/
			Class.forName( dbDriver );	
		}catch( Exception ex ){
			throw new ReplyException("DB 연결시 오류  : " + ex.toString() );	
		}
		
	}
	
	public int insert(ReplyVO vo ) throws ReplyException
	{
		ResultSet rs = null;
		Statement stmt	= null;
		PreparedStatement ps = null;
		try{

			con	= DriverManager.getConnection( dbUrl, dbUser, dbPass );
			
			//* sql 문장 만들기
			String putQuery	= "INSERT INTO 				"
								+ " 	reply_ex( seq, user, reply)	"
								+ "	 VALUES(?,?,?)			";  

			ps		= con.prepareStatement( putQuery );
			//* sql 문장의 ? 지정하기
			ps.setInt(1, vo.getSeq());
			ps.setString(2, vo.getUser());
			ps.setString(3, vo.getReply());
			
	
			//int insertedCount = ps.executeUpdate();			

			return ps.executeUpdate();
		
		}catch( Exception ex ){
			throw new ReplyException("게시판 ) DB에 입력시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( stmt != null ) { try{ stmt.close(); } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
		
	}
	
}

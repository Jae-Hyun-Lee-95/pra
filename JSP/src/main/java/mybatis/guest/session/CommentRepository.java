package mybatis.guest.session;

import java.io.*;
import java.util.*;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

public class CommentRepository 
{
	//	private final String namespace = "CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {
		
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	
	/*
	 	JDBC : Connection (연결)
	 	mybatis : SeqSession
	 */
	
	public List<Comment> selectComment(){
		SqlSession sess = 
				getSqlSessionFactory().openSession();
		try {
			List<Comment> list = sess.selectList("CommentMapper.selectComment");
			return list;
			
			//return sess.selectList("CommentMapper.selectComment");	위코드 변수없이 작성
			
		}finally {
			sess.close(); // 연결객체 반환
			// 내부적으로 마이바티즈는 ConnectionPool 사용
		}
		
	}

}

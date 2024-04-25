package mybatis.guest.service;

import java.util.*;

import board_ex.model.BoardDao;
import board_ex.model.BoardVO;
import mybatis.guest.model.Comment;
import mybatis.guest.session.CommentRepository;

public class CommentService {
	
	private static CommentService service;
	
	private CommentService() {}
	public static CommentService getInstance(){
		if( service == null) service = new CommentService();
		return service;
	}
	
	CommentRepository repo =
				new CommentRepository();
	
	public List<Comment> selectComment() {
		List<Comment> list = repo.selectComment();
		return list;
		
		//return repo.selectComment();	 위 코드 변수명 없이 리턴
	}
	
	public List<Comment> selectComment(HashMap map) {
		List<Comment> list = repo.selectComment(map);
		return list;
		
		//return repo.selectComment();	 위 코드 변수명 없이 리턴
	}
	
	public void insertComment(Comment comment) {
		repo.insertComment(comment);
	}
	
	public Comment selectCommentByPk(int commentNo) {
		return repo.selectCommentByPk(commentNo);
	}
	
	public void deleteComment(int cNo) {
		repo.deleteComment(cNo);
	}
	
	public Comment getArticleByNo(String id) {
		int article_id = 0;
		if( id != null ) article_id = Integer.parseInt(id);
		Comment result = repo.selectByNo(article_id);
		return result;
		
	}
	


}
package board_mybatis;

import java.util.List;

public class BoardService {
	
private static BoardService service;
	
	private BoardService() {}
	public static BoardService getInstance(){
		if( service == null) service = new BoardService();
		return service;
	}
	
	private BoardRepo repo = new BoardRepo();
	
	public List<BoardVO> getArticleList(){
		return repo.getArticleList();
	}

}

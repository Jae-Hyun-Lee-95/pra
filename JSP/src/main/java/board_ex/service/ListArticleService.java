package board_ex.service;

import java.util.List;

import board_ex.model.*;
import guest.model.MessageDao;

public class ListArticleService {
	
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 5;	// 한페이지당 레코드 수
	
	private static ListArticleService instance;
	
	public static ListArticleService getInstance()  throws BoardException{
		if( instance == null )
		{
			instance = new ListArticleService();
		}
		return instance;
	}
	
	public List <BoardVO> getArticleList() throws BoardException
	{
		 List <BoardVO> mList = BoardDao.getInstance().selectList();			
		return mList;
	}
	
	public List <BoardVO> getArticleList(String pNum) throws BoardException
	{
		int pageNum = 1;
		if( pNum != null) {
			pageNum = Integer.parseInt(pNum);
		}
		
		int startNum = (pageNum-1)*countPerPage;
		
		 List <BoardVO> mList = BoardDao.getInstance().selectList(startNum, countPerPage);			
		return mList;
	}
	
	
	// 전체 메세지 레코드 수 얻어오기
	
	public int getTotalCount() throws BoardException{
		// 데이터베이스의 레코드 수 검색
				totalRecCount = BoardDao.getInstance().getTotalCount();
				
				// 레코드수에서 페이지수가 계산
				pageTotalCount = totalRecCount / countPerPage;
				if(totalRecCount % countPerPage > 0) pageTotalCount++;
				
				// 화면에서의 페이지 수를 리턴
				return pageTotalCount;
		
		
		
	}
		
}

package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

import java.util.List;

public class ListMessageService {

	//-------------------------------------------------------------------
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private static ListMessageService instance;
	
	public static ListMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new ListMessageService();
		}
		return instance;
	}
	
	private ListMessageService()
	{
		
	}
	
	public List <Message> getMessageList() throws MessageException
	{
		// 전체 레코드를 검색해 온다면
		List <Message> mList = MessageDao.getInstance().selectList();			
		return mList;
	}
	
	public List <Message> getMessageList(String pNum) throws MessageException
	{
		int pageNum = 1;
		if( pNum != null) {
			pageNum = Integer.parseInt(pNum);
		}
		
		/*
		 	[참고] 오라클인 경우
		 		보여줄 시작 레코드 번호 / 보여줄 마지막 레코드 번호
		 		
		 	1 페이지		1번 / 3번
		 	2 페이지		4번 / 6번
		 	
		 	[Mysql/mariadb]
		 		보여줄 시작 레코드 번호 / 보여줄 갯수
		 	
		 	1 페이지		1번 / 3개
		 	2 페이지		4번 / 3개
		 */
		
		int startNum = (pageNum-1)*countPerPage;
		
		// 전체 레코드를 검색해 온다면
		List <Message> mList = MessageDao.getInstance().selectList(startNum, countPerPage);			
		return mList;
	}
	
	// 전체 메세지 레코드 수 얻어오기
	public int getTotalCount() throws MessageException{
		// 데이터베이스의 레코드 수 검색
		totalRecCount = MessageDao.getInstance().getTotalCount();
		
		// 레코드수에서 페이지수가 계산
		pageTotalCount = totalRecCount / countPerPage;
		if(totalRecCount % countPerPage > 0) pageTotalCount++;
		
		// 화면에서의 페이지 수를 리턴
		return pageTotalCount;
	}
	
}

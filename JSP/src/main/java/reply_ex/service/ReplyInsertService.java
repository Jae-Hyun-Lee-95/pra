package reply_ex.service;

import reply_ex.model.ReplyDao;
import reply_ex.model.ReplyException;
import reply_ex.model.ReplyVO;

public class ReplyInsertService {
		
	private static ReplyInsertService instance;
	public static ReplyInsertService getInstance() throws ReplyException{
		if( instance == null )
		{
			instance = new ReplyInsertService();
		}
		return instance;
		
	}
	
	public int write( ReplyVO vo ) throws ReplyException{
		
		ReplyDao dao = ReplyDao.getInstance();
	
		return dao.insert(vo);
		
	}
	
}

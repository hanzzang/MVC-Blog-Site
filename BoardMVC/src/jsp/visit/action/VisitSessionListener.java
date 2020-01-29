package jsp.visit.action;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import jsp.visit.model.VisitCountDAO;


public class VisitSessionListener implements HttpSessionListener
{

	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
		
		if(sessionEve.getSession().isNew()){
	    	execute(sessionEve);
	    }
	}

	private void execute(HttpSessionEvent sessionEve) 
	{
		VisitCountDAO dao = VisitCountDAO.getInstance();
		
		try {
			dao.setTotalCount();
			int totalCount = dao.getTotalCount();
			int todayCount = dao.getTodayCount();
			
			HttpSession session = sessionEve.getSession();
			
	        session.setAttribute("totalCount", totalCount); 
	        session.setAttribute("todayCount", todayCount);
			
		} catch (Exception e) {
			System.out.println("===== 방문자 카운터 오류 =====\n");
			e.printStackTrace();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {}

}

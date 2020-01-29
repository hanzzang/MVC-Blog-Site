package jsp.guestbook.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookBean;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookWriteAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8"); 
		ActionForward forward = new ActionForward();
		
		String guestbook_id = request.getParameter("guestbook_id");
		String guestbook_password = request.getParameter("guestbook_password");
		String guestbook_content = request.getParameter("guestbook_content");

		GuestbookDAO dao = GuestbookDAO.getInstance();
	
		GuestbookBean guestbook = new GuestbookBean();
		guestbook.setGuestbook_no(dao.getSeq());
		guestbook.setGuestbook_id(guestbook_id);
		guestbook.setGuestbook_password(guestbook_password);
		guestbook.setGuestbook_content(guestbook_content);
	
		boolean result = dao.guestbookInsert(guestbook);
		
		if(result){
			forward.setRedirect(true);
			forward.setNextPath("GuestbookListAction.ge");
		}
		
		return forward;
	}
}
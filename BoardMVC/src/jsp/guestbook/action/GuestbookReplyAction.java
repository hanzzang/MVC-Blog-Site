package jsp.guestbook.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookBean;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookReplyAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
	
		GuestbookDAO dao = GuestbookDAO.getInstance();
		GuestbookBean guestbook = new GuestbookBean();
		
		String pageNum = request.getParameter("page");

		int guestbook_no = Integer.parseInt(request.getParameter("guestbook_no"));
		String guestbook_id = request.getParameter("guestbook_id");
		String guestbook_password = request.getParameter("guestbook_password");
		String guestbook_content = request.getParameter("guestbook_content");
		int guestbook_group = Integer.parseInt(request.getParameter("guestbook_group"));

		guestbook.setGuestbook_no(dao.getSeq());
		guestbook.setGuestbook_id(guestbook_id);
		guestbook.setGuestbook_password(guestbook_password);
		guestbook.setGuestbook_content(guestbook_content);
		guestbook.setGuestbook_group(guestbook_group);
		guestbook.setGuestbook_parent(guestbook_no); 
		
		boolean result = dao.guestbookInsert(guestbook);
		if(result){
			forward.setRedirect(true);
			forward.setNextPath("GuestbookListAction.ge?page="+pageNum);
		}

		return forward;
	}
}

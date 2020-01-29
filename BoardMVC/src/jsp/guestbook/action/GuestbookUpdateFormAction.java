package jsp.guestbook.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookBean;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookUpdateFormAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		
		int guestbook_no = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("page");
		
		GuestbookDAO dao = GuestbookDAO.getInstance();
		GuestbookBean guestbook = dao.getGuestbook(guestbook_no);
		
		request.setAttribute("guestbook", guestbook);
		request.setAttribute("pageNum", pageNum);
		
		forward.setRedirect(false);
		forward.setNextPath("guestbook/GuestbookUpdateForm.jsp");
		
		return forward;
	}
}

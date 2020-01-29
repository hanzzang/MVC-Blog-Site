package jsp.guestbook.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookBean;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookListAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		int spage = 1;
		String page = request.getParameter("page");
		if(page != null && !page.equals(""))	spage = Integer.parseInt(page);
		GuestbookDAO dao = GuestbookDAO.getInstance();
		int listCount = dao.getGuestbookCount();


		int maxPage = (int)(listCount/5.0 + 0.9);
		

		if(spage < 1) spage = 1;
		if(maxPage < 1) maxPage = 1;			
		
		if(spage > maxPage) spage = maxPage;
		ArrayList<GuestbookBean> list = dao.getGuestbookList(spage*5-4);
		
		int startPage = (int)((spage/5.0 + 0.8) * 5) - 4;
		int endPage = startPage + 4;
		if(endPage > maxPage)	endPage = maxPage;
		
		request.setAttribute("spage", spage);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		
		forward.setRedirect(false);
		forward.setNextPath("GuestbookForm.ge");
		
		return forward;
	}
}

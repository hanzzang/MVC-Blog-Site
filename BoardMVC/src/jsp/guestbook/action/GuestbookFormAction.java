package jsp.guestbook.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class GuestbookFormAction implements Action
{
	private String path = "MainForm.jsp?contentPage=guestbook/GuestbookForm.jsp";

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setNextPath(path);
		
		return forward;
	}
}

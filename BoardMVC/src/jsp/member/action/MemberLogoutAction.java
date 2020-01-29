package jsp.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class MemberLogoutAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		request.getSession().removeAttribute("sessionID");
		
		forward.setRedirect(true);
		forward.setNextPath("MainForm.do");
		
		return forward;
	}
}

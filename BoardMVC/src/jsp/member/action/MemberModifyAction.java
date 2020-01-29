package jsp.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;

public class MemberModifyAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8"); 
		
		ActionForward forward = new ActionForward();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		HttpSession session = request.getSession();
		String id = session.getAttribute("sessionID").toString();
		
		MemberBean member = new MemberBean();
		member.setId(id);
		member.setPassword(request.getParameter("password"));
		member.setMail1(request.getParameter("mail1"));
		member.setMail2(request.getParameterValues("mail2")[0]); 
		member.setPhone(request.getParameter("phone"));
		member.setAddress(request.getParameter("address"));
		
		dao.updateMember(member);

		forward.setRedirect(true);
   		forward.setNextPath("ResultForm.do");
		
   		session.setAttribute("msg", "0");
   		
		return forward;
	}

}

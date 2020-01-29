package jsp.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;

public class MemberJoinAction implements Action
{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		MemberBean member = new MemberBean();
		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setGender(request.getParameter("gender"));;
		member.setBirthyy(request.getParameter("birthyy"));
		member.setBirthmm(request.getParameterValues("birthmm")[0]);
		member.setBirthdd(request.getParameter("birthdd"));
		member.setMail1(request.getParameter("mail1"));
		member.setMail2(request.getParameterValues("mail2")[0]);
		member.setPhone(request.getParameter("phone"));
		member.setAddress(request.getParameter("address"));
		
		dao.insertMember(member);
		
		forward.setRedirect(true);
   		forward.setNextPath("ResultForm.do");
		
   		request.getSession().setAttribute("msg", "1");
   		
		return forward;
	}
}

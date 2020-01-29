package jsp.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;

public class MemberSearchIDAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8"); 
		
		ActionForward forward = new ActionForward();
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		MemberDAO dao = MemberDAO.getInstance();
		String searchID = (String) dao.searchID(name,phone);
		
		if(searchID.equals("")){
	   		request.getSession().setAttribute("msg", "3");
		}
		else{	//회원확인
	   		request.getSession().setAttribute("msg", "2");
		}

   		request.getSession().setAttribute("searchID", searchID);
   		
   		forward.setRedirect(true);
   		forward.setNextPath("ResultForm.jsp");
   		
		return forward;
	}
}

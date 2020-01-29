package jsp.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.member.model.MemberDAO;

public class MemberSearchPWAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8"); 
		
		ActionForward forward = new ActionForward();
		
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		
		MemberDAO dao = MemberDAO.getInstance();
		String searchPW = (String) dao.searchPW(id,phone);
		
		
		if(searchPW.equals("")){
			forward.setRedirect(true);
	   		forward.setNextPath("ResultForm.jsp");
	   		request.getSession().setAttribute("msg", "4");
		}
		else{	//회원확인
			forward.setRedirect(true);
	   		forward.setNextPath("SearchPWModifyForm.do");
	   		request.getSession().setAttribute("searchPW_id", id);
		}

		return forward;
	}

}

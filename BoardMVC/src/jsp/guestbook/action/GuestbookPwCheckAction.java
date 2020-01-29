package jsp.guestbook.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.common.action.Action;
import jsp.common.action.ActionForward;
import jsp.guestbook.model.GuestbookDAO;

public class GuestbookPwCheckAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String inputPW = request.getParameter("pw");
		String g_no = request.getParameter("num");
		int guestbook_no = Integer.parseInt(g_no);
		
		GuestbookDAO dao = GuestbookDAO.getInstance();
		String dbPW = dao.getPassword(guestbook_no);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(!dbPW.equals(inputPW))	
			out.println("0"); 
		else	
			out.println("1"); 
		
		out.close();
		return null;
	}
}

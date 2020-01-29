package jsp.board.action;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.common.action.Action;
import jsp.common.action.ActionForward;

public class BoardReplyFormAction implements Action
{
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("page");
		
		BoardBean board = dao.getDetail(num);
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		
		forward.setRedirect(false);
		forward.setNextPath("BoardReplyForm.bo");
		
		return forward;
	}
}

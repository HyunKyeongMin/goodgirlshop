package brand;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dto.MemberDTO;

/**
 * Servlet implementation class NewMemberAction
 */
@WebServlet("/NewMemberAction")
public class NewMemberAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewMemberAction() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet NewMemberAction");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost NewMemberAction");
		
		request.setCharacterEncoding("UTF-8"); //한글 깨짐 방지
		
		HttpSession session = request.getSession();
		
		String shopid = request.getParameter("uid").trim();
		String shoppw = request.getParameter("upw").trim();
		String shopname = request.getParameter("uname").trim();
		String shopzipcode = request.getParameter("uzipcode").trim();
		String shopaddr1 = request.getParameter("uaddr1").trim();
		String shopaddr2 = request.getParameter("uaddr2").trim();
		String shopphone = request.getParameter("uphone").trim();
		String shopemail = request.getParameter("uemail").trim();
		
		MemberDTO mDto = new MemberDTO(shopid, shoppw, shopname, shopzipcode, shopaddr1, shopaddr2, shopphone, shopemail);
		MemberDAO mDao = new MemberDAO();
		int result =mDao.memberInsert(mDto);
		
		if(result> 0) {
			request.setAttribute("mid", shopid);
			request.setAttribute("mname", shopname);
			RequestDispatcher dis = request.getRequestDispatcher("welcome.jsp");
			dis.forward(request, response);	
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("member.jsp");
			dis.forward(request, response);
		}
	}
	
}

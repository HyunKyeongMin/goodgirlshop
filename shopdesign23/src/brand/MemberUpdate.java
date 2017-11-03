package brand;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
 * Servlet implementation class memberUpdate
 */
@WebServlet("/MemberUpdate")
public class MemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdate() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet MemeberUpdate");
		
		HttpSession session = request.getSession(true);
	/*	session.getAttribute("login_user");*/
		
		if(session.getAttribute("loginUser") == null) {
			System.out.println("로그인을 하세요");
			response.sendRedirect("shoplogin.jsp");
		} else {
			System.out.println("들어왔씁니다");
			response.sendRedirect("memberupdate.jsp");
		}
		
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost MemberUpdateUpdate");
		
		request.setCharacterEncoding("UTF-8"); //한글 깨짐 방지
		
		HttpSession session = request.getSession();
		
		String shopid = request.getParameter("uid").trim();
		String shoppw = request.getParameter("upw").trim();
		String shopname = request.getParameter("uname").trim();
		String shopzipcode = request.getParameter("uzipcode").trim();
		String shopaddr2 = request.getParameter("uaddr1").trim();
		String shopaddr1 = request.getParameter("uaddr2").trim();
		String shopphone = request.getParameter("uphone").trim();
		String shopemail = request.getParameter("uemail").trim();
		
		MemberDTO mDto = new MemberDTO(shopid, shoppw, shopname, shopzipcode, shopaddr1, shopaddr2, shopphone, shopemail);
		MemberDAO mDao = new MemberDAO();
		int result =mDao.memberUpdate(mDto);
		
		if(result> 0) {
			session.removeAttribute("id");
			session.setAttribute("loginUser", mDto);
	
			request.setAttribute("code", 1);
			RequestDispatcher dis = request.getRequestDispatcher("IndexAction");
			dis.forward(request, response);	
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("memberupdate.jsp");
			dis.forward(request, response);
		}

	}

}

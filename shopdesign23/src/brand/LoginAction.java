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
 * Servlet implementation class LoginAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet LoginAction");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost LoginAction");
		
		HttpSession session = request.getSession();
		
		
		String id = request.getParameter("uid").trim();
		String pw = request.getParameter("upw").trim();
		
		System.out.println(id);
		System.out.println(pw);
		
		MemberDAO mDao = new MemberDAO();
		MemberDTO mDto = mDao.ckLogin(id, pw);
		
/*		System.out.println("id: " + mDto.getShopid());
		System.out.println("id: " + mDto.getShoppw());
		System.out.println("id: " + mDto.getShopname());
		System.out.println("id: " + mDto.getShopzipcode());
		System.out.println("id: " + mDto.getShopaddr1());
		System.out.println("id: " + mDto.getShopaddr2());
		System.out.println("id: " + mDto.getShopphone());
		System.out.println("id: " + mDto.getShopemail());
		*/
		String code;
		
		if (mDto == null) {
			code="shoplogin.jsp";	
			request.setAttribute("code", "2");
		} else {
			session.removeAttribute("id");
			session.removeAttribute("code");
			session.setAttribute("loginUser", mDto);
			
			code = "IndexAction";

			System.out.println(mDto.getShopid());
			System.out.println(mDto.getShoppw());
		}
/*		if(mDto.getShopid() != null && mDto.getShoppw() != null) {
			session.removeAttribute("id");
			session.setAttribute("loginUser", mDto);
			
			code = "IndexAction";
			
		} else {
			code="shoplogin.jsp";	
			request.setAttribute("code", "2");
		}*/
		RequestDispatcher dis = request.getRequestDispatcher(code);
		dis.forward(request, response);
		

	}

}

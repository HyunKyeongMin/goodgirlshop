package brand;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

/**
 * Servlet implementation class LoginOutAction
 */
@WebServlet("/LoginOutAction")
public class LoginOutAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginOutAction() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet LoginOutAction");
		
		HttpSession session = request.getSession(false);
		// true(default)
		// Session을 반환, 만약 세션이 존재하지 않을 경우 새로운 세션 생성
		
		// false
		// Session을 반환, 만약 세션이 존재하지 않을 경우 null을 반환
		
		if(session != null) {
			session.invalidate(); // 초기화 해라 라는 의미
		}
		
		response.sendRedirect("IndexAction"); //sendRedirect 방식
		
/*		RequestDispatcher dis = request.getRequestDispatcher("IndexAction");
		dis.forward(request, response);*/ //forward 방식
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost LoginOutAction");
	}

}

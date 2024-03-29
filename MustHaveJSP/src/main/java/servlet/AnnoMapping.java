package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 	web.xml에 매핑을 하는 대신 @WebServlet 어노테이션을 사용하여
 	요청명에 대한 매핑을 한다. 편한 방식이지만 차후 유지보수를 위해서
 	요청명과 서블릿 클래스의 관계를 명확히 해둔 형태에서 사용해야 한다.
*/
@WebServlet("/13Servlet/AnnoMapping.do")
public class AnnoMapping extends HttpServlet {
	// doget + 컨트롤 + 스페이스 = 자동완성
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setAttribute("message", "@WebServlet으로 매핑");
		req.getRequestDispatcher("/13Servlet/AnnoMapping.jsp")
			.forward(req, resp);
	}
}


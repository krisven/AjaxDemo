package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name="LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        doGet(request,response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String account = request.getParameter("a");
        String password = request.getParameter("p");
        String targetUrl = "/krisven/loginfail.jsp";
        //认为账号和密码相等就算登陆成功
        if(account.equals(password)){
            targetUrl = "/krisven/loginSuccess.jsp";
            session.setAttribute("a", account);
            response.sendRedirect(targetUrl);
            return;
        }
        response.sendRedirect(targetUrl);
        return;
    }
}

package controller;

import dao.UserBean;
import service.userService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class loginControll extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserBean userBean = new UserBean();
        userBean.setUserId(req.getParameter("userId"));
        userBean.setUserpassword(req.getParameter("userpassword"));
        userService userService = new userService();
        HttpSession httpSession = req.getSession();
        if(userService.checkLogin(userBean)){
            httpSession.setAttribute("QZ","1");
        }else {
            httpSession.setAttribute("QZ","0");
        }
        java.io.PrintWriter out = resp.getWriter();
        out.println("<html>");
        out.println("<script>");
        out.println("window.open ('/Page/index.jsp','_top')");
        out.println("</script>");
        out.println("</html>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

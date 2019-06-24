package controller;

import dao.ClassNav;
import service.classService;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

public class classNavController extends HttpServlet{


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            classService db = new classService();
            String QZ = "0";
            if (session.getAttribute("QZ") != null){
                QZ = (String)session.getAttribute("QZ");
                System.out.println("QZSE:"+QZ);
            }
            System.out.println("QQZ:"+QZ);
            ResultSet rs = db.showAllClass(QZ);

            ArrayList sz = new ArrayList();
            while(rs.next()){
                ClassNav classNav = new ClassNav();
                classNav.setClassId(rs.getInt("classId"));
                classNav.setClassName(rs.getString("className"));
                classNav.setClassUrl(rs.getString("classUrl"));
                sz.add(classNav);
                session.setAttribute("sz",sz);
            }
            rs.close();
            resp.sendRedirect("Page/leftNav.jsp");

        }catch (Exception e){
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

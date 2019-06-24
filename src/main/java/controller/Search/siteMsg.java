package controller.Search;

import controller.MyException;
import dao.CarBean;
import dao.siteBean;
import service.siteService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

public class siteMsg  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            String QZ = "0";
            if (session.getAttribute("QZ") != null){
                QZ = (String)session.getAttribute("QZ");
            }
            siteService db1 = new siteService();
            ResultSet rs = db1.selectAll(QZ);
            ArrayList sz = new ArrayList();
            while(rs.next()){
                siteBean siteBean = new siteBean();
                siteBean.setSiteId(rs.getInt("siteid"));
                siteBean.setSiteName(rs.getString("siteName"));
                sz.add(siteBean);
                session.setAttribute("sitelist",sz);
            }

            resp.sendRedirect("/Search/siteList.jsp");
            rs.close();
        }catch (Exception e){
            try {
                throw new MyException("列表为空",req,resp);
            } catch (MyException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

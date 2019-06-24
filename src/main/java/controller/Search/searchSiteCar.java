package controller.Search;

import controller.MyException;
import dao.CarBean;
import service.carService;
import service.siteService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

public class searchSiteCar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        try {

            String str1 = req.getParameter("searchWords");
            if(str1.equals("")){
                throw new MyException("输入框为空",req,resp);
            }
            siteService db1 = new siteService();
            ResultSet rs = db1.selectSiteCar(str1);
            HttpSession session = req.getSession();
            ArrayList sz = new ArrayList();
            while(rs.next()){
                CarBean carBean = new CarBean();
                carBean.setCarId(rs.getString("carId"));
                carBean.setLicensePlate(rs.getString("licensePlate"));
                carBean.setCarPath(rs.getString("carPath"));
                carBean.setStartSite(rs.getString("startSite"));
                carBean.setEndSite(rs.getString("endSite"));
                sz.add(carBean);
                System.out.println(carBean.toString());

            }
            session.setAttribute("carSz",sz);
            session.setAttribute("currentsite",str1);
            resp.sendRedirect("siteCar.jsp");
            rs.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

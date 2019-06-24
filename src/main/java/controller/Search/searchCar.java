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

public class searchCar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            String str = req.getParameter("searchCarId");
            if(str.equals("")){
                throw new MyException("车辆Id不能为空",req,resp);
            }
            carService db = new carService();
            ResultSet rs = db.selectCar(str);
            HttpSession session = req.getSession();
            ArrayList sz = new ArrayList();
            while (rs.next()){
                CarBean carBean = new CarBean();
                carBean.setCarId(rs.getString("carId"));
                carBean.setStartSite(rs.getString("startSite"));
                carBean.setEndSite(rs.getString("endSite"));
                sz.add(carBean);
            }
            session.setAttribute("carList",sz);
            for(int i=0;i<sz.size();i++){
                CarBean st = (CarBean)sz.get(i);
            }
            resp.sendRedirect("carList.jsp");
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

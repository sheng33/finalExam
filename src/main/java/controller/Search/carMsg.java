package controller.Search;

import controller.MyException;
import dao.CarBean;
import service.carService;
import service.classService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

public class carMsg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            HttpSession session = req.getSession();
            String QZ = "0";
            if (session.getAttribute("QZ") != null){
                QZ = (String)session.getAttribute("QZ");
            }
            carService db = new carService();
            ResultSet rs = db.selectAllCar(QZ);
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
            resp.sendRedirect("/Search/carList.jsp");
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

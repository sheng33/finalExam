package controller.Search;

import com.google.gson.Gson;
import controller.MyException;
import dao.CarBean;
import dao.siteBean;
import service.carService;
import service.siteService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

public class searchCarController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Gson gson = new Gson();
        String str = req.getParameter("carId");
        if(str.equals("")){
            try {
                throw new MyException("车辆Id不能为空",req,resp);
            } catch (MyException e) {
                e.printStackTrace();
            }
        }
        try {
            carService db = new carService();
            ResultSet rs = db.selectCar(str);
            resp.setContentType("text/json;charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            PrintWriter out = resp.getWriter();
            ArrayList sz = new ArrayList();
            while(rs.next()){
                CarBean carBean = new CarBean();
                carBean.setCarId(rs.getString("carId"));
                carBean.setLicensePlate(rs.getString("licensePlate"));
                carBean.setStartSite(rs.getString("startSite"));
                carBean.setEndSite(rs.getString("endSite"));
                sz.add(carBean);
            }
            String json = gson.toJson(sz);
            out.println(json);
            out.flush();
            out.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
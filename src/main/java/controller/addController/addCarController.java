package controller.addController;

import dao.CarBean;
import service.carService;
import service.siteService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import controller.MyException;

public class addCarController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            siteService siteService = new siteService();
            String carId = req.getParameter("carId");
            String licensePlate = req.getParameter("licensePlate");
            String startSite = req.getParameter("searchWords1");

            String endSite = req.getParameter("searchWords2");

            String carPath = req.getParameter("tagsinput");
            System.out.println(carId+"'"+licensePlate+"'"+startSite+"'"+endSite+"'"+carPath);
            String[] strList = carPath.split(",");
            if(carId.equals("")||licensePlate.equals("")||startSite.equals("")||endSite.equals("")|| carPath.equals("")){
                throw new MyException("输入框不能为空",req,resp);
            }
            endSite = siteService.selectSiteId(endSite);
            startSite = siteService.selectSiteId(startSite);
            String carPathStr = startSite;


            for (String item: strList){
                System.out.println(item);
                String id = siteService.selectSiteId(item);
                System.out.println("Path:"+id);
                carPathStr += "-"+id;
            }
            carPathStr +="-"+endSite;
            System.out.println(carPathStr);
            carService carService = new carService();
            CarBean carBean = new CarBean(carId,licensePlate,carPathStr,startSite,endSite);
            carService.insertCar(carBean);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

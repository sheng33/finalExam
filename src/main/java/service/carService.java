package service;

import dao.CarBean;
import dao.DBBean;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class carService  {
    dao.DBBean DBBean = new DBBean();
    private Connection con = null;
    private Statement stm = null;
    private ResultSet rs = null;
    private HttpServletResponse response;
    public ResultSet selectCarPath(String start,String end){
        try {
            String sql = "select * from cartable where carPath LIKE ('"+start+"-%-"+end+"')"+
                    "OR carPath LIKE ('"+end+"-%-"+start+"')"+"OR carPath LIKE ('"+start+"-%"+end+"-%')"
                    +"OR carPath LIKE ('"+end+"-%"+start+"-%')"
                    +"OR carPath LIKE ('%-"+start+"-%-"+end+"-%')"+"OR carPath LIKE ('%-"+end+"-%-"+start+"-%')";
            System.out.println(sql);
            stm = DBBean.getStatement();
            return stm.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            message("无法查询进行车辆路径，请检查selectCarPath()方法！");
            return null;
        }
    }
    public boolean insertCar(CarBean carBean){
        try {
            String sql = "insert into cartable(carid,licensePlate,carPath,startSite,endSite)"+
                    "value('"+carBean.getCarId()+"','"+carBean.getLicensePlate()+
                    "','"+carBean.getCarPath()+"','"+carBean.getStartSite()+"','"+carBean.getEndSite()+"')";
            System.out.println(sql);
            stm = DBBean.getStatement();
            return stm.execute(sql);
        } catch (Exception e) {
            e.printStackTrace();
            message("无法进行新增，请检查insertCar()方法！");
            return false;
        }
    }

    public ResultSet selectAllCar(String QZ){
        try {
            String sql = "select * from cartable where '1'='"+QZ+"'";
            stm = DBBean.getStatement();
            return stm.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            message("无法查询进行车次，请检查selectAllCar()方法！");
            return null;
        }
    }

    public ResultSet selectCarID(String carId){
        try {
            String sql = "select * from cartable where carId='"+carId+"'";
            stm = DBBean.getStatement();
            return stm.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            message("无法查询进行车次，请检查selectCarID()方法！");
            return null;
        }
    }
    public ResultSet selectCar(String carId) {
        try {
            String sql = "select * from cartable where carId like '%"+carId+"%'";
            System.out.println("selectCar方法"+sql);
            stm = DBBean.getStatement();
            return stm.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            message("无法查询车次，请检查selectCar()方法！");
            return null;
        }
    }


    public void message(String msg){
        response.setContentType("text/html; charset=utf-8");
        try {
            response.getWriter().println("<script language='javascript'>alert('"+msg+"');</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

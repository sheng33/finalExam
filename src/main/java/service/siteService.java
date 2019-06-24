package service;

import dao.CarBean;
import dao.DBBean;
import dao.siteBean;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class siteService {
    DBBean DBBean = new DBBean();
    private Statement stm = null;
    private HttpServletResponse response;
    public ResultSet selectSite(String siteName) {
        try {
            String sql = "select * from sitelist where siteName like '%"+siteName+"%'";
            stm = DBBean.getStatement();
            return stm.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            message("无法查询站点，请检查selectSite()方法！");
            return null;
        }
    }
    public String selectSiteId(String siteName) {
        try {
            String sql = "select siteId from sitelist where siteName like '%"+siteName+"%'";
            stm = DBBean.getStatement();
            ResultSet rs = stm.executeQuery(sql);
            rs.next();
            String str = rs.getString("siteId");
            System.out.println("查询"+str);
            return str;
        } catch (Exception e) {
            e.printStackTrace();
            message("无法查询站点，请检查selectSite()方法！");
            return null;
        }
    }

    public boolean addSite(ArrayList arrayList){
        try {
            String sql = "insert into sitelist(siteName) values";
            for(Object str : arrayList){
                sql += "('"+str+"'),";
            }
            sql = sql.substring(0,sql.length()-1);

            System.out.println("数据库："+sql);
            stm = DBBean.getStatement();
            return stm.execute(sql);
        }catch (Exception e){
            e.printStackTrace();
            message("无法新增站点，请检查addSite()方法！");
            return false;
        }
    }

    public ResultSet selectAll(String QZ) {
        try {
            String sql = "select * from sitelist where '1'='"+QZ+"'";
            stm = DBBean.getStatement();
            return stm.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            message("无法查询站点，请检查selectSite()方法！");
            return null;
        }
    }
    public ResultSet selectSiteCar(String siteName) {
        try {
            ResultSet resultSet = null;
            String sql = "select * from sitelist where siteName like '%"+siteName+"%'";
            stm = DBBean.getStatement();
            resultSet = stm.executeQuery(sql);
            resultSet.next();
            Integer SqlId = resultSet.getInt("siteId");
            String sql1 = "select * from cartable where carPath like '%-"+SqlId+"-%' or carPath like '"
                    +SqlId+"-%' or carPath like '%-"+SqlId+"'";
            return stm.executeQuery(sql1);
        } catch (Exception e) {
            e.printStackTrace();
            message("无法查询站点，请检查selectSite()方法！");
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

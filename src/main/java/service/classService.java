package service;

import dao.DBBean;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class classService {
    DBBean DBBean = new DBBean();
    private Connection con = null;
    private Statement stm = null;
    private ResultSet rs = null;
    private HttpServletResponse response;
    public ResultSet showAllClass(String QZ) {
        try {
            String sql = "select * from classnav where classQD='"+QZ+"'";
            stm = DBBean.getStatement();
            return stm.executeQuery(sql);
        } catch (Exception e) {
            e.printStackTrace();
            message("无法查询导航分类，请检查showAllClass()方法！");
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

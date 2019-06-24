package service;

import dao.DBBean;
import dao.UserBean;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class userService {

    dao.DBBean DBBean = new DBBean();
    private Connection con = null;
    private Statement stm = null;
    private ResultSet rs = null;
    private HttpServletResponse response;

    public boolean checkLogin(UserBean userBean){
        try {
            String sql = "select * from user where userId='"+userBean.getUserId()
                    +"' and userpassword='"+userBean.getUserpassword()+"'";
            stm = DBBean.getStatement();
            return stm.execute(sql);
        } catch (Exception e) {
            e.printStackTrace();
            message("无法查询进行车次，请检查selectCarID()方法！");
            return false;
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

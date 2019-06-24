package dao;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBBean {
    private String driverName = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/finalexam" +
            "?useUnicode=true&useJDBCCompliantTimezoneShift=true" +
            "&useLegacyDatetimeCode=false&serverTimezone=UTC&characterEncoding=utf-8";
    private String user = "sheng";
    private String password = "123456";
    private Connection con = null;
    private Statement stm = null;
    private ResultSet rs = null;
    private HttpServletResponse response;

    /**
     * Gets the value of driverName.
     *
     * @return the value of driverName
     */

    public String getDriverName() {
        return driverName;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    /**
     * Gets the value of url.
     *
     * @return the value of url
     */

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * Gets the value of con.
     *
     * @return the value of con
     */

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    /**
     * Gets the value of stm.
     *
     * @return the value of stm
     */

    public Statement getStm() {
        return stm;
    }

    public void setStm(Statement stm) {
        this.stm = stm;
    }

    /**
     * Gets the value of rs.
     *
     * @return the value of rs
     */

    public ResultSet getRs() {
        return rs;
    }

    public void setRs(ResultSet rs) {
        this.rs = rs;
    }

    /**
     * Gets the value of response.
     *
     * @return the value of response
     */

    public HttpServletResponse getResponse() {
        return response;
    }

    /**
     * Gets the value of user.
     *
     * @return the value of user
     */

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    /**
     * Gets the value of password.
     *
     * @return the value of password
     */

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }

    public Statement getStatement(){
        try{
            Class.forName(getDriverName());
            con = DriverManager.getConnection(getUrl(),getUser(),getPassword());
            return con.createStatement();
        }catch (Exception e){
            e.printStackTrace();
            message("无法完成数据库的连接或者无法返回容器，请检查getStatemen()方法！");
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

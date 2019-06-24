package controller.Search;

import dao.DBBean;
import dao.PageBean;
import dao.siteBean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class pageServlet extends HttpServlet {
    DBBean DBBean = new DBBean();

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            showtwo(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    public void showtwo(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{

        // 当前是第几页
        String currentpageStr = request.getParameter("currentpage") == null ? "1"
                : request.getParameter("currentpage");
        int currentpage = Integer.parseInt(currentpageStr);
        // 每页显示多少条
        int maximum = 8;
        // 可以显示多少页
        int viewperpage = 10;

        Statement st=DBBean.getStatement();
        String sql="select * from sitelist limit "+ (currentpage - 1) * maximum + "," + maximum;
        ResultSet rs=st.executeQuery(sql);
        List<siteBean> list=new ArrayList<siteBean>();
        while(rs.next()){
            int siteId=rs.getInt("siteId");
            String siteName=rs.getString("siteName");
            siteBean stu=new siteBean(siteId,siteName);
            list.add(stu);
        }
        String sql2="select * from sitelist";
        ResultSet rs2=st.executeQuery(sql2);
        int count=0;
        while(rs2.next()){
            count++;
        }

        long totalrecordnumber=count;
        // 将数据都封装到pageView
        PageBean pageView =new PageBean(list, totalrecordnumber, currentpage, maximum, viewperpage);
        request.setAttribute("pageView", pageView);
        request.setAttribute("list", list);
        request.getRequestDispatcher("/Search/siteList.jsp").forward(request, response);

    }
}  
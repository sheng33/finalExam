package controller.Search;

import com.google.gson.Gson;
import controller.MyException;
import dao.ClassNav;
import dao.siteBean;
import service.classService;
import service.siteService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class searchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Gson gson = new Gson();
        String str = req.getParameter("siteName");
        if(str.equals("")){
            try {
                throw new MyException("输入框为空",req,resp);
            } catch (MyException e) {
                e.printStackTrace();
            }
        }
        try {
            siteService db = new siteService();
            ResultSet rs = db.selectSite(str);
            resp.setContentType("text/json;charset=UTF-8");
            resp.setCharacterEncoding("UTF-8");
            PrintWriter out = resp.getWriter();
            ArrayList sz = new ArrayList();
            while(rs.next()){
                siteBean siteBean = new siteBean();
                siteBean.setSiteId(rs.getInt("siteId"));
                siteBean.setSiteName(rs.getString("siteName"));
                sz.add(siteBean);
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

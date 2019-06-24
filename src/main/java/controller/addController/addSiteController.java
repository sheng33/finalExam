package controller.addController;

import com.google.gson.JsonObject;
import controller.MyException;
import service.siteService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class addSiteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {


            BufferedReader bufr =
                    new BufferedReader(
                            new InputStreamReader(req.getInputStream(),"UTF-8"));
            StringBuilder sBuilder = new StringBuilder("");
            String temp = "";
            while((temp = bufr.readLine()) != null){
                sBuilder.append(temp);
            }
            bufr.close();
            String json = sBuilder.toString();

            ArrayList arrayList = new ArrayList();
            Matcher m = Pattern.compile(":\"(.*?)\"}").matcher(json);
            while(m.find()){
                String str1= m.group().replaceAll(":\"|\"}","");
                arrayList.add(str1);
            }
            for(Object str : arrayList){
                System.out.println("str"+str);
                if(str.equals("")){
                    throw new MyException("站点输入框不能为空",req,resp);
                }
            }
            siteService siteService = new siteService();
            siteService.addSite(arrayList);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        doGet(req, resp);
    }
}

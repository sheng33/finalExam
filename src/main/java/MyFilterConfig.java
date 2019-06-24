import controller.MyException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName="log",urlPatterns={"/*"})
public class MyFilterConfig implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest)request;
        String url=httpServletRequest.getRequestURI();
        String str = (String)((HttpServletRequest) request).getSession().getAttribute("QZ");
        if(url.indexOf("hccx")!=-1){
            request.getRequestDispatcher("main.jsp").forward(request,response);
        }else if (url.indexOf("xlcx")!=-1){
            request.getRequestDispatcher("xlcx.jsp").forward(request,response);
        }else if (url.indexOf("zdcx")!=-1){
            request.getRequestDispatcher("zdcx.jsp").forward(request,response);
        }else if (url.indexOf("exit")!=-1){
            ((HttpServletRequest) request).getSession().setAttribute("QZ","0");
            request.getRequestDispatcher("/Page/index.jsp").forward(request,response);
        }else if (url.indexOf("addSitePage")!=-1){
            if (str.equals("0")){
                try {
                    throw  new MyException("您无权限访问该路径",(HttpServletRequest)request,(HttpServletResponse) response);
                } catch (MyException e) {
                    e.printStackTrace();
                }
            }
            request.getRequestDispatcher("/admin/addSitePage.jsp").forward(request,response);
        }else if (url.indexOf("addCarPage")!=-1){
            if (str.equals("0")){
                try {
                    throw  new MyException("您无权限访问该路径",(HttpServletRequest)request,(HttpServletResponse) response);
                } catch (MyException e) {
                    e.printStackTrace();
                }
            }
            request.getRequestDispatcher("/admin/addCarPage.jsp").forward(request,response);
        }else{
            chain.doFilter(request, response);
        }

    }
}
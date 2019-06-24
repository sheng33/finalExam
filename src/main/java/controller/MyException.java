package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MyException extends Exception {
    public MyException() {
        super();
    }

    public MyException(String message, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(request.getRequestURI());
        String str;
        String url = request.getRequestURL().toString();
        if(url.lastIndexOf("admin") != -1){
            str = "admin/index.jsp";
        }else{
            str = "Page/main.jsp";
        }
        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().print("<html><script src=\"../static/js/jquery.js\"></script>" +
                "    <script src=\"../static/bootstrap/js/bootstrap.min.js\"></script>\n" +
                "    <link rel=\"stylesheet\"\n" +
                "          href=\"../static/bootstrap/css/bootstrap.min.css\" />"+
                "<script>$(document).ready(function(){ \n" +
                        "    $('#tishi').modal('show')\n" +
                        "}); </script>"+
                "<body><div class=\"modal fade\" id=\"tishi\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalCenterTitle\" aria-hidden=\"true\">\n" +
                "        <div class=\"modal-dialog modal-dialog-centered\"style=\"margin: auto 20rem;\" role=\"document\">\n" +
                "            <div class=\"modal-content\">\n" +
                "                <div class=\"modal-header\">\n" +
                "                    <h5 class=\"modal-title\" id=\"exampleModalLongTitle\">提示信息</h5>\n" +
                "                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n" +
                "                        <span aria-hidden=\"true\">&times;</span>\n" +
                "                    </button>\n" +
                "                </div>\n" +
                "                <div class=\"modal-body\">\n" +
                                    message +
                "                </div>\n" +
                "                <div class=\"modal-footer\">\n" +
                "                    <button type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\" onclick=\"window.location.href='/"+str+"'\">关闭</button>\n" +
                "                </div>\n" +
                "            </div>\n" +
                "        </div>\n" +
                "    </div></body></html>");
        response.getWriter().close();

    }
}

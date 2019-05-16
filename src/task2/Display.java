package task2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Display
 */
@WebServlet(description = "返回个人简介的信息", urlPatterns = {"/Display"}, asyncSupported = false, loadOnStartup = -1)
public class Display extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Display() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String sex = request.getParameter("sex");
        String school = request.getParameter("school");
        String info = request.getParameter("info");
        String hobbies = request.getParameter("hobbies");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset='UTF-8' />");
        out.println("</head>");
        out.println("<body>");
        out.println("<div>");
        out.println("<div style='width: 75%;'>");
        out.println("<p>姓名：" + name + "</p>");
        out.println("<p>年龄：" + age + "</p>");
        out.println("<p>性别：" + sex + "</p>");
        out.println("<p>学院：" + school + "</p>");
        out.println("<p>个人简介：" + info + "</p>");
        out.println("<p>兴趣爱好：" + hobbies + "</p>");
        out.println("</div>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
        out.close();
    }

}

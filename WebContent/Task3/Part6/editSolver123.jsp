<!-- editSolver123.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<jsp:useBean id="connector" scope="page" class="task3.DatabaseConnect123"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8" />
<title>修改中，请稍候……</title>
<style type="text/css">
* {
    margin: auto;
    padding: auto;
    text-align: center;
}

h1 {
    margin: 25px auto;
}

td {
    padding: 10px;
}

.title>td {
    font-weight: bold;
}
</style>
</head>
<body>
  <%
      request.setCharacterEncoding("UTF-8");
      int number = Integer.parseInt(request.getParameter("number"));
      String name = request.getParameter("name");
      String sex = request.getParameter("sex");
      int age = Integer.parseInt(request.getParameter("age"));
      String department = request.getParameter("department");
      int experiment = Integer.parseInt(request.getParameter("experiment"));
      int effect = connector.executeModify("UPDATE [dbo].[employee123] SET [Number]=" + number + ", [Name]='"
          + name + "', [Sex]='" + sex + "', [Age]=" + age + ", [Department]='" + department + "', [Experiment]="
          + experiment + " WHERE [Number]=" + number);
      if (effect != 0) {
          out.println("<script>");
          out.println("alert('编辑成功！');");
          out.println("window.location.href='modify123.jsp';");
          out.println("</script>");
      } else {
          out.println("<script>");
          out.println("alert('编辑失败！');");
          out.println("window.location.href='edit123.jsp';");
          out.println("</script>");
      }
  %>
</body>
</html>
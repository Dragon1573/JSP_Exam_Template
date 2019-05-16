<!-- modify123.jsp -->
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<jsp:useBean id="connector" scope="page" class="task3.DatabaseConnect123"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8" />
<title>模糊查询</title>
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
  <div>
    <div style="width: 75%;">
      <h1>表格显示数据并模糊查询</h1>
      <form action="modify123.jsp" method="post">
        <div>
          输入工号： <input type="text" name="Keywords" />
        </div>
        <div>
          <input type="submit" value="查询" />
        </div>
      </form>
      <%
          // 指定参数编码格式
          request.setCharacterEncoding("UTF-8");
          String keywords = request.getParameter("Keywords");
          if (keywords == null) {
              keywords = "";
          }
          try {
              String sql = "SELECT * FROM [dbo].[employee123] WHERE [Number] LIKE '%" + keywords + "%'";
              ResultSet resultSet = connector.executeSelect(sql);
              if (resultSet != null) {
                  out.println("<br />");
                  out.println("<table>");
                  out.println("<tbody>");
                  out.println("<tr class='title'>");
                  out.println("<td>工号</td>");
                  out.println("<td>姓名</td>");
                  out.println("<td>性别</td>");
                  out.println("<td>年龄</td>");
                  out.println("<td>部门</td>");
                  out.println("<td>工龄</td>");
                  out.println("<td colspan='2'>操作</td>");
                  out.println("</td>");
                  while (resultSet.next()) {
                      out.println("<tr>");
                      out.println("<td>" + resultSet.getInt("Number") + "</td>");
                      out.println("<td>" + resultSet.getString("Name") + "</td>");
                      out.println("<td>" + resultSet.getString("Sex") + "</td>");
                      out.println("<td>" + resultSet.getInt("Age") + "</td>");
                      out.println("<td>" + resultSet.getString("Department") + "</td>");
                      out.println("<td>" + resultSet.getInt("Experiment") + "</td>");
                      out.println("<td>");
                      out.println("<a href='edit123.jsp?id=" + resultSet.getInt("Number") + "'>编辑</a>");
                      out.println("</td>");
                      out.println("<td>");
                      out.println("<a href='delete123.jsp?id=" + resultSet.getInt("Number") + "'>删除</a>");
                      out.println("</td>");
                      out.println("</tr>");
                  }
                  out.println("</tbody>");
                  out.println("</table>");
              }
          } catch (SQLException e) {
              e.printStackTrace();
          }
      %>
    </div>
  </div>
</body>
</html>
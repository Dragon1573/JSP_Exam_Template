<!-- edit123.jsp -->
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<jsp:useBean id="connector" scope="page" class="task3.DatabaseConnect123"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8" />
<title>员工信息更改</title>
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
  <h1>员工信息修改</h1>
  <%
      int number = -1;
      String name = null;
      String sex = null;
      int age = -1;
      String department = null;
      int experiment = -1;
      if (request.getParameter("id") == null) {
          response.sendRedirect("modify123.jsp");
      } else {
          int id = Integer.parseInt(request.getParameter("id"));
          if (id != 0) {
              ResultSet resultSet =
                  connector.executeSelect("SELECT * FROM [dbo].[employee123] WHERE [Number]=" + id);
              resultSet.next();
              number = resultSet.getInt("Number");
              name = resultSet.getString("Name");
              sex = resultSet.getString("Sex");
              age = resultSet.getInt("Age");
              department = resultSet.getString("Department");
              experiment = resultSet.getInt("Experiment");
          }
      }
  %>
  <form action="editSolver123.jsp" method="post">
    <table>
      <tbody>
        <tr class="title">
          <td>工号</td>
          <td>姓名</td>
          <td>性别</td>
          <td>年龄</td>
          <td>部门</td>
          <td>工龄</td>
        </tr>
        <tr>
          <td><input type="number" name="number" value="<%=number%>" readonly="readonly" /></td>
          <td><input type="text" name="name" value="<%=name%>" /></td>
          <td><input type="text" name="sex" value="<%=sex%>" /></td>
          <td><input type="number" name="age" value="<%=age%>" /></td>
          <td><input type="text" name="department" value="<%=department%>" /></td>
          <td><input type="number" name="experiment"
            value="<%=experiment%>" /></td>
        </tr>
        <tr>
          <td colspan="6"><input type="submit" value="修改" /> <input
            type="reset" value="清空" /></td>
        </tr>
      </tbody>
    </table>
  </form>
</body>
</html>
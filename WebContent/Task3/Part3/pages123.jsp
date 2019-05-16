<!-- pages123.jsp -->
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<jsp:useBean id="connector" scope="page" class="task3.DatabaseConnect123"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8" />
<title>数据库详情</title>
<style type="text/css">
* {
    margin: auto;
    padding: auto;
    text-align: center;
}

td {
    padding: 10px;
}

.Title {
    font-weight: bold;
}
</style>
</head>
<body>
  <div>
    <div style="width: 75%">
      <h1 style="margin: 25px auto;">数据列表</h1>
      <%
          // 每页的数据量
          final int pageSize = 5;
          // 当前页
          int tempPage = 1;
          // 总页数
          int totalPage = 1;
          // 总记录数
          int totalRow = 0;
          // 指定通信编码
          request.setCharacterEncoding("UTF-8");

          try {
              // 统计总行数
              ResultSet resultSet =
                  connector.executeInsensitiveSelect("SELECT COUNT(*) AS [rowCount] FROM [dbo].[employee123]");
              if (resultSet != null && resultSet.next()) {
                  totalRow = resultSet.getInt("rowCount");
              }
              resultSet = connector.executeInsensitiveSelect("SELECT * FROM [dbo].[employee123]");
              if (totalRow % pageSize == 0) {
                  // 满页
                  totalPage = totalRow / pageSize;
              } else {
                  totalPage = (int)Math.floor(totalRow / pageSize) + 1;
              }
              if (request.getParameter("Page") == null || request.getParameter("Page").equals("")) {
                  tempPage = 1;
              } else {
                  try {
                      tempPage = Integer.parseInt(request.getParameter("Page"));
                  } catch (NumberFormatException e) {
                      tempPage = 1;
                  }
              }
              if (tempPage < 1) {
                  tempPage = 1;
              } else if (tempPage > totalPage) {
                  tempPage = totalPage;
              }
              if (resultSet != null) {
                  resultSet.absolute((tempPage - 1) * pageSize + 1);
      %>
      <table>
        <tbody>
          <tr>
            <td class="Title">工号</td>
            <td class="Title">姓名</td>
            <td class="Title">性别</td>
            <td class="Title">年龄</td>
            <td class="Title">部门</td>
            <td class="Title">工龄</td>
            <td colspan="2" class="Title">操作</td>
          </tr>
          <%
              for (int i = 1; i <= pageSize; i++) {
          %>
          <tr>
            <td><%=resultSet.getInt("Number")%></td>
            <td><%=resultSet.getString("Name")%></td>
            <td><%=resultSet.getString("Sex")%></td>
            <td><%=resultSet.getInt("Age")%></td>
            <td><%=resultSet.getString("Department")%></td>
            <td><%=resultSet.getInt("Experiment")%></td>
            <td><a href="modify.jsp?id=<%=resultSet.getString("Number")%>">编辑</a>
            </td>
            <td><a href="delete.jsp?id=<%=resultSet.getString("Number")%>">删除</a>
            </td>
          </tr>
          <%
              if (!resultSet.next()) {
                              break;
                          }
                      }
                  }
              } catch (SQLException e) {
                  e.printStackTrace();
              }
          %>
        </tbody>
      </table>
      <form action="pages123.jsp" method="get">
        <%
            if (tempPage != 1) {
        %>
        <a href="pages123.jsp?Page=1">首页</a> <a
          href="pages123.jsp?Page=<%=tempPage - 1%>">上一页</a>
        <%
            }
            if (tempPage != totalPage) {
        %>
        <a href="pages123.jsp?Page=<%=tempPage + 1%>">下一页</a> <a
          href="pages123.jsp?Page=<%=totalPage%>">末页</a>
        <%
            }
        %>
        <br /> 输入页数： <input type="text" name="Page" size="3" /> 页数： <font
          color="red"><%=tempPage%>/<%=totalPage%></font>
      </form>
    </div>
  </div>
</body>
</html>
<!-- delete123.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<jsp:useBean id="connector" scope="page" class="task3.DatabaseConnect123"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8" />
<title>删除商品</title>
<style type="text/css">
* {
    margin: auto;
    padding: auto;
    text-align: center;
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
      if (request.getParameter("id") == null) {
          response.sendRedirect("modify123.jsp");
      } else {
          String id = request.getParameter("id");
          if (id != null && id != "") {
              int effect = connector.executeModify("DELETE FROM [dbo].[employee123] WHERE [Number]=" + id);
              if (effect != 0) {
  %>
    <script type="text/javascript">
      alert("删除成功！");
      window.location.href="modify123.jsp";
    </script>
  <%
              } else {
  %>
    <script type="text/javascript">
      alert("删除失败！");
      window.location.href="modify123.jsp"
    </script>
  <%
              }
          }
      }
  %>
</body>
</html>
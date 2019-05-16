<!-- insertSolver123.jsp -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="connector" scope="page" class="task3.DatabaseConnect123"></jsp:useBean>
<html>
<head>
<meta charset="UTF-8" />
<title>数据插入中，请稍候……</title>
<%
    // 设置参数编码格式    
    request.setCharacterEncoding("UTF-8");
    // 用户输入的数据集
    String[] parameters = new String[6];
    parameters[0] = request.getParameter("Number");
    parameters[1] = request.getParameter("Name");
    parameters[2] = request.getParameter("Sex");
    parameters[3] = request.getParameter("Age");
    parameters[4] = request.getParameter("Department");
    parameters[5] = request.getParameter("Experiment");
    // 分段形成插入语句
    String sqlString =
        "INSERT INTO [dbo].[employee123] ([Number], [Name], [Sex], [Age], [Department], [Experiment]) VALUES (";
        sqlString += parameters[0] + ", ";
        sqlString += "'" + parameters[1] + "', ";
        sqlString += "'" + parameters[2] + "', ";
        sqlString += parameters[3] + ", ";
        sqlString += "'" + parameters[4] + "', ";
        sqlString += parameters[5] + ")";
    System.out.println(sqlString);
    // 受到影响的行数
    int effect = connector.executeModify(sqlString);
    // 当受到影响的行数不为0
    if (effect != 0) {
        out.println("<script type='text/javascript'>");
        out.println("alert('添加成功！');");
        out.println("window.location.href='insert123.jsp';");
        out.println("</script>");
    } else {
        out.println("<script type='text/javascript'>");
        out.println("alert('错误：添加失败！');");
        out.println("window.location.href='insert123.jsp';");
        out.println("</script>");
    }
%>
</head>
<body>
</body>
</html>
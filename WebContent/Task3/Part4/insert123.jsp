<!-- insert123.jsp -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<title>输入数据</title>
<style type="text/css">
* {
    margin: auto;
    padding: auto;
    text-align: center;
}

input {
    text-align: left;
}
</style>
</head>
<body>
  <div>
    <form action="insertSolver123.jsp">
      <table>
        <tbody>
          <tr>
            <td style="font-size: 36; font-weight: bold; margin: 10px auto;"
              colspan="2">数据输入</td>
          </tr>
          <tr>
            <td>工号：</td>
            <td><input type="number" name="Number" /></td>
          </tr>
          <tr>
            <td>姓名：</td>
            <td><input type="text" name="Name" /></td>
          </tr>
          <tr>
            <td>性别：</td>
            <td><input type="text" name="Sex" /></td>
          </tr>
          <tr>
            <td>年龄：</td>
            <td><input type="number" name="Age" /></td>
          </tr>
          <tr>
            <td>部门：</td>
            <td><input type="text" name="Department" /></td>
          </tr>
          <tr>
            <td>工龄：</td>
            <td><input type="number" name="Experiment" /></td>
          </tr>
          <tr>
            <td colspan="2"><input type="submit" value="插入" /> <input
              type="reset" value="清空" /></td>
          </tr>
        </tbody>
      </table>
    </form>
  </div>
</body>
</html>
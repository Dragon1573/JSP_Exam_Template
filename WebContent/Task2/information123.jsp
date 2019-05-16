<!-- information123.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8" />
<title>个人简介</title>
<style type="text/css">
* {
    margin: auto;
    padding: auto;
    text-align: center;
}

h1 {
    margin: 25px auto;
}

.title {
    font-weight: bold;
}

ol * {
    text-align: left;
}

textarea {
    resize: none;
}
</style>
</head>
<body>
  <form style="width: 50%;" action="/20170060123Huang/Display" method="post">
    <h1>个人简介</h1>
    <ol>
      <li>您的姓名：<input type="text" name="name" /></li>
      <li>您的年龄：<input type="number" name="age" /></li>
      <li>您的性别：<input type="text" name="sex" /></li>
      <li>您的学院：<input type="text" name="school" /></li>
      <li>个人简介：<textarea name="info" rows="10" cols="80" spellcheck="true"></textarea></li>
      <li>兴趣爱好：<textarea name="hobbies" rows="10" cols="80"></textarea></li>
    </ol>
    <div><input type="submit" value="提交" /><input type="reset" value="清空" /></div>
  </form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="cn.bdqn.bean.*,java.util.*"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EL表达式</title>
</head>
<body>
<%
pageContext.setAttribute("a", "aaa");
request.setAttribute("b", "bbb");
session.setAttribute("c", "ccc");
application.setAttribute("d", "ddd");
 %>
 EL表达式:<br/>
 ${pageScope.a}
 ${requestScope.b}
 ${sessionScope.c}
 ${applicationScope.d}
 <br/>
 <%
 User user1=new User(1,"aaa");
 User user2=new User(2,"bbb");
 User user3=new User(3,"ccc");
 User user4=new User(4,"ddd");
 List<User> list=new ArrayList<User>();
 list.add(user1);
 list.add(user2);
 list.add(user3);
 list.add(user4);
 session.setAttribute("list", list);
  %>
  EL表达式: ${list[1].name}
  <hr>
 <!-- 使用标签遍历 -->
 <c:forEach items="${list}" var="users"  >
 	编号是:${users.id}<br/>
 	姓名是:${users.name}<br/>
 </c:forEach>
 <hr>
 <!-- set标签的使用 -->
 <%
 String name="xiaohei";
 session.setAttribute("name", name);
  %>
 el拿到值:${sessionScope.name}
 <hr>
 <!-- 重新给name赋值 ,并把name放到request域中-->
 <c:set var="name" value="baibai" scope="request"></c:set>
  el拿到值:${requestScope.name}
  <%
  User user=new User(10,"xiaohei");//一个用户对象
 	session.setAttribute("user", user);
   %>
   <!-- 修改user对象name属性的值 -->
   <c:set target="${user}" property="name" value="xiaobaibai888"></c:set>
   姓名是:${user.name}
</body>
</html>
<%@ page import="com.netcracker.hritsay.entity.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.netcracker.hritsay.dao.DAOConnection" %>
<%@ page import="com.netcracker.hritsay.dao.OracleDAOConnection" %>
<%@ page import="oracle.jdbc.driver.OracleDriver" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Driver" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%--
  Created by IntelliJ IDEA.
  User: Bogdan
  Date: 23.03.2020
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Ajax Example</title>

  </head>
  <body>
    <%
      String name = request.getParameter("val");


      DAOConnection daoConnection = OracleDAOConnection.getInstance();
      List<Student> bd = daoConnection.selectAllStudents();




      if (name == null || name.trim().equals("")) {   %>
      <p>Please, enter your name </p>
    <%
      } else {
        boolean flag = false;
        Student currentStudent = null;
        List<Student> showStudents = new ArrayList<>();
        for (Student student : bd) {
          Pattern pattern = Pattern.compile("^" + name + "[a-zA-Z]*");
          Matcher matcher = pattern.matcher(student.getName());

          if(matcher.find()) {
            currentStudent = student;
            flag = true;
            showStudents.add(currentStudent);
          }
        }
        if(!flag) { %>
          <p>No records in DB!</p>
    <%} else {%>
          <table>
            <tr>
              <th>ID</th>
              <th>NAME</th>
              <th>SCHOLARSHIP</th>
            </tr>
            <% for(int i = 0; i < showStudents.size(); i++) { %>
            <tr>
              <td><%= showStudents.get(i).getId()%></td>
              <td><%= showStudents.get(i).getName()%></td>
              <td><%= showStudents.get(i).getScholarship()%></td>
            </tr>
            <% } %>
          </table>
        <%
        }
      }
    %>

  </body>
</html>

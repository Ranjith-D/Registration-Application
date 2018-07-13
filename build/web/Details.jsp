<%-- 
    Document   : Details
    Created on : Sep 29, 2016, 4:08:14 PM
    Author     : Sanju
--%>



<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
    <title>Register</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
      <body>
          <div class="container">
              <table class="table table-hover tabel-border">
                  <thead>
                      <tr>
                          <th>ID</th>
                          <th>UserName</th>
                          <th>Password</th>
                          <th>Gender</th>
                          <th>Hobbies</th>
                          <th>Email</th>
                          <th>PhoneNo</th>
                          <th>Country</th>
                          <th>Date</th>
                          <th>DOJ</th>
                          <th>----------</th>>
                      </tr>
                  </thead>
                  <tbody>
                      <%
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanjay","root","");
                          Statement st=con.createStatement();
                          ResultSet rs=st.executeQuery("select * from register");
                          ResultSetMetaData rsmd=rs.getMetaData();
                          while(rs.next())
                          {
                              %>
                              <tr>
                                  <%
                              for(int i=1;i<=rsmd.getColumnCount();i++)
                              {
                                  %>
                                  <td><%=rs.getString(i)%></td>
                 
                                  <%
                              }
                              
                               %>
                              <td> <a href="DeleteView.jsp?id=<%=rs.getString(1)%>"><button type="button"class="btn-success">Delete</button></a></td>
                              </tr>
                        <%}
                       %>
                  </tbody>
              
              </div>
              
          </div>
    </body>
</html>

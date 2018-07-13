<%-- 
    Document   : SelectDelete
    Created on : Sep 29, 2016, 8:19:35 PM
    Author     : Sanju
--%>



<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
        <div class='container'>
            <br><p>Select Email to delete </p><br>
            <form action="" method="post">
            <select name='email'>
                <option>---Select---</option>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanjay","root","");
                    PreparedStatement ps = con.prepareStatement("select Email from Register");
                    ResultSet rs = ps.executeQuery();
                    ResultSetMetaData rsmd = rs.getMetaData();
                    
                    int row=0;
                    while(rs.next())
                    {
                            
                        row=rs.getRow();
                        for(int i=1;i<=rsmd.getColumnCount();i++)
                            {
                                
                    %>
                    <option><%=rs.getString(i)%></option>
                    
                    <%
                            }
                            
                    }
                    
                %>
               
            </select>
               
                        <br><input type="submit" class="btn btn-danger" value="ok"></input>
                </form>
               
                  <%
                if("post".equalsIgnoreCase(request.getMethod()))
                {
                    String email = request.getParameter("email");
                   // Class.forName("com.mysql.jdbc.Driver");
                  //  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanjay","root","");
                    PreparedStatement ps1= con.prepareStatement("delete from register where Email=?");
                    ps1.setString(1, email);
                    int i=ps1.executeUpdate();
                    if(i>0)
                    {
            %>
            <p>The record with email: <%=email%> deleted</p>
            <%
                    }
                    else
                    {
            %>
            <p>Error...try again ;)</p>
            <%
                    }
                    
                }
            
           %>
            
        </div>
    </body>
</html>

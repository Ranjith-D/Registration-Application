<%-- 
    Document   : index
    Created on : Sep 27, 2016, 6:46:14 PM
    Author     : Sanju
--%>

<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

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
    
        <div class="container">
            <table class="table ">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                       
                    </tr>
                </thead>
                <tbody>
                <form action="#" method="post">
                    <tr>
                        <td>User Name </td>
                        <td><input type="text" name="un" ></input></td>
                        <td>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>Password  </td>
                        <td><input type="password" name="pwd" ></input></td>
                        
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td><input type="radio" name="gdr" value="male" > : Male</input>
                            <input type="radio" name="gdr" value="female"> : Female</input>
                        </td>
                    </tr>
                    <tr>
                        <td>Hobbies</td>
                        <td>
                            <input type="checkbox" name="sports" value="Cricket">Cricket</input>
                            <input type="checkbox" name="sports" value="Football">Football</input>
                            <input type="checkbox" name="sports" value="Basketball">Basketball</input>
                            <input type="checkbox" name="sports" value="Kabaddi">Kabaddi</input>
                            <input type="checkbox" name="sports" value="Badminton">Badminton</input>
                        </td>
                    </tr>
                     <tr>
                        <td>Email  </td>
                        <td><input type="text" name="email" ></input></td>
                    </tr>
                    <tr>
                        <td>Phone No  </td>
                        <td><input type="text" name="ph" ></input></td>
                    </tr>
                    <tr>
                        <td>Country</td>
                        <td>
                            <select name="ctr">
                                <option>India</option>
                                <option>China</option>
                                <option>Indonesia</option>
                                <option>Pakistan</option>
                                <option>Bangladesh</option>
                                <option>Russia</option>
                                <option>japan</option>
                                <option>Philippines</option>
                                <option>Vietnam</option>
                             </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Date Of Birth</td>
                        <td><input type="date" name="dob"></input></td>
                    </tr>
                    <tr>
                        <td><input type="submit" class="btn btn-success" value="Register"></td>
                        <td><input type="reset" class="btn btn-default" value="Clear"></input></td>
                    </tr>
                </form>>
                </tbody>
                
            </table>
              <a href="Details.jsp"><button type="button" class="btn btn-primary">View Details</button></a>
            
              <a href="DeleteByEmail.jsp"><button type="button" class="btn btn-danger">DeleteRecord</button></a>
            
              <a href="SelectDelete.jsp"><button type="button" class="btn btn-danger">SelectDelete</button></a><br>
           
            <%
               
  
            
          
                if("post".equalsIgnoreCase(request.getMethod()))
                {
                        
                        String name=request.getParameter("un");
                        String password=request.getParameter("pwd");
                        String gender=request.getParameter("gdr");
                        String email=request.getParameter("email");
                         
                        String phno=request.getParameter("ph");
                      
                        String dob=request.getParameter("dob");
                        String country=request.getParameter("ctr");
                     
                        String [] hobbies=request.getParameterValues("sports");
                        String hobby="";
                        for(String x:hobbies){
                            hobby+=x+", ";
                        }
                       
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sanjay","root","");
                        PreparedStatement ps1=con.prepareStatement("select * from register where Email=? or PhoneNo=?");
                        ps1.setString(1, email);
                        ps1.setString(2, phno);
                        
                       ResultSet rs=ps1.executeQuery();
                        
                        int row=0;
                        
                        while(rs.next()){
                                row=rs.getRow();
                            }
                        
                        if(row==0){
                                Date d=new Date();        
         
                                SimpleDateFormat s=new SimpleDateFormat("dd/MM/YYYY hh:mm:ss");
                                String curdate=s.format(d);
                                String str="insert into register(UserName,Password,Gender,Hobbies,Email,PhoneNo,Country,Date,DOJ) values(?,?,?,?,?,?,?,?,?)";
                                PreparedStatement ps2=con.prepareStatement(str);
                               
                                ps2.setString(1, name);
                                
                                ps2.setString(2, password);
                                ps2.setString(3, gender);
                                ps2.setString(4, hobby);
                                ps2.setString(5, email);
                                ps2.setString(6, phno);
                                ps2.setString(7, country);
                                ps2.setString(8, dob);
                                ps2.setString(9, curdate);
                                 
                       
                                 int i=ps2.executeUpdate();
                                          
                                if(i>0)
                                {
            %>
                   <br><p class='text-success'><span> inserted.!.</span></p>
            <%
                                }
                                 else
                                {
           %>
                    <br><p class='text-danger'><span>error..not inserted.!</span></p>
            <%
                                }
                        }
                        else
                        {
            %>
                      <br><p class='text-danger'><span>email or phone number already exists</span></p>
            <%
                        }
                }
            %>
          
        </div>

        
    
</html>

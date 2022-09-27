<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="anyErrorPage.jsp"%>
    <%@ page import = "java.sql.*" %>
    
    
    <!-- This is the Home Page All the Employees Details are displayed-->
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Employees</title>
    <link rel="stylesheet" href="allEmp.css">
</head>
<body>
<div class="container">

	<%
		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/quadwave", "postgres", "123");
		Statement stmt = null; 
		ResultSet rs = null; 
		stmt = con.createStatement();
		rs = stmt.executeQuery("select * from employees");
		
	%>

        <div class="firstContainer">
            <div class="searchCont">
                <form action="Search.jsp" method="get">
                    <input type="text" name="search" class="inputBox" id="search" title="search">
                    <input type="submit" value="Search" class="button">
                </form>
            </div>
            <div class="addContainer">
                <input type="button" value="ADD" id="addDemoCont" title="Add new Employee Information" class="button" onclick="openPopup()">
            </div>

        </div>
        <hr style="color: red; size: 10px;">
        <div class="tableContainer">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Date of Joining</th>
                    <th>YOE</th>
                    <th>Designation</th>
                </tr>
               <%
               	while(rs.next()){
               %>
                <tr>
                    <td><% out.println(rs.getInt(1)); %></td>
                    <td><% out.println(rs.getString(2)); %></td>
                    <td><% out.println(rs.getDate(3)); %></td>
                    <td><% out.println(rs.getInt(4)); %></td>
                    <td><% out.println(rs.getString(5)); %></td>
                </tr>
                <%} %>
            </table>
        </div>
        <br>
        <br>
        <div class="popup" id="popup" style="background-color: rgb(119, 158, 166);">

            <br>
            <br>
            <form action="addEmp" method="post" id="popupForm">
                <div class="titleForm" id="titleForm">
                    <h4>Add Employee</h4>
                </div>
                <div class="idCont">
                    Employee ID : <input type="number" name="Eid" class="inputBox" id="id"><br><br>
                </div>
                <div class="name">
                    Employee Name: <input type="text" class="inputBox" name="EName" id="name"><br><br>
                </div> 
                <div class="yearEx">
                    Year of Experience : <input type="number" class="inputBox" name="yoe" id="yoe"><br><br>
                </div>
                <div class="desig">
                    Designation : <input type="text" class="inputBox" name="desi" id="desi"><br>
                </div>
                <div class="butContain">
                    <div class="submitCont">
                        <input type="submit" value="Save" class="button">
                    </div>
                    <div class="cancelCont">
                        <button type="reset" onclick="closePopup()" class="button">Cancel</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <hr>
    <script>
        let popup = document.getElementById('popup');
        
        function openPopup(){
            popup.classList.add('open-popup');
        }
        function closePopup(){
            popup.classList.remove('open-popup');
        }
    </script>
</body>
<!-- CSS only -->


</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Searched Employee</title>
</head>
    <link rel="stylesheet" href="allEmp.css">
<body>
<div class="container">

	<%
		Class.forName("org.postgresql.Driver");
		Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/quadwave", "postgres", "123");
		Statement stmt = null; 
		ResultSet rs = null; 
		stmt = con.createStatement();
		String search = request.getParameter("search");
		rs = stmt.executeQuery("select * from employees where name='"+search+"'");
	%>

        <div class="firstContainer">

            <div class="searchCont">
                <form action="Search.jsp" method="get">
                    <input type="text" name="search" class="inputBox" id="search" title="search">
                    <input type="submit" value="Search" class="button">
                </form>
            </div>
            <div class="addContainer">
                <input type="button" value="ADD" id="addDemoCont" class="button" title="Add new Employee Information" onclick="openPopup()">
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
        <div class="popup" id="popup">

            <br>
            <br>
            <form action="addEmp" method="post">
                <div class="titleForm">
                    <h4>Add Employee</h4>
                </div>
                <div class="idCont">
                    Employee ID : <input type="number" name="Eid" id="id" class="inputBox"><br><br>
                </div>
                <div class="name">
                    Employee Name: <input type="text" name="EName" id="name" class="inputBox"><br><br>
                </div>
                <div class="yearEx">
                    Year of Experience : <input type="number" name="yoe" id="yoe" class="inputBox"><br><br>
                </div>
                <div class="desig">
                    Designation : <input type="text" name="desi"  id="desi" class="inputBox"><br>
                </div>
                <div class="butContain">
                    <div class="submitCont">
                        <input type="submit"  class="button" value="Save">
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
</html>
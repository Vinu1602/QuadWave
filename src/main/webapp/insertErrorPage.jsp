<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Error</title>
<link rel="stylesheet" href="insertErrorPage.css">
</head>
<body>

<%
	String str = (String)request.getAttribute("msg");
%>
    <div class="container">
        <div class="inside">
            <form action="allEmp.jsp">
                <h1>Some Exception Occured!!!!</h1>
                <h2>Record Not Inserted</h2>
                <h3>Error : <%=str %><br>Click on the
                    below button for All Employees</h3>
                <button type="submit">All Employees</button>
            </form>
        </div>
    </div>

</body>
</html>
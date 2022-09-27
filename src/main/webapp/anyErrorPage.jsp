<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="anyErrorPage.css">
</head>
<body>
	<div class="container">
        <div class="inside">
            <form action="allEmp.jsp">
                <h1>Some Exception Occured!!!!</h1>
                <h3>Error : <%//=exception.getMessage() %><br>Click on the
                    below button for All Employees</h3>
                <button onclick="goAllEmp()">All Employees</button>
            </form>
        </div>
    </div>
</body>
</html>
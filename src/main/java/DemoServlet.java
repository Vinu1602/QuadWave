import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

//This is a demo servlet for Connection Checking. 

public class DemoServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException{
		PrintWriter out = res.getWriter();
		out.println("Hello world");
		try {			
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/student", "postgres", "123");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from details");
			while(rs.next()) {
				out.println("Roll Number = "+rs.getInt(1));
				out.println("Name = "+rs.getString(2));
				out.print("Address = "+rs.getString(3));
			}
			con.close();
		}
		catch(Exception e) {
			out.println(e);
		}
		
	}
}

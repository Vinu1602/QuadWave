import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.sql.Date;

public class AddEmpServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		int id = Integer.parseInt(req.getParameter("Eid"));
		String name = req.getParameter("EName");
		int yoe = Integer.parseInt(req.getParameter("yoe"));
		String designation = req.getParameter("desi");
		PrintWriter out = res.getWriter();
		long t = System.currentTimeMillis();
		Date d = new Date(t);
		
		
		try {
			
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/quadwave", "postgres", "123");
			PreparedStatement pstmt = null; 
			ResultSet rs = null; 
			String ins="insert into employees(id, name, doj, yoe, designation) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(ins);
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setDate(3, d);
			pstmt.setInt(4, yoe);
			pstmt.setString(5, designation);
			int n=pstmt.executeUpdate();
			out.println("<script>alert('Record Inserted Successfully');</script>");
			
			RequestDispatcher rd = req.getRequestDispatcher("allEmp.jsp");
			rd.forward(req, res);
			
		}
		catch(Exception e) {
			String str = e.getMessage();
			req.setAttribute("msg", str);
			RequestDispatcher rd = req.getRequestDispatcher("insertErrorPage.jsp");
			rd.forward(req, res);
		}
	}
}

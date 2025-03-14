package registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Retrieve form data
	    String fname = request.getParameter("firstName");
	    String lname = request.getParameter("lastName");
	    String email = request.getParameter("email");
	    String pnumber = request.getParameter("phone");
	    String pwd = request.getParameter("password");
	    String cpwd = request.getParameter("confirmPassword");
	    String gender = request.getParameter("gender");

	    RequestDispatcher dispatcher = null;
	    Connection con = null;
	    PreparedStatement pst = null;

	    try {
	        // Validate password and confirm password
	        if (!pwd.equals(cpwd)) {
	            request.setAttribute("status", "passwordMismatch");
	            dispatcher = request.getRequestDispatcher("register.jsp");
	            dispatcher.forward(request, response);
	            return;
	        }

	        // Load the MySQL JDBC driver
	        Class.forName("com.mysql.cj.jdbc.Driver");

	        // Establish a connection to the database
	        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "19971214Kt*");

	        // Prepare the SQL query
	        pst = con.prepareStatement("INSERT INTO users(fname, lname, email, pnumber, pwd, gender) VALUES (?, ?, ?, ?, ?, ?)");
	        pst.setString(1, fname);
	        pst.setString(2, lname);
	        pst.setString(3, email);
	        pst.setString(4, pnumber);
	        pst.setString(5, pwd);
	        pst.setString(6, gender);

	        // Execute the query
	        int rowCount = pst.executeUpdate();
	        dispatcher = request.getRequestDispatcher("register.jsp");

	        // Set status based on the result
	        if (rowCount > 0) {
	            request.setAttribute("status", "success");
	        } else {
	            request.setAttribute("status", "unsuccess");
	        }

	        // Forward the request to the JSP page
	        dispatcher.forward(request, response);

	    } catch (Exception e) {
	        e.printStackTrace();
	        // Set error status and forward to the registration page
	        request.setAttribute("status", "error");
	        dispatcher = request.getRequestDispatcher("register.jsp");
	        dispatcher.forward(request, response);
	    } finally {
	        // Close resources in the finally block
	        try {
	            if (pst != null) pst.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
}

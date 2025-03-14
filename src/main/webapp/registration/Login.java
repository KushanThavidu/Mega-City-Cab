package registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
        String pwd = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "19971214Kt*");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM users WHERE email = ? AND pwd = ?");
            pst.setString(1, email);
            pst.setString(2, pwd);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                // Login successful
                session.setAttribute("name", rs.getString("email")); // Set session attribute

                // Check if the email is the admin email
                if ("admin.cabservice@gmail.com".equals(email) && "admin123".equals(pwd)) {
                    request.setAttribute("status", "success");
                    dispatcher = request.getRequestDispatcher("admindashboard.jsp"); // Redirect to admin page
                } else {
                    request.setAttribute("status", "success");
                    dispatcher = request.getRequestDispatcher("customerdashboard.jsp"); // Redirect to customer page
                }
            } else {
                // Login failed
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("login.jsp"); // Redirect back to login page
            }
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Set error status and redirect back to login page
            request.setAttribute("status", "error");
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}

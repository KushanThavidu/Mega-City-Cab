package registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forgotpassword")
public class forgotpassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Retrieve form data
        String fname = request.getParameter("firstName");
        String lname = request.getParameter("lastName");
        String email = request.getParameter("email");
        String pnumber = request.getParameter("phone");

        RequestDispatcher dispatcher = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "19971214Kt*");

            // Prepare the SQL query to fetch the password
            pst = con.prepareStatement("SELECT pwd FROM users WHERE fname = ? AND lname = ? AND email = ? AND pnumber = ?");
            pst.setString(1, fname);
            pst.setString(2, lname);
            pst.setString(3, email);
            pst.setString(4, pnumber);

            // Execute the query
            rs = pst.executeQuery();
            dispatcher = request.getRequestDispatcher("forgotpassword.jsp");

            if (rs.next()) {
                // If the user is found, retrieve the password
                String password = rs.getString("pwd");
                request.setAttribute("status", "success");
                request.setAttribute("password", password); // Pass the password to the JSP page
            } else {
                // If the user is not found, set an error status
                request.setAttribute("status", "unsuccess");
            }
 
            // Forward the request to the JSP page
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Set error status and forward to the forgot password page
            request.setAttribute("status", "error");
            dispatcher = request.getRequestDispatcher("forgotpassword.jsp");
            dispatcher.forward(request, response);
        } finally {
            // Close resources in the finally block
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
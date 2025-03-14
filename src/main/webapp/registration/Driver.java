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

/**
 * Servlet implementation class Driver
 */
@WebServlet("/Driver")
public class Driver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final String DB_URL = "jdbc:mysql://localhost:3306/cab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "19971214Kt*";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Retrieve form data
        String oname = request.getParameter("oname");
        String onumber = request.getParameter("onumber");
        String oaddress = request.getParameter("oaddress");
        String nplate = request.getParameter("nplate");
        String vmodel = request.getParameter("vmodel");
        String rtype = request.getParameter("rtype");
        String pcount = request.getParameter("pcount");
        String ftype = request.getParameter("ftype");
        String features = request.getParameter("features");

        RequestDispatcher dispatcher = null;
        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare the SQL query
            pst = con.prepareStatement("INSERT INTO cars (oname, onumber, oaddress, nplate, vmodel, rtype, pcount, ftype, features) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pst.setString(1, oname);
            pst.setString(2, onumber);
            pst.setString(3, oaddress);
            pst.setString(4, nplate);
            pst.setString(5, vmodel);
            pst.setString(6, rtype);
            pst.setString(7, pcount);
            pst.setString(8, ftype);
            pst.setString(9, features);

            // Execute the query
            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("cardetailes.jsp");

            // Set status based on the result
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            // Forward the request to the JSP page
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Set error status and forward to the booking page
            request.setAttribute("status", "error");
            dispatcher = request.getRequestDispatcher("cardetailes.jsp");
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

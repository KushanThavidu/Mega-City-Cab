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

@WebServlet("/addbooking")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	// Retrieve form data
        String fname = request.getParameter("fname");
        String pnumber = request.getParameter("pnumber");
        String pickup = request.getParameter("pickup");
        String destination = request.getParameter("destination");
        String pdate = request.getParameter("pdate");
        String ptime = request.getParameter("ptime");
        String ride = request.getParameter("ride");
        String note = request.getParameter("note");

        RequestDispatcher dispatcher = null;
        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "19971214Kt*");

            // Prepare the SQL query
            pst = con.prepareStatement("INSERT INTO booking(fname, pnumber, pickup, destination, pdate, ptime, ride, note) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            pst.setString(1, fname);
            pst.setString(2, pnumber);
            pst.setString(3, pickup);
            pst.setString(4, destination);
            pst.setString(5, pdate);
            pst.setString(6, ptime);
            pst.setString(7, ride);
            pst.setString(8, note);

            // Execute the query
            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("addbooking.jsp");

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
            dispatcher = request.getRequestDispatcher("addbooking.jsp");
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
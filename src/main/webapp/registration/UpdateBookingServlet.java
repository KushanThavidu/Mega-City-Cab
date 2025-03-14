package registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateBookingServlet")
public class UpdateBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String id = request.getParameter("id");
        String firstName = request.getParameter("fname");
        String phoneNumber = request.getParameter("pnumber");
        String pickupLocation = request.getParameter("pickup");
        String destination = request.getParameter("destination");
        String pickupDate = request.getParameter("pdate");
        String pickupTime = request.getParameter("ptime");
        String rideType = request.getParameter("ride");
        String note = request.getParameter("note");

        // Database connection variables
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            // Load and register MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            String url = "jdbc:mysql://localhost:3306/cab";
            String username = "root";
            String password = "19971214Kt*";
            con = DriverManager.getConnection(url, username, password);

            // SQL query to update booking details
            String sql = "UPDATE booking SET fname=?, pnumber=?, pickup=?, destination=?, pdate=?, ptime=?, ride=?, note=? WHERE id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, firstName);
            pstmt.setString(2, phoneNumber);
            pstmt.setString(3, pickupLocation);
            pstmt.setString(4, destination);
            pstmt.setString(5, pickupDate);
            pstmt.setString(6, pickupTime);
            pstmt.setString(7, rideType);
            pstmt.setString(8, note);
            pstmt.setString(9, id);

            // Execute the update query
            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.getWriter().write("success");
            } else {
                response.getWriter().write("error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error");
        } finally {
            // Close database resources
            try {
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
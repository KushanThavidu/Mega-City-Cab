package registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bookings")
public class Viewbooking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    
    public class DBConnect {
        public static Connection getConnection() throws SQLException {
            String url = "jdbc:mysql://localhost:3306/cab";
            String username = "root";
            String password = "19971214Kt*";
            return DriverManager.getConnection(url, username, password);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Establish a connection to the database
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            // Query to fetch all bookings
            String sql = "SELECT * FROM booking";
            rs = stmt.executeQuery(sql);

            // Create a list to hold booking data
            List<Booking> bookings = new ArrayList<>();

            // Populate the list with data from the result set
            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("fname");
                String phoneNumber = rs.getString("pnumber");
                String pickupLocation = rs.getString("pickup");
                String destination = rs.getString("destination");
                String pickupDate = rs.getString("pdate");
                String pickupTime = rs.getString("ptime");
                String rideType = rs.getString("ride");
                String note = rs.getString("note");

                // Create a Booking object using the constructor
                Booking booking = new Booking(id, firstName, phoneNumber, pickupLocation, destination, 
                                             pickupDate, pickupTime, rideType, note);
                bookings.add(booking);
            }
            System.out.println("Response "+bookings);

            // Set the bookings list as a request attribute
            request.setAttribute("bookings", bookings);

            // Forward the request to the JSP page
            request.getRequestDispatcher("addviewbooking.jsp").forward(request, response);

        } catch (Exception e) {
            // Log the error and display a message
            e.printStackTrace();
            response.getWriter().write("Error fetching bookings: " + e.getMessage());
        } finally {
            // Close the database resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
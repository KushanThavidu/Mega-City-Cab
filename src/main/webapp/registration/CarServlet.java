package registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import registration.Car;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cars")
public class CarServlet extends HttpServlet {
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
    
    public static List<Car> getCarDetails(String nplate) {
        List<Car> cars = new ArrayList<>();

        // Validate input
        if (nplate == null || nplate.trim().isEmpty()) {
            return cars; // Return empty list if input is invalid
        }

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare the SQL query using PreparedStatement to prevent SQL injection
            String sql = "SELECT * FROM cars WHERE nplate = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, nplate);

            // Execute the query
            rs = pstmt.executeQuery();

            // Process the result set
            while (rs.next()) {
                String oname = rs.getString("oname");
                String onumber = rs.getString("onumber");
                String oaddress = rs.getString("oaddress");
                String plate = rs.getString("nplate"); // Avoid redeclaring nplate
                String vmodel = rs.getString("vmodel");
                String rtype = rs.getString("rtype");
                String pcount = rs.getString("pcount");
                String ftype = rs.getString("ftype");
                String features = rs.getString("features");

                // Create a Car object and add it to the list
                Car car = new Car(oname, onumber, oaddress, plate, vmodel, rtype, pcount, ftype, features);
                cars.add(car);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources in the finally block
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return cars;
    }
}


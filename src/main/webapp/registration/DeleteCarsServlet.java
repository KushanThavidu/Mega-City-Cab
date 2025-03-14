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

@WebServlet("/DeleteCarServlet")
public class DeleteCarsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "19971214Kt*");

            // SQL query to delete the car record
            String sql = "DELETE FROM cars WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));

            // Execute the delete query
            int rowsDeleted = pstmt.executeUpdate();
            if (rowsDeleted > 0) {
                response.getWriter().write("success");
            } else {
                response.getWriter().write("error: Car not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error: " + e.getMessage());
        }
    }
}
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    // Declare database connection variables
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    List<Map<String, String>> carList = new ArrayList<>();

    try {
        // Load and register MySQL JDBC driver (if not already done in your server)
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish database connection
        String url = "jdbc:mysql://localhost:3306/cab";  // Database URL
        String username = "root";  // Database username
        String password = "19971214Kt*";  // Database password

        con = DriverManager.getConnection(url, username, password);
        stmt = con.createStatement();

        // Query to fetch all cars
        String sql = "SELECT * FROM cars";
        rs = stmt.executeQuery(sql);

        // Process the result set and populate the carList
        while (rs.next()) {
            Map<String, String> car = new HashMap<>();
            car.put("id", String.valueOf(rs.getInt("id")));
            car.put("oname", rs.getString("oname"));
            car.put("onumber", rs.getString("onumber"));
            car.put("oaddress", rs.getString("oaddress"));
            car.put("nplate", rs.getString("nplate"));
            car.put("vmodel", rs.getString("vmodel"));
            car.put("rtype", rs.getString("rtype"));
            car.put("pcount", rs.getString("pcount"));
            car.put("ftype", rs.getString("ftype"));
            car.put("features", rs.getString("features"));

            carList.add(car);
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close the database resources
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/CarDetails.css">
    <title>Mega City Cab - Driver Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script>
        // Function to handle the search functionality
        function searchCars() {
            let input = document.getElementById('searchInput').value.toLowerCase();
            let table = document.querySelector('table');
            let tr = table.getElementsByTagName('tr');

            for (let i = 1; i < tr.length; i++) { // Start from 1 to skip the header row
                let td = tr[i].getElementsByTagName('td');
                let found = false;
                for (let j = 0; j < td.length; j++) {
                    if (td[j].textContent.toLowerCase().indexOf(input) > -1) {
                        found = true;
                        break;
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">
                <h1><span class="logo-icon">🚖</span> Mega City Cab - Driver Details</h1>
            </div>
        </header>
        
        <div class="content">
            <div class="card">
                <div class="card-header">
                    <h2>Car Details</h2>
                    <div class="btn-group">
                        <input type="search" id="searchInput" placeholder="Search by owner name or number plate..." oninput="searchCars()">
                        <button type="button" id="backBtn" class="btn btn-primary" onclick="window.location.href='customerdashboard.jsp'">
                            <i class="fas fa-arrow-left"></i> Back to Dashboard
                        </button>
                    </div>
                </form>
            </div>
            
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Owner Name</th>
                                <th>Contact</th>
                                <th>Address</th>
                                <th>Number Plate</th>
                                <th>Vehicle Model</th>
                                <th>Ride Type</th>
                                <th>Passengers</th>
                                <th>Fuel Type</th>
                                <th>Features</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (carList != null && !carList.isEmpty()) { %>
                                <% for (Map<String, String> car : carList) { %>
                                    <tr id="car-<%= car.get("id") %>">
                                        <td><%= car.get("id") %></td>
                                        <td><%= car.get("oname") %></td>
                                        <td><%= car.get("onumber") %></td>
                                        <td><%= car.get("oaddress") %></td>
                                        <td><%= car.get("nplate") %></td>
                                        <td><%= car.get("vmodel") %></td>
                                        <td><%= car.get("rtype") %></td>
                                        <td><%= car.get("pcount") %></td>
                                        <td><%= car.get("ftype") %></td>
                                        <td><%= car.get("features") %></td>
                                    </tr>
                                <% } %>
                            <% } else { %>
                                <tr>
                                    <td colspan="11" class="text-center">No Driver found.</td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Loading Spinner -->
    <div class="loading">
        <div class="loading-spinner"></div>
    </div>

    <script>
        // Form submission animation
        const form = document.querySelector('form');
        const loading = document.querySelector('.loading');
        const successMessage = document.querySelector('.success-message');

        form.addEventListener('submit', (e) => {
            // Show loading spinner
            loading.style.display = 'flex';

            // Hide the form to prevent multiple submissions
            form.style.display = 'none';

            // Allow the form to submit after a short delay
            setTimeout(() => {
                // The form will submit to the servlet
                // After submission, the servlet will redirect or forward to the JSP page
            }, 1000); // Adjust the delay as needed
        });

        // Check for success status and show the success message
        const status = "<%= request.getAttribute("status") %>";
        if (status === "success") {
            successMessage.style.display = 'flex';
            setTimeout(() => {
                successMessage.style.display = 'none';
            }, 3000);
        }
    </script>
</body>
</html>
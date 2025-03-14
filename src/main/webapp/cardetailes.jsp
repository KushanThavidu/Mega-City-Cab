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
    <title>Mega City Cab - Car Management</title>
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

        // Function to delete a car
        function deleteCar(carId) {
            if (confirm("Are you sure you want to delete this car?")) {
                fetch("DeleteCarServlet?id=" + carId)
                    .then(response => response.text())
                    .then(data => {
                        console.log("Response from server:", data); // Debugging

                        if (data.trim() === "success") {
                            alert("Car details deleted successfully");
                            // Remove the row from the table dynamically
                            let carRow = document.getElementById("car-" + carId);
                            if (carRow) {
                                carRow.remove(); // Remove the row
                            } else {
                                alert("Car row not found in the table.");
                            }
                        } else if (data.trim().startsWith("error")) {
                            alert("Server error: " + data);
                        } else {
                            alert("Error deleting car");
                        }
                    })
                    .catch(error => console.error("Fetch error:", error));
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">
                <h1><span class="logo-icon">🚖</span> Mega City Cab - Car Management</h1>
            </div>
        </header>
        
        <div class="content">
            <div class="card">
                <div class="card-header">
                    <h2>Add/Edit Car Details</h2>
                </div>
                <form method="post" action="cars" class="carForm" id="carForm">
                    <div class="form-grid">
                        <div class="form-group">
                            <label for="ownerName">Owner Name</label>
                            <input type="text" class="form-control" id="oname" name="oname" placeholder="Enter owner name" required>
                        </div>
                        <div class="form-group">
                            <label for="ownerContact">Owner Contact Information</label>
                            <input type="text" class="form-control" id="onumber" name="onumber" placeholder="Enter contact number" required>
                        </div>
                        <div class="form-group">
                            <label for="ownerAddress">Owner Address</label>
                            <input type="text" class="form-control" id="oaddress" name="oaddress" placeholder="Enter address" required>
                        </div>
                        <div class="form-group">
                            <label for="numberPlate">Number Plate</label>
                            <input type="text" class="form-control" id="nplate" name="nplate" placeholder="Enter number plate" required>
                        </div>
                        <div class="form-group">
                            <label for="vehicleModel">Vehicle Model</label>
                            <input type="text" class="form-control" id="vmodel" name="vmodel" placeholder="Enter vehicle model" required>
                        </div>
                        <div class="form-group">
                            <label for="rideType">Ride Type</label>
                            <input type="text" class="form-control" id="rtype" name="rtype" placeholder="Enter ride type" required>
                        </div>
                        <div class="form-group">
                            <label for="passengerCount">Passenger Count</label>
                            <input type="text" class="form-control" id="pcount" name="pcount" placeholder="Enter passenger count" required>
                        </div>
                        <div class="form-group">
                            <label for="fuelType">Fuel Type</label>
                            <input type="text" class="form-control" id="ftype" name="ftype" placeholder="Enter fuel type" required>
                        </div>
                        <div class="form-group">
                            <label for="additionalFeatures">Additional Features</label>
                            <input type="text" class="form-control" id="features" name="features" placeholder="Enter additional features" required>
                        </div>
                    </div>
    
                    <div class="btn-group">
                        <input type="search" id="searchInput" placeholder="Search by owner name or number plate..." oninput="searchCars()">
<!--                         <button type="button" id="searchBtn" class="btn btn-info"> -->
<!--                             <i class="fas fa-search"></i> Search -->
<!--                         </button> -->
                        <button type="submit" id="insertBtn" class="btn btn-success">
                            <i class="fas fa-plus"></i> Insert
                        </button>
                        <button type="button" id="backBtn" class="btn btn-primary" onclick="window.location.href='admindashboard.jsp'">
                            <i class="fas fa-arrow-left"></i> Back to Admin
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
                                <th>Actions</th>
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
                                        <td>
                                            <!-- Update Button -->
                                            <a href="updateCar.jsp?id=<%= car.get("id") %>" class="btn btn-warning btn-sm">
                                                <i class="fas fa-edit"></i> Update
                                            </a>
                                            <!-- Delete Button -->
                                            <button onclick="deleteCar(<%= car.get("id") %>)" class="btn btn-danger btn-sm">
                                                <i class="fas fa-trash"></i> Delete
                                            </button>
                                        </td>
                                    </tr>
                                <% } %>
                            <% } else { %>
                                <tr>
                                    <td colspan="11" class="text-center">No cars found. Add a new car using the form above.</td>
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

    <!-- Success Message -->
    <div class="success-message">
        <i class="fas fa-check-circle"></i>
        Car details inserted successfully!
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
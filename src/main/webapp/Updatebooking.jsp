<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<%
    // Declare database connection variables
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // Initialize variables to hold booking details
    String id = request.getParameter("id");
    String firstName = "";
    String phoneNumber = "";
    String pickupLocation = "";
    String destination = "";
    String pickupDate = "";
    String pickupTime = "";
    String rideType = "";
    String note = "";

    try {
        // Load and register MySQL JDBC driver (if not already done in your server)
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish database connection
        String url = "jdbc:mysql://localhost:3306/cab";  // Database URL
        String username = "root";  // Database username
        String password = "19971214Kt*";  // Database password

        con = DriverManager.getConnection(url, username, password);

        // Query to fetch booking details by ID
        String sql = "SELECT * FROM booking WHERE id = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();

        // Populate the variables with the fetched data
        if (rs.next()) {
            firstName = rs.getString("fname");
            phoneNumber = rs.getString("pnumber");
            pickupLocation = rs.getString("pickup");
            destination = rs.getString("destination");
            pickupDate = rs.getString("pdate");
            pickupTime = rs.getString("ptime");
            rideType = rs.getString("ride");
            note = rs.getString("note");
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close the database resources
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
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
    <link rel="stylesheet" href="css/UpdateBooking.css">
    <title>Update Ride Details</title>
    <style>
        /* Add your CSS styles here */
    </style>
</head>
<body>
    <div class="modal">
        <div class="modal-header">
            <h2>Update Ride Details</h2>
            <button class="close-btn">&times;</button>
        </div>
        <div class="modal-body">
            <form id="updateRideForm">
                <!-- Hidden field for booking ID -->
                <input type="hidden" id="id" name="id" value="<%= id %>">
                
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="fname" value="<%= firstName %>" placeholder="Enter passenger name" required autocomplete="name">
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" class="form-control" id="phone" name="pnumber" value="<%= phoneNumber %>" placeholder="Enter phone number" required autocomplete="tel">
                </div>
                
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="pickup">Pickup Location</label>
                            <input type="text" class="form-control" id="pickup" name="pickup" value="<%= pickupLocation %>" placeholder="Enter pickup address" required autocomplete="address-line1">
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="destination">Destination</label>
                            <input type="text" class="form-control" id="destination" name="destination" value="<%= destination %>" placeholder="Enter destination address" required autocomplete="address-line2">
                        </div>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="pickupDate">Pickup Date</label>
                            <input type="text" class="form-control" id="pickupDate" name="pdate" value="<%= pickupDate %>" required autocomplete="off">
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="pickupTime">Pickup Time</label>
                            <input type="text" class="form-control" id="pickupTime" name="ptime" value="<%= pickupTime %>" required autocomplete="off">
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="rideType">Ride Type</label>
                    <select class="form-control" id="rideType" name="ride" required autocomplete="off">
                        <option value="standard" <%= rideType.equals("standard") ? "selected" : "" %>>Standard</option>
                        <option value="premium" <%= rideType.equals("premium") ? "selected" : "" %>>Premium</option>
                        <option value="luxury" <%= rideType.equals("luxury") ? "selected" : "" %>>Luxury</option>
                        <option value="shared" <%= rideType.equals("shared") ? "selected" : "" %>>Shared</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="note">Note</label>
                    <textarea class="form-control" id="note" name="note" placeholder="Add special instructions or notes" autocomplete="off"><%= note %></textarea>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-cancel">Cancel</button>
            <button type="submit" form="updateRideForm" class="btn btn-update"><i>✓</i> Update Details</button>
        </div>
    </div>

    <script>
        // Close modal functionality
        document.querySelector('.close-btn').addEventListener('click', function() {
            window.location.href = 'addviewbooking.jsp';
        });
        
        // Cancel button functionality
        document.querySelector('.btn-cancel').addEventListener('click', function() {
            window.location.href = 'addviewbooking.jsp';
        });
        
        // Form submission handling
        document.getElementById('updateRideForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form data
            const formData = new FormData(this);
            
            // Send data to the servlet using fetch
            fetch('UpdateBookingServlet', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                if (data === "success") {
                    alert('Ride details updated successfully!');
                    window.location.href = 'addviewbooking.jsp';
                } else {
                    alert('Error updating ride details: ' + data);
                }
            })
            .catch(error => {
                console.error('Fetch error:', error);
                alert('An error occurred while updating ride details.');
            });
        });
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    // Declare database connection variables
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    List<Map<String, String>> bookings = new ArrayList<>();

    try {
        // Load and register MySQL JDBC driver (if not already done in your server)
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish database connection
        String url = "jdbc:mysql://localhost:3306/cab";  // Database URL
        String username = "root";  // Database username
        String password = "19971214Kt*";  // Database password

        con = DriverManager.getConnection(url, username, password);
        stmt = con.createStatement();

        // Query to fetch all bookings
        String sql = "SELECT * FROM booking";
        rs = stmt.executeQuery(sql);

        // Process the result set and populate the bookings list
        while (rs.next()) {
            Map<String, String> booking = new HashMap<>();
            booking.put("id", String.valueOf(rs.getInt("id")));
            booking.put("firstName", rs.getString("fname"));
            booking.put("phoneNumber", rs.getString("pnumber"));
            booking.put("pickupLocation", rs.getString("pickup"));
            booking.put("destination", rs.getString("destination"));
            booking.put("pickupDate", rs.getString("pdate"));
            booking.put("pickupTime", rs.getString("ptime"));
            booking.put("rideType", rs.getString("ride"));
            booking.put("note", rs.getString("note"));

            bookings.add(booking);
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
    <title>Booking Details</title>
    <link rel="stylesheet" href="css/ViewBooking.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script>
        // Function to handle the search functionality
        function searchBookings() {
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

        // Function to delete a booking
       function deleteBooking(bookingId) {
    if (confirm("Are you sure you want to delete this booking?")) {
        fetch("DeleteBookingServlet?id=" + bookingId)
            .then(response => response.text())
            .then(data => {
                console.log("Response from server:", data); // Debugging

                if (data.trim() === "success") {
                    alert("Booking deleted successfully");
                    // Remove the row from the table dynamically
                    let bookingRow = document.getElementById("booking-" + bookingId);
                    if (bookingRow) {
                        bookingRow.remove(); // Remove the row
                    } else {
                        alert("Booking row not found in the table.");
                    }
                } else if (data.trim().startsWith("error")) {
                    alert("Server error: " + data);
                } else {
                    alert("Error deleting booking");
                }
            })
            .catch(error => console.error("Fetch error:", error));
    }
}

        // Function to view a booking ticket
        function viewBooking(id) {
            window.location.href = 'viewbill.jsp?id=' + id;
        }
    </script>
</head>
<body>
    <header class="header">
        <h1><span class="logo-icon">🚖</span> Mega City Cab</h1>
        <p>Your Premium Ride Solution</p>
    </header>

    <div class="container">
        <h2>Booking Details</h2>
        <div class="search-bar">
            <input type="search" id="searchInput" placeholder="Search by name or phone number...." oninput="searchBookings()">
            <button type="button" id="searchBtn" class="btn btn-info">
                <i class="fas fa-search"></i> Search
            </button>
        </div>
        <!-- Table to display bookings -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Phone Number</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Pickup Date</th>
                    <th>Pickup Time</th>
                    <th>Ride Type</th>
                    <th>Note</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
    <% 
        // Loop through the bookings list and display each booking's details
        for (Map<String, String> booking : bookings) {
    %>
    <tr id="booking-<%= booking.get("id") %>">
        <td style="color:red"><%= booking.get("id") %></td>
        <td><%= booking.get("firstName") %></td>
        <td><%= booking.get("phoneNumber") %></td>
        <td><%= booking.get("pickupLocation") %></td>
        <td><%= booking.get("destination") %></td>
        <td><%= booking.get("pickupDate") %></td>
        <td><%= booking.get("pickupTime") %></td>
        <td><%= booking.get("rideType") %></td>
        <td><%= booking.get("note") %></td>
        <td>
            <a href="Updatebooking.jsp?id=<%= booking.get("id") %>" class="btn btn-primary">Update</a>
            <button onclick="deleteBooking(<%= booking.get("id") %>)" class="btn btn-danger">Delete</button>
            <button onclick="viewBooking(<%= booking.get("id") %>)" class="btn btn-success">Ticket</button>
        </td>
    </tr>
    <% 
        }
    %>
</tbody>
        </table>
    </div>
</body>
</html>
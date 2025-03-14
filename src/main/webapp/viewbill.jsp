<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    // Declare database connection variables
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    Map<String, String> booking = new HashMap<>();

    // Get the booking ID from the request parameter
    String bookingId = request.getParameter("id");

    try {
        // Load and register MySQL JDBC driver (if not already done in your server)
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish database connection
        String url = "jdbc:mysql://localhost:3306/cab";  // Database URL
        String username = "root";  // Database username
        String password = "19971214Kt*";  // Database password

        con = DriverManager.getConnection(url, username, password);
        stmt = con.createStatement();

        // Query to fetch booking details by ID
        String sql = "SELECT * FROM booking WHERE id = " + bookingId;
        rs = stmt.executeQuery(sql);

        // Process the result set and populate the booking map
        if (rs.next()) {
            booking.put("id", String.valueOf(rs.getInt("id")));
            booking.put("firstName", rs.getString("fname"));
            booking.put("phoneNumber", rs.getString("pnumber"));
            booking.put("pickupLocation", rs.getString("pickup"));
            booking.put("destination", rs.getString("destination"));
            booking.put("pickupDate", rs.getString("pdate"));
            booking.put("pickupTime", rs.getString("ptime"));
            booking.put("rideType", rs.getString("ride"));
            booking.put("note", rs.getString("note"));
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
    <title>Mega City Cab Service - Review Booking</title>
    <!-- FontAwesome CDN for icons -->
    <link rel="stylesheet" href="css/ViewBill.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

    <section class="page-title">
        <div class="container">
            <h2>Booking Details</h2>
            <p>Review your reservation information</p>
        </div>
    </section>

    <div class="container">
        <div class="content-wrapper">
            <div class="booking-details-card">
                <div class="booking-id">
                    <i class="fas fa-ticket-alt"></i> Booking ID: #<%= booking.get("id") %>
                </div>
                
                <div class="status-badge status-confirmed">
                    <i class="fas fa-check-circle"></i> Confirmed
                </div>
                
                <h3 class="section-title">
                    <i class="fas fa-info-circle"></i> Booking Information
                </h3>
                
                <div class="detail-grid">
                    <div class="detail-item">
                        <div class="detail-label">Full Name</div>
                        <div class="detail-value"><%= booking.get("firstName") %></div>
                    </div>
                    
                    <div class="detail-item">
                        <div class="detail-label">Phone Number</div>
                        <div class="detail-value"><%= booking.get("phoneNumber") %></div>
                    </div>
                    
                    <div class="detail-item">
                        <div class="detail-label">Pickup Date</div>
                        <div class="detail-value"><%= booking.get("pickupDate") %></div>
                    </div>
                    
                    <div class="detail-item">
                        <div class="detail-label">Pickup Time</div>
                        <div class="detail-value"><%= booking.get("pickupTime") %></div>
                    </div>
                    
                    <div class="detail-item">
                        <div class="detail-label">Pickup Location</div>
                        <div class="detail-value"><%= booking.get("pickupLocation") %></div>
                    </div>
                    
                    <div class="detail-item">
                        <div class="detail-label">Destination</div>
                        <div class="detail-value"><%= booking.get("destination") %></div>
                    </div>
                </div>
                
                <div class="ride-info">
                    <div class="ride-type">
                        <i class="fas fa-car-side"></i>
                        <div class="ride-type-details">
                            <h4><%= booking.get("rideType") %></h4>
                            <p>Comfortable ride with extra amenities</p>
                        </div>
                    </div>
                    
                    <div class="ride-features">
                        <div class="feature-tag"><i class="fas fa-wifi"></i> Free WiFi</div>
                        <div class="feature-tag"><i class="fas fa-charging-station"></i> Phone Charger</div>
                        <div class="feature-tag"><i class="fas fa-temperature-low"></i> AC</div>
                        <div class="feature-tag"><i class="fas fa-briefcase"></i> Extra Luggage</div>
                    </div>
                </div>
                
                <div class="notes-section">
                    <div class="notes-title">
                        <i class="fas fa-sticky-note"></i> Special Notes
                    </div>
                    <div class="notes-content">
                        <%= booking.get("note") %>
                    </div>
                </div>
                
                <div class="price-summary">
                    <h3 class="section-title">
                        <i class="fas fa-receipt"></i> Price Details
                    </h3>
                    
                    <div class="price-item">
                        <span>Base Fare</span>
                        <span>$8.00</span>
                    </div>
                    
                    <div class="price-item">
                        <span>Distance (13.2 km)</span>
                        <span>$26.40</span>
                    </div>
                    
                    <div class="price-item">
                        <span>Wait Time</span>
                        <span>$0.00</span>
                    </div>
                    
                    <div class="price-item">
                        <span>Service Fee</span>
                        <span>$2.50</span>
                    </div>
                    
                    <div class="price-total">
                        <span>Total</span>
                        <span>$36.90</span>
                    </div>
                </div>
                
                <div class="driver-info">
                    <div class="driver-avatar">
                        <img src="images/nipun.JPG" alt="Driver Photo">
                    </div>
                    <div class="driver-details">
                        <h4>Michael Rodriguez</h4>
                        <p>Your Driver</p>
                        <p>Vehicle: Toyota Camry (2023) - Silver</p>
                        <p>License: XYZ-1234</p>
                        <div class="star-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                            <span>(4.8)</span>
                        </div>
                        <div class="contact-driver">
                            <div class="contact-btn call-btn">
                                <i class="fas fa-phone"></i> Call
                            </div>
                            <div class="contact-btn message-btn">
                                <i class="fas fa-comment"></i> Message
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="action-buttons">
                    <a href="#" class="btn btn-primary">
                        <i class="fas fa-print"></i> Print Details
                    </a>
<!--                     <a href="#" class="btn btn-outline"> -->
<!--                         <i class="fas fa-edit"></i> Modify Booking -->
<!--                     </a> -->
<!--                     <a href="#" class="btn btn-danger"> -->
<!--                         <i class="fas fa-times"></i> Cancel Booking -->
<!--                     </a> -->
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // For demonstration purposes - in a real application, 
            // this would fetch booking details from the database
            
            // Print functionality
            const printBtn = document.querySelector('.btn-primary');
            printBtn.addEventListener('click', function(e) {
                e.preventDefault();
                window.print();
            });
            
            const cancelBtn = document.querySelector('.btn-danger');
            cancelBtn.addEventListener('click', function(e) {
                e.preventDefault(); // Prevent the default form submission or link behavior

                // Show confirmation dialog
                if (confirm('Are you sure you want to cancel this booking? Cancellation fees may apply.')) {
                    // If the user confirms, show an alert and redirect to customerdashboard.jsp
                    alert('Your booking has been cancelled. A confirmation will be sent to your email.');
                    window.location.href = 'customerdashboard.jsp'; // Redirect to the dashboard page
                }
            });
        });
    </script>
</body>
</html>
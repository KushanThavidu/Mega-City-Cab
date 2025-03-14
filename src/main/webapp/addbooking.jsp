<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega Cit Cab Agency - Modern Booking</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', 'Arial', sans-serif;
        }

        :root {
            --primary-yellow: #FFD700;
            --dark-yellow: #FFC800;
            --black: #000000;
            --white: #ffffff;
            --gray: #f5f5f5;
        }

        body {
            background-color: var(--gray);
            color: var(--black);
        }

        .header {
            background-color: var(--black);
            color: var(--white);
            padding: 1.5rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-yellow);
        }

        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .container {
            max-width: 1000px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .booking-form {
            background-color: var(--white);
            border-radius: 20px;
            padding: 2.5rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            position: relative;
            overflow: hidden;
        }

        .booking-form::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-yellow) 0%, var(--dark-yellow) 100%);
        }

        .section-title {
            display: flex;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--gray);
        }

        .section-title i {
            color: var(--primary-yellow);
            font-size: 1.5rem;
            margin-right: 1rem;
        }

        .section-title h2 {
            font-size: 1.5rem;
            font-weight: 600;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .form-group {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--black);
        }

        .form-group i {
            position: absolute;
            left: 1rem;
            top: 2.7rem;
            color: #666;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 1rem 1rem 1rem 2.8rem;
            border: 2px solid var(--gray);
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: var(--white);
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: var(--primary-yellow);
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 215, 0, 0.1);
        }

        .car-options {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .car-option {
            border: 2px solid var(--gray);
            border-radius: 10px;
            padding: 1rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .car-option:hover {
            border-color: var(--primary-yellow);
            transform: translateY(-2px);
        }

        .car-option.selected {
            border-color: var(--primary-yellow);
            background-color: rgba(255, 215, 0, 0.1);
        }

        .car-option i {
            font-size: 2rem;
            color: var(--black);
            margin-bottom: 0.5rem;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 3rem;
        }

        .btn {
            padding: 1rem 2.5rem;
            border: none;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-primary {
            background-color: var(--primary-yellow);
            color: var(--black);
        }

        .btn-secondary {
            background-color: var(--black);
            color: var(--white);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .info-text {
            color: #666;
            font-size: 0.9rem;
            margin-top: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .info-text i {
            color: var(--primary-yellow);
        }

        @media (max-width: 768px) {
            .form-row,
            .car-options {
                grid-template-columns: 1fr;
            }

            .container {
                padding: 1rem;
            }

            .booking-form {
                padding: 1.5rem;
            }

            .buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }
        }

        /* Modern Loading Animation */
        .loading {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.9);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .loading-spinner {
            width: 50px;
            height: 50px;
            border: 5px solid var(--gray);
            border-top: 5px solid var(--primary-yellow);
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Success Message */
        .success-message {
            position: fixed;
            top: 20px;
            right: 20px;
            background: var(--black);
            color: var(--white);
            padding: 1rem 2rem;
            border-radius: 10px;
            display: none;
            align-items: center;
            gap: 0.5rem;
            animation: slideIn 0.5s ease;
        }

        @keyframes slideIn {
            from { transform: translateX(100%); }
            to { transform: translateX(0); }
        }
    </style>
</head>
<body>
    <header class="header">
        <h1><span class="logo-icon">🚖</span> Mega City Cab</h1>
        <p>Book Your Premium Ride</p>
    </header>

    <div class="container">
        <form method="post" action="addbooking" class="booking-form" id="booking-form">
        <div class="section-title">
            <i class="fas fa-user-circle"></i>
            <h2>Passenger Details</h2>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="fname">Full Name</label>
                <i class="fas fa-user"></i>
                <input type="text" id="fname" name="fname" required placeholder="Enter the name">
            </div>
            <div class="form-group">
                <label for="pnumber">Phone Number</label>
                <i class="fas fa-phone"></i>
                <input type="tel" id="pnumber" name="pnumber" required placeholder="Enter the phone number">
            </div>
        </div>

        <div class="section-title">
            <i class="fas fa-route"></i>
            <h2>Ride Details</h2>
        </div>
        <div class="form-row">
            <div class="form-group">
                <label for="pickup">Pickup Location</label>
                <i class="fas fa-map-marker-alt"></i>
                <input type="text" id="pickup" name="pickup" required placeholder="Enter pickup address">
            </div>
            <div class="form-group">
                <label for="destination">Destination</label>
                <i class="fas fa-flag-checkered"></i>
                <input type="text" id="destination" name="destination" required placeholder="Enter destination address">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="pdate">Pickup Date</label>
                <i class="fas fa-calendar"></i>
                <input type="text" id="pdate" name="pdate" required>
            </div>
            <div class="form-group">
                <label for="ptime">Pickup Time</label>
                <i class="fas fa-clock"></i>
                <input type="text" id="ptime" name="ptime" required>
            </div>
        </div>

        <div class="section-title">
            <i class="fas fa-car"></i>
            <h2>Select Your Ride</h2>
        </div>
        <div class="car-options">
            <div class="car-option" onclick="selectRide('Economy')">
                <i class="fas fa-car"></i>
                <h3>Economy</h3>
                <p>Budget friendly</p>
            </div>
            <div class="car-option" onclick="selectRide('Standard')">
                <i class="fas fa-car-side"></i>
                <h3>Standard</h3>
                <p>Comfortable ride</p>
            </div>
            <div class="car-option" onclick="selectRide('Luxury')">
                <i class="fas fa-car-alt"></i>
                <h3>Luxury</h3>
                <p>Premium experience</p>
            </div>
            <div class="car-option" onclick="selectRide('SUV')">
                <i class="fas fa-truck"></i>
                <h3>SUV</h3>
                <p>Group travel</p>
            </div>
        </div>

        <!-- Hidden input for ride selection -->
        <input type="hidden" id="ride" name="ride">

        <div class="form-group">
            <label for="note">Special Instructions</label>
            <i class="fas fa-comment-alt"></i>
            <input type="text" id="note" name="note" placeholder="Any special requirements or notes">
            <div class="info-text">
                <i class="fas fa-info-circle"></i>
                Add any special requirements or instructions for the driver
            </div>
        </div>

        <div class="buttons">
            <a href="login.jsp" class="btn btn-secondary">
                <i class="fas fa-times"></i> Cancel
            </a>
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-check"></i> Confirm Booking
            </button>
            <a href="customerdashboard.jsp" class="btn btn-secondary">
                <i class="fas fa-undo"></i> Back
            </a>
        </div>
    </form>
    </div>

    <!-- Loading Spinner -->
    <div class="loading">
        <div class="loading-spinner"></div>
    </div>

    <!-- Success Message -->
    <div class="success-message">
        <i class="fas fa-check-circle"></i>
        Booking confirmed successfully!
    </div>

    <script>
 // Car option selection
    const carOptions = document.querySelectorAll('.car-option');
    const rideInput = document.getElementById('ride');

    carOptions.forEach(option => {
        option.addEventListener('click', () => {
            carOptions.forEach(opt => opt.classList.remove('selected'));
            option.classList.add('selected');
            rideInput.value = option.querySelector('h3').textContent; // Set ride value
        });
    });

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
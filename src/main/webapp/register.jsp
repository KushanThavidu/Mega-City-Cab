<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RideEase - Register</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-yellow: #FFB800;
            --secondary-yellow: #FFD449;
            --dark-black: #1E1E1E;
            --medium-black: #2A2A2A;
            --light-black: #333333;
            --pure-white: #FFFFFF;
            --off-white: #F5F5F5;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--dark-black);
            padding: 20px;
            background-image: linear-gradient(45deg, #1E1E1E 25%, #252525 25%, #252525 50%, #1E1E1E 50%, #1E1E1E 75%, #252525 75%, #252525 100%);
            background-size: 20px 20px;
        }

        .container {
            width: 100%;
            max-width: 450px;
            background: var(--medium-black);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            border: 2px solid var(--primary-yellow);
        }

        .logo {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo i {
            font-size: 48px;
            color: var(--primary-yellow);
            text-shadow: 0 0 10px rgba(255, 184, 0, 0.3);
        }

        .logo h1 {
            color: var(--pure-white);
            font-size: 24px;
            margin-top: 10px;
            letter-spacing: 1px;
        }

        .form-title {
            color: var(--pure-white);
            text-align: center;
            margin-bottom: 30px;
            font-size: 20px;
        }

        .input-group {
            margin-bottom: 20px;
            position: relative;
        }

        .input-row {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }

        .input-group, .input-row .input-group {
            flex: 1;
        }

        .input-group input, .input-group select {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid var(--light-black);
            border-radius: 10px;
            background: var(--light-black);
            font-size: 16px;
            transition: all 0.3s ease;
            color: var(--pure-white);
        }

        .input-group select {
            appearance: none;
            cursor: pointer;
        }

        .input-group input::placeholder {
            color: #888;
        }

        .input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-yellow);
        }

        .input-group input:focus, .input-group select:focus {
            outline: none;
            border-color: var(--primary-yellow);
            box-shadow: 0 0 0 2px rgba(255, 184, 0, 0.1);
        }

        .terms {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin-bottom: 20px;
            color: var(--off-white);
            font-size: 14px;
        }

        .terms input[type="checkbox"] {
            margin-top: 4px;
            accent-color: var(--primary-yellow);
        }

        .terms a {
            color: var(--primary-yellow);
            text-decoration: none;
        }

        .terms a:hover {
            color: var(--secondary-yellow);
        }

        .btn {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-primary {
            background: var(--primary-yellow);
            color: var(--dark-black);
            margin-bottom: 15px;
        }

        .btn-secondary {
            background: transparent;
            color: var(--primary-yellow);
            border: 2px solid var(--primary-yellow);
        }

        .btn:hover {
            transform: translateY(-2px);
        }

        .btn-primary:hover {
            background: var(--secondary-yellow);
            box-shadow: 0 5px 15px rgba(255, 184, 0, 0.2);
        }

        .btn-secondary:hover {
            background: rgba(255, 184, 0, 0.1);
            border-color: var(--secondary-yellow);
            color: var(--secondary-yellow);
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
            color: var(--off-white);
            font-size: 14px;
        }

        .login-link a {
            color: var(--primary-yellow);
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            color: var(--secondary-yellow);
        }

        @media (max-width: 480px) {
            .container {
                padding: 20px;
            }
            .input-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <i class="fas fa-taxi"></i>
            <h1>Mega City Cab</h1>
        </div>
        <h2 class="form-title">Create your account</h2>
        <form method="post" action="register" class=register-form id=register-form >
            <div class="input-row">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="firstName" placeholder="First Name" id="firstName" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="lastName" placeholder="Last Name" id="lastName" required>
                </div>
            </div>
            <div class="input-group">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" placeholder="Email Address" id="email" required>
            </div>
            <div class="input-group">
                <i class="fas fa-phone"></i>
                <input type="tel" name="phone" placeholder="Phone Number" id="phone" required>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" placeholder="Password" id="password" required>
            </div>
            <div class="input-group">
                <i class="fas fa-lock"></i>
                <input type="password" name="confirmPassword" placeholder="Confirm Password" id="confirmPassword" required>
            </div>
            <div class="input-group">
                <i class="fas fa-venus-mars"></i>
                <select name="gender" id="gender" required>
                    <option value="">Select Gender</option>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="terms">
                <input type="checkbox" name="terms" required>
                <label>I agree to the <a href="terms.jsp">Terms of Service</a> and <a href="privacy.jsp">Privacy Policy</a></label>
            </div>
            <button type="submit" class="btn btn-primary">Create Account</button>
            <div class="login-link">
                Already have an account? <a href="login.jsp">Login here</a>
            </div>
        </form>
    </div>
    <!-- SweetAlert JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        // Function to display SweetAlert popup
        function showPopup(message, type) {
            Swal.fire({
                icon: type, // 'success', 'error', 'warning', etc.
                title: message,
                showConfirmButton: false,
                timer: 2500 // Auto-close after 2.5 seconds
            });
        }

        // Check the status attribute and show a popup if registration is successful or failed
        window.onload = function() {
            const status = "<%= request.getAttribute("status") %>";
            if (status === "success") {
                showPopup("Registration successful!", "success");
            } else if (status === "unsuccess") {
                showPopup("Registration failed. Please try again.", "error");
            } else if (status === "passwordMismatch") {
                showPopup("Passwords do not match. Please try again.", "error");
            } else if (status === "error") {
                showPopup("An error occurred. Please try again later.", "error");
            }
        };
    </script>
</body>
</html>
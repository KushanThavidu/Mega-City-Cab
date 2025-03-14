<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega Cit Cab - Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Core Styles */
        :root {
            --primary-yellow: #FFD700;
            --dark-yellow: #FFC800;
            --black: #000000;
            --white: #ffffff;
            --gray: #f5f5f5;
            --dark-gray: #333333;
            --success: #28a745;
            --warning: #ffc107;
            --danger: #dc3545;
            --info: #17a2b8;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', 'Arial', sans-serif;
        }

        body {
            background-color: var(--gray);
            min-height: 100vh;
            display: flex;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background: var(--black);
            color: var(--white);
            padding: 2rem 0;
            display: flex;
            flex-direction: column;
            position: fixed;
            height: 100vh;
            transition: all 0.3s ease;
        }

        .sidebar-header {
            padding: 0 2rem;
            margin-bottom: 2rem;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 1rem;
            color: var(--primary-yellow);
            font-size: 1.5rem;
            font-weight: bold;
        }

        .nav-menu {
            list-style: none;
            padding: 0 1rem;
        }

        .nav-item {
            margin-bottom: 0.5rem;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            color: var(--white);
            text-decoration: none;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background: rgba(255, 215, 0, 0.1);
            color: var(--primary-yellow);
        }

        .nav-link.active {
            background: var(--primary-yellow);
            color: var(--black);
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 2rem;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .header-left h1 {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .search-bar {
            position: relative;
        }

        .search-bar input {
            padding: 0.8rem 1rem 0.8rem 2.8rem;
            border: 2px solid var(--gray);
            border-radius: 10px;
            width: 300px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .search-bar i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 1rem;
            cursor: pointer;
            padding: 0.5rem 1rem;
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .user-profile:hover {
            background: var(--gray);
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary-yellow);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        /* Dashboard Grid */
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: var(--white);
            padding: 1.5rem;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            display: flex;
            align-items: center;
            gap: 1.5rem;
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            background: var(--primary-yellow);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .stat-details h3 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }

        .stat-details p {
            color: #666;
        }

        /* Content Sections */
        .content-section {
            background: var(--white);
            border-radius: 15px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.8rem 1.5rem;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: var(--primary-yellow);
            color: var(--black);
        }

        .btn-primary:hover {
            background: var(--dark-yellow);
            transform: translateY(-2px);
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .sidebar {
                width: 80px;
                padding: 1rem 0;
            }

            .sidebar-header, .nav-link span {
                display: none;
            }

            .nav-menu {
                padding: 0 0.5rem;
            }

            .main-content {
                margin-left: 80px;
            }
        }

        @media (max-width: 768px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }

            .search-bar input {
                width: 200px;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar Navigation -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="logo">
                <i class="fas fa-taxi"></i>
                <span>Mega Cit Cab</span>
            </div>
        </div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="admindashboard.jsp" class="nav-link active">
                    <i class="fas fa-dashboard"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="register.jsp" class="nav-link">
                    <i class="fas fa-user-plus"></i>
                    <span>Register Customer</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="addbooking.jsp" class="nav-link">
                    <i class="fas fa-calendar-plus"></i>
                    <span>Add Booking</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="viewbooking.jsp" class="nav-link">
                    <i class="fas fa-calendar-check"></i>
                    <span>View Bookings</span>
                </a>
            </li>
<!--             <li class="nav-item"> -->
<!--                 <a href="viewbill.jsp" class="nav-link"> -->
<!--                     <i class="fas fa-calculator"></i> -->
<!--                     <span>Calculate Bill</span> -->
<!--                 </a> -->
<!--             </li> -->
            <li class="nav-item">
                <a href="cardetailes.jsp" class="nav-link">
                    <i class="fas fa-car"></i>
                    <span>Manage Cars</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="driverdetails.jsp" class="nav-link">
                    <i class="fas fa-user-tie"></i>
                    <span>Manage Drivers</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Help.jsp" class="nav-link">
                    <i class="fas fa-question-circle"></i>
                    <span>Help</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="login.jsp" class="nav-link">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Header -->
        <div class="header">
            <div class="header-left">
                <h1>Dashboard</h1>
                <p>Welcome back, Admin!</p>
            </div>
            <div class="header-right">
                <div class="search-bar">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Search...">
                </div>
                <div class="user-profile">
                    <div class="user-avatar">A</div>
                    <div class="user-info">
                        <h3>Admin</h3>
                        <p>Administrator</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Statistics Grid -->
        <div class="dashboard-grid">
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-details">
                    <h3>2,543</h3>
                    <p>Total Customers</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-taxi"></i>
                </div>
                <div class="stat-details">
                    <h3>156</h3>
                    <p>Active Rides</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-car"></i>
                </div>
                <div class="stat-details">
                    <h3>89</h3>
                    <p>Available Cars</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-user-tie"></i>
                </div>
                <div class="stat-details">
                    <h3>120</h3>
                    <p>Active Drivers</p>
                </div>
            </div>
        </div>

        <!-- Recent Bookings Section -->
        <div class="content-section">
            <div class="section-header">
                <h2>Recent Bookings</h2>
                <button class="btn btn-primary">
                    <i class="fas fa-plus"></i>
                    New Booking
                </button>
            </div>
            <!-- Booking content will be added in the next part -->
        </div>
    </main>
</body>
</html>
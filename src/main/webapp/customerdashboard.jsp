<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega Cit Cab - Customer Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
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

        /* Sidebar */
        .sidebar {
            width: 280px;
            background: var(--black);
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
            color: var(--white);
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary-yellow);
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
        }

        .avatar {
            width: 50px;
            height: 50px;
            background: var(--primary-yellow);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: var(--black);
        }

        .user-info h3 {
            font-size: 1rem;
            margin-bottom: 0.25rem;
        }

        .user-info p {
            font-size: 0.875rem;
            opacity: 0.7;
        }

        .nav-menu {
            list-style: none;
            padding: 0 0.5rem;
            margin-top: 0.1rem;
        }

        .nav-item {
            margin-bottom: 0.25rem;
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

        /* Main Content */
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

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .action-card {
            background: var(--white);
            padding: 1.5rem;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .action-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }

        .action-icon {
            width: 50px;
            height: 50px;
            background: var(--primary-yellow);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .action-card h3 {
            margin-bottom: 0.5rem;
        }

        .action-card p {
            color: #666;
            font-size: 0.9rem;
        }

        .recent-activity {
            background: var(--white);
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .activity-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .activity-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            border-bottom: 1px solid var(--gray);
        }

        .activity-icon {
            width: 40px;
            height: 40px;
            background: var(--gray);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-yellow);
        }

        .activity-details h4 {
            margin-bottom: 0.25rem;
        }

        .activity-details p {
            font-size: 0.875rem;
            color: #666;
        }

        .activity-status {
            margin-left: auto;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.875rem;
        }

        .status-completed {
            background: rgba(40, 167, 69, 0.1);
            color: var(--success);
        }

        .status-pending {
            background: rgba(255, 193, 7, 0.1);
            color: var(--warning);
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

        @media (max-width: 1024px) {
            .sidebar {
                width: 80px;
            }

            .sidebar-header, .nav-link span, .user-info {
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
            .quick-actions {
                grid-template-columns: 1fr;
            }

            .main-content {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="brand">
                <i class="fas fa-taxi"></i>
                <span>Mega Cit Cab</span>
            </div>
            <div class="user-profile">
                <div class="avatar">J</div>
                <div class="user-info">
                    <h3>John Doe</h3>
                    <p>Customer</p>
                </div>
            </div>
        </div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="customerdashboard.jsp" class="nav-link active">
                    <i class="fas fa-home"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="addbooking.jsp" class="nav-link">
                    <i class="fas fa-plus-circle"></i>
                    <span>Add Booking</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="addviewbooking.jsp" class="nav-link">
                    <i class="fas fa-calendar-check"></i>
                    <span>View Bookings</span>
                </a>
            </li>
<!--             <li class="nav-item"> -->
<!--                 <a href="viewbill.jsp" class="nav-link"> -->
<!--                     <i class="fas fa-file-invoice-dollar"></i> -->
<!--                     <span>View Bills</span> -->
<!--                 </a> -->
<!--             </li> -->
            <li class="nav-item">
                <a href="viewcardetails.jsp" class="nav-link">
                    <i class="fas fa-car"></i>
                    <span>Car Details</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="viewdriverdetails.jsp" class="nav-link">
                    <i class="fas fa-user-tie"></i>
                    <span>Driver Details</span>
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
        <div class="header">
            <div>
                <h1>Welcome back, John!</h1>
                <p>Here's what's happening with your rides</p>
            </div>
            <button type="button" class="btn btn-primary" onclick="window.location.href='addbooking.jsp'">
    			<i class="fas fa-plus"></i> New Booking
			</button>
        </div>

        <!-- Quick Actions -->
        <div class="quick-actions">
            <div class="action-card">
                <div class="action-icon">
                    <i class="fas fa-taxi"></i>
                </div>
                <h3>Active Rides</h3>
                <p>2 ongoing rides</p>
            </div>
            <div class="action-card">
                <div class="action-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <h3>Upcoming Rides</h3>
                <p>3 scheduled rides</p>
            </div>
            <div class="action-card">
                <div class="action-icon">
                    <i class="fas fa-file-invoice-dollar"></i>
                </div>
                <h3>Total Spent</h3>
                <p>$245 this month</p>
            </div>
        </div>

        <!-- Recent Activity -->
        <div class="recent-activity">
            <div class="activity-header">
                <h2>Recent Activity</h2>
                <a href="#" class="btn btn-primary">View All</a>
            </div>
            <div class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-car"></i>
                </div>
                <div class="activity-details">
                    <h4>Airport Transfer</h4>
                    <p>Today, 2:30 PM</p>
                </div>
                <span class="activity-status status-completed">Completed</span>
            </div>
            <div class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-car"></i>
                </div>
                <div class="activity-details">
                    <h4>City Tour</h4>
                    <p>Tomorrow, 10:00 AM</p>
                </div>
                <span class="activity-status status-pending">Upcoming</span>
            </div>
            <div class="activity-item">
                <div class="activity-icon">
                    <i class="fas fa-car"></i>
                </div>
                <div class="activity-details">
                    <h4>Business Meeting Transfer</h4>
                    <p>Feb 21, 9:00 AM</p>
                </div>
                <span class="activity-status status-pending">Scheduled</span>
            </div>
        </div>
    </main>
</body>
</html>
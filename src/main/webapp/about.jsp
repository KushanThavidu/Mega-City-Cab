<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab Service</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-yellow: #FFB800;
            --secondary-yellow: #FFD449;
            --dark-black: #1E1E1E;
            --white: #FFFFFF;
            --light-gray: #F5F5F5;
            --medium-gray: #E0E0E0;
            --medium-black: #2A2A2A;
            --light-black: #333333;
            --pure-white: #FFFFFF;
            --off-white: #F5F5F5;
            --transparent-yellow: rgba(255, 184, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Header styles */
        header {
            background: var(--medium-black);
            padding: 20px 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            border-bottom: 2px solid var(--primary-yellow);
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: #FFB800;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .logo-icon {
            margin-right: 10px;
            font-size: 2rem;
        }

        .nav-links {
            display: flex;
            gap: 30px;
        }

        .nav-links a {
            color: var(--off-white);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-links a:hover {
            color: var(--primary-yellow);
        }

        .nav-links a.active {
            color: var(--primary-yellow);
        }

        .nav-links a.active::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 2px;
            background: var(--primary-yellow);
            border-radius: 2px;
        }

        .mobile-toggle {
            display: none;
            font-size: 24px;
            cursor: pointer;
            color: var(--off-white);
        }

        .auth-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn {
            padding: 0.5rem 1.5rem;
            border-radius: 5px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
        }

        .btn-login {
            background: transparent;
            border: 2px solid var(--primary-yellow);
            color: var(--primary-yellow);
        }

        .btn-register {
            background: var(--primary-yellow);
            border: none;
            color: var(--dark-black);
        }

        /* Hero Section */
        .hero {
            background: var(--dark-black);
            padding: 8rem 5% 4rem;
            text-align: center;
            color: var(--white);
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.2rem;
            color: var(--medium-gray);
            margin-bottom: 2rem;
        }

        /* Features Section */
        .features {
            padding: 4rem 5%;
            background: var(--white);
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .feature-card {
            background: var(--light-gray);
            padding: 2rem;
            border-radius: 10px;
            text-align: center;
        }

        .feature-card i {
            font-size: 2.5rem;
            color: var(--primary-yellow);
            margin-bottom: 1rem;
        }

        /* Stats Section */
        .stats {
            background: var(--dark-black);
            padding: 4rem 5%;
            color: var(--white);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            text-align: center;
        }

        .stat-item h3 {
            font-size: 2.5rem;
            color: var(--primary-yellow);
            margin-bottom: 0.5rem;
        }

        /* Footer */
        footer {
            background: var(--medium-black);
            padding: 60px 20px 20px;
            position: relative;
            border-top: 2px solid var(--primary-yellow);
        }

        .footer-grid {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 40px;
            margin-bottom: 50px;
        }

        .footer-logo {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .footer-logo i {
            font-size: 32px;
            color: var(--primary-yellow);
        }

        .footer-logo-text {
            font-size: 24px;
            font-weight: 700;
            color: var(--pure-white);
        }

        .company-desc {
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .footer-title {
            color: var(--pure-white);
            font-size: 1.2rem;
            margin-bottom: 20px;
            position: relative;
            display: inline-block;
        }

        .footer-title::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -10px;
            width: 40px;
            height: 2px;
            background: var(--primary-yellow);
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 10px;
        }

        .footer-links a {
            color: var(--off-white);
            text-decoration: none;
            transition: color 0.3s ease;
            display: inline-flex;
            align-items: center;
        }

        .footer-links a i {
            margin-right: 8px;
            font-size: 0.8rem;
            color: var(--primary-yellow);
        }

        .footer-links a:hover {
            color: var(--primary-yellow);
            transform: translateX(5px);
        }

        .contact-item {
            display: flex;
            align-items: flex-start;
            gap: 15px;
            margin-bottom: 15px;
        }

        .contact-icon {
            color: var(--primary-yellow);
            font-size: 1.2rem;
            margin-top: 2px;
        }

        .contact-info {
            color: var(--off-white);
            line-height: 1.5;
        }

        .social-links {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }

        .social-links a {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: var(--light-black);
            color: var(--off-white);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .social-links a:hover {
            background: var(--primary-yellow);
            color: var(--dark-black);
            transform: translateY(-3px);
        }

        .copyright {
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: var(--off-white);
            font-size: 0.9rem;
        }

        .copyright a {
            color: var(--primary-yellow);
            text-decoration: none;
        }


        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }
            
            .hero h1 {
                font-size: 2rem;
            }
        }
        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate {
            animation: fadeInUp 0.8s ease forwards;
        }

        /* Scroll to top button */
        .scroll-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 50px;
            height: 50px;
            background: var(--primary-yellow);
            color: var(--dark-black);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            z-index: 999;
        }

        .scroll-top.active {
            opacity: 1;
            visibility: visible;
        }

        .scroll-top:hover {
            background: var(--secondary-yellow);
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <nav class="navbar">
            <div class="logo">
                <a href="index.jsp" class="logo">
                    <span class="logo-icon">🚖</span> Mega City Cab
                </a>
            </div>
            <div class="nav-links">
                <a href="index.jsp" >Home</a>
                <a href="about.jsp" class="active">About Us</a>
                <a href="services.jsp">Services</a>
                <a href="contact.jsp">Contact</a>
            </div>
            <div class="auth-buttons">
                <a href="login.jsp" class="btn btn-login">Login</a>
                <a href="register.jsp " class="btn btn-register">Register</a>
            </div>
            <div class="mobile-toggle">
                <i class="fas fa-bars"></i>
            </div>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <h1>Your Trusted Cab Service in Colombo</h1>
        <p>Thousands of satisfied customers choose us monthly for safe, reliable, and comfortable rides.</p>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="section-title">
            <h2>Why Choose Mega City Cab?</h2>
        </div>
        <div class="feature-grid">
            <div class="feature-card">
                <i class="fas fa-shield-alt"></i>
                <h3>Safe Rides</h3>
                <p>Verified drivers and real-time tracking for your safety</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-clock"></i>
                <h3>24/7 Service</h3>
                <p>Available round the clock for your convenience</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-money-bill-wave"></i>
                <h3>Best Rates</h3>
                <p>Competitive pricing with no hidden charges</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-car"></i>
                <h3>Clean Vehicles</h3>
                <p>Well-maintained and sanitized fleet</p>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats">
        <div class="stats-grid">
            <div class="stat-item">
                <h3>1000+</h3>
                <p>Monthly Customers</p>
            </div>
            <div class="stat-item">
                <h3>100+</h3>
                <p>Expert Drivers</p>
            </div>
            <div class="stat-item">
                <h3>24/7</h3>
                <p>Customer Support</p>
            </div>
            <div class="stat-item">
                <h3>4.9/5</h3>
                <p>Customer Rating</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
<footer>
    <div class="footer-grid">
        <div class="footer-column">
            <div class="logo">
                <a href="index.jsp" class="logo">
                    <span class="logo-icon">🚖</span> Mega City Cab
                </a>
            </div>
            <p style="color: #ffffff;" >Your trusted transportation partner since 2015. Safety, reliability, and comfort in every ride.</p>
        </div>
        <div class="footer-column">
            <h4 class="footer-title">Quick Links</h4>
            <ul class="footer-links">
                <li><a href="index.jsp"><i class="fas fa-chevron-right"></i> Home</a></li>
                <li><a href="about.jsp"><i class="fas fa-chevron-right"></i> About Us</a></li>
                <li><a href="services.jsp"><i class="fas fa-chevron-right"></i> Services</a></li>
                <li><a href="contact.jsp"><i class="fas fa-chevron-right"></i> Contact</a></li>
            </ul>
        </div>
        <div class="footer-column">
            <h4 class="footer-title">Contact Us</h4>
            <div class="contact-item">
                <i class="fas fa-map-marker-alt contact-icon"></i>
                <div class="contact-info">Colombo, Sri Lanka</div>
            </div>
            <div class="contact-item">
                <i class="fas fa-phone contact-icon"></i>
                <div class="contact-info">+94 11 234 5678</div>
            </div>
            <div class="contact-item">
                <i class="fas fa-envelope contact-icon"></i>
                <div class="contact-info">info@megacitycab.com</div>
            </div>
        </div>
        <div class="footer-column">
            <h4 class="footer-title">Follow Us</h4>
            <div class="social-links">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>
    <div class="copyright">
        <p>© 2025 Mega City Cab. All Rights Reserved. | <a href="privacy.jsp">Privacy Policy</a> | <a href="terms.jsp">Terms of Service</a></p>
    </div>
</footer>

<!-- Scroll to top button -->
    <div class="scroll-top">
        <i class="fas fa-chevron-up"></i>
    </div>

<script>
        // Scroll to top button functionality
        const scrollTop = document.querySelector('.scroll-top');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 300) {
                scrollTop.classList.add('active');
            } else {
                scrollTop.classList.remove('active');
            }
        });

        scrollTop.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });

        // Mobile menu toggle
        const mobileToggle = document.querySelector('.mobile-toggle');
        const navLinks = document.querySelector('.nav-links');
        mobileToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
        });
        
        backToTopButton.addEventListener('click', (e) => {
            e.preventDefault();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    </script>
</body>
</html>
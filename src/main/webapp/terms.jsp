<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega Cit Cab - Terms of Service</title>
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
            --transparent-yellow: rgba(255, 184, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--off-white);
            color: var(--light-black);
            line-height: 1.6;
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

        .hero {
            background: linear-gradient(rgba(30, 30, 30, 0.8), rgba(30, 30, 30, 0.8)), url('/api/placeholder/1200/300') center/cover;
            padding: 80px 0;
            text-align: center;
            color: var(--pure-white);
        }

        .hero h1 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 18px;
            max-width: 700px;
            margin: 0 auto;
        }

        .accent {
            color: var(--primary-yellow);
        }

        main {
            padding: 60px 0;
        }

        .tos-container {
            background-color: var(--pure-white);
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
        }

        .tos-nav {
            background-color: var(--transparent-yellow);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }

        .tos-nav h3 {
            margin-bottom: 15px;
            color: var(--medium-black);
            font-size: 18px;
        }

        .tos-nav ul {
            list-style: none;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .tos-nav li a {
            display: block;
            padding: 8px 16px;
            background-color: var(--pure-white);
            border-radius: 30px;
            color: var(--medium-black);
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s;
        }

        .tos-nav li a:hover {
            background-color: var(--primary-yellow);
            color: var(--pure-white);
        }

        .tos-content section {
            margin-bottom: 40px;
        }

        .tos-content h2 {
            font-size: 24px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 3px solid var(--primary-yellow);
            display: inline-block;
        }

        .tos-content h3 {
            font-size: 20px;
            margin: 20px 0 15px;
            color: var(--medium-black);
        }

        .tos-content p, .tos-content ul, .tos-content ol {
            margin-bottom: 15px;
        }

        .tos-content ul, .tos-content ol {
            padding-left: 20px;
        }

        .tos-content li {
            margin-bottom: 8px;
        }

        .highlight-box {
            background-color: var(--transparent-yellow);
            border-left: 4px solid var(--primary-yellow);
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
        }

        .update-info {
            display: flex;
            align-items: center;
            margin-top: 40px;
            padding: 15px;
            background-color: var(--transparent-yellow);
            border-radius: 8px;
        }

        .update-icon {
            background-color: var(--primary-yellow);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            flex-shrink: 0;
        }

        .update-icon svg {
            width: 20px;
            height: 20px;
        }

        .update-text {
            font-size: 14px;
        }

        .update-text strong {
            display: block;
            margin-bottom: 5px;
        }

        .effective-date {
            text-align: right;
            font-style: italic;
            color: var(--medium-black);
            margin-top: 30px;
        }

        .cta-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 40px;
        }

        .cta-button {
            display: inline-block;
            padding: 12px 25px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
            text-align: center;
        }

        .primary-cta {
            background-color: var(--primary-yellow);
            color: var(--dark-black);
        }

        .primary-cta:hover {
            background-color: var(--secondary-yellow);
            transform: translateY(-2px);
        }

        .secondary-cta {
            background-color: var(--medium-black);
            color: var(--pure-white);
        }

        .secondary-cta:hover {
            background-color: var(--light-black);
            transform: translateY(-2px);
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

        /* Responsive styles */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                text-align: center;
            }

            nav ul {
                margin-top: 20px;
                justify-content: center;
            }

            nav ul li {
                margin: 0 10px;
            }

            .hero {
                padding: 60px 0;
            }

            .hero h1 {
                font-size: 28px;
            }

            .tos-container {
                padding: 20px;
            }

            .cta-container {
                flex-direction: column;
            }

            .cta-button {
                width: 100%;
            }

            .footer-content {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .tos-nav ul {
                flex-direction: column;
            }

            .tos-nav li a {
                width: 100%;
                text-align: center;
            }
        }

        /* Print styles */
        @media print {
            header, .tos-nav, footer, .cta-container {
                display: none;
            }

            body, .tos-container {
                background-color: white;
                color: black;
                box-shadow: none;
            }

            .tos-content h2 {
                border-bottom-color: #000;
            }

            .highlight-box, .update-info {
                border: 1px solid #ddd;
                background-color: white;
            }
        }

        .back-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 50px;
            height: 50px;
            background-color: var(--primary-yellow);
            color: var(--dark-black);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            font-weight: bold;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            opacity: 0;
            visibility: hidden;
            transition: all 0.3s;
        }

        .back-to-top.visible {
            opacity: 1;
            visibility: visible;
        }

        .back-to-top:hover {
            background-color: var(--secondary-yellow);
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
                <a href="about.jsp" >About Us</a>
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

    <div class="hero">
        <div class="container">
            <h1>Terms of <span class="accent">Service</span></h1>
            <p>Please read these terms carefully before using Mega Cit Cab services. By using our platform, you agree to be bound by these terms and conditions.</p>
        </div>
    </div>

    <main>
        <div class="container">
            <div class="tos-container">
                <div class="tos-nav">
                    <h3>Quick Navigation</h3>
                    <ul>
                        <li><a href="#introduction">Introduction</a></li>
                        <li><a href="#user-accounts">User Accounts</a></li>
                        <li><a href="#service-usage">Service Usage</a></li>
                        <li><a href="#payment-terms">Payment Terms</a></li>
                        <li><a href="#cancellation-policy">Cancellation Policy</a></li>
                        <li><a href="#liability">Liability</a></li>
                        <li><a href="#privacy">Privacy Policy</a></li>
                        <li><a href="#modifications">Modifications</a></li>
                    </ul>
                </div>

                <div class="tos-content">
                    <section id="introduction">
                        <h2>Introduction</h2>
                        <p>Welcome to Mega Cit Cab Services. These Terms of Service ("Terms") govern your use of our website, mobile application, and transportation services (collectively referred to as the "Service").</p>
                        <p>By accessing or using our Service, you agree to be bound by these Terms. If you disagree with any part of the terms, you may not access the Service.</p>
                        
                        <div class="highlight-box">
                            <h3>Important Notice</h3>
                            <p>These Terms constitute a legally binding agreement between you and Mega Cit Cab. It is your responsibility to review these Terms periodically for changes. Your continued use of the Service following the posting of any changes constitutes your acceptance of those changes.</p>
                        </div>
                    </section>

                    <section id="user-accounts">
                        <h2>User Accounts</h2>
                        <p>To use certain features of our Service, you may be required to register for an account. You must provide accurate, current, and complete information during the registration process and keep your account information updated.</p>
                        
                        <h3>Account Security</h3>
                        <p>You are responsible for safeguarding the password you use to access the Service and for any activities or actions under your password. We encourage you to use "strong" passwords (passwords that use a combination of upper and lower case letters, numbers, and symbols) with your account.</p>
                        
                        <h3>Account Termination</h3>
                        <p>We reserve the right to terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including, without limitation, if you breach the Terms.</p>
                    </section>

                    <section id="service-usage">
                        <h2>Service Usage</h2>
                        <p>Our Service provides a platform connecting users with transportation options. By using our Service, you agree to use it only for lawful purposes and in accordance with these Terms.</p>
                        
                        <h3>User Responsibilities</h3>
                        <ol>
                            <li>You agree to provide accurate pick-up and drop-off locations.</li>
                            <li>You will be present at the pick-up location at the scheduled time.</li>
                            <li>You will treat drivers and other passengers with respect.</li>
                            <li>You will not engage in any illegal, harmful, or disruptive behavior while using our Service.</li>
                            <li>You will comply with all applicable laws and regulations while using our Service.</li>
                        </ol>
                        
                        <h3>Service Availability</h3>
                        <p>Mega Cit Cab makes no guarantee regarding the availability of rides or the quality of transportation services. While we strive to provide reliable service, availability depends on factors including driver availability, traffic conditions, and weather.</p>
                    </section>

                    <section id="payment-terms">
                        <h2>Payment Terms</h2>
                        <p>By using our Service, you agree to pay all fees and charges incurred in connection with your use of the Service at the rates in effect when such charges are incurred.</p>
                        
                        <h3>Pricing</h3>
                        <p>Prices for our services are subject to change without notice. Fare estimates provided before a trip are estimates only and the final price may vary based on actual route, traffic, time, and other factors.</p>
                        
                        <h3>Payment Methods</h3>
                        <p>We accept various payment methods including credit cards, debit cards, and other digital payment solutions. You agree to provide accurate billing information and authorize us to charge your chosen payment method for all services you use.</p>
                        
                        <h3>Receipts</h3>
                        <p>After each successful ride, a receipt will be sent to your registered email address. This receipt will include details of the trip and payment information.</p>
                    </section>

                    <section id="cancellation-policy">
                        <h2>Cancellation Policy</h2>
                        <p>Mega Cit Cab reserves the right to charge a cancellation fee for rides canceled after a certain period. These fees help compensate drivers for time and fuel spent traveling to pick-up locations.</p>
                        
                        <h3>Cancellation Fee Structure</h3>
                        <ul>
                            <li>Cancellations within 2 minutes of booking: No fee</li>
                            <li>Cancellations after 2 minutes but before driver arrival: Partial fee</li>
                            <li>Cancellations after driver arrival: Full fee</li>
                            <li>No-shows: Full fee plus waiting time charges</li>
                        </ul>
                        
                        <h3>Refunds</h3>
                        <p>Refund requests for legitimate service issues will be reviewed on a case-by-case basis. Please contact our customer service team within 24 hours of the completed or canceled ride to request a refund.</p>
                    </section>

                    <section id="liability">
                        <h2>Liability</h2>
                        <p>Mega Cit Cab strives to provide reliable transportation services, but we cannot guarantee absolute safety or timeliness. By using our Service, you acknowledge and agree to the following liability limitations:</p>
                        
                        <h3>Limitation of Liability</h3>
                        <p>To the maximum extent permitted by law, Mega Cit Cab shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses resulting from your use or inability to use the Service.</p>
                        
                        <h3>Indemnification</h3>
                        <p>You agree to defend, indemnify, and hold harmless Mega Cit Cab and its officers, directors, employees, and agents from and against any claims, liabilities, damages, losses, and expenses, including, without limitation, reasonable legal and accounting fees, arising out of or in any way connected with your access to or use of the Service or your violation of these Terms.</p>
                    </section>

                    <section id="privacy">
                        <h2>Privacy Policy</h2>
                        <p>Your privacy is important to us. Our Privacy Policy explains how we collect, use, protect, and disclose information and data when you use our Service. By using our Service, you agree to the collection and use of information in accordance with our Privacy Policy.</p>
                        
                        <h3>Data Collection</h3>
                        <p>We collect various types of information, including personal information, usage data, location data, and device information. This information helps us provide, improve, and personalize our services.</p>
                        
                        <h3>Data Sharing</h3>
                        <p>We may share your information with drivers to facilitate your transportation needs, with service providers who perform services on our behalf, with law enforcement when required by law, and in connection with a business transaction such as a merger or acquisition.</p>
                    </section>

                    <section id="modifications">
                        <h2>Modifications to the Service and Terms</h2>
                        <p>Mega Cit Cab reserves the right to modify or discontinue, temporarily or permanently, the Service (or any part thereof) with or without notice. We will not be liable to you or to any third party for any modification, price change, suspension, or discontinuance of the Service.</p>
                        
                        <p>We may revise these Terms from time to time. The most current version will always be posted on our website. By continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms.</p>
                    </section>

                    <div class="update-info">
                        <div class="update-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                        </div>
                        <div class="update-text">
                            <strong>Last Updated:</strong>
                            These Terms of Service were last updated on February 26, 2025. Previous versions can be requested by contacting our customer service team.
                        </div>
                    </div>

                    <p class="effective-date">Effective Date: March 1, 2025</p>
                </div>

                <div class="cta-container">
                    <a href="#" class="cta-button primary-cta">Accept Terms</a>
                    <a href="#" class="cta-button secondary-cta">Download PDF</a>
                </div>
            </div>
        </div>
    </main>

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

    <a href="#" class="back-to-top" id="backToTop">↑</a>

    <script>
        // Back to top button functionality
        const backToTopButton = document.getElementById('backToTop');
        
        window.addEventListener('scroll', () => {
            if (window.pageYOffset > 300) {
                backToTopButton.classList.add('visible');
            } else {
                backToTopButton.classList.remove('visible');
            }
        });
        
        backToTopButton.addEventListener('click', (e) => {
            e.preventDefault();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });

        // Smooth scrolling for navigation links
        document.querySelectorAll('.tos-nav a').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();
                
                const targetId = this.getAttribute('href');
                const targetElement = document.querySelector(targetId);
                
                window.scrollTo({
                    top: targetElement.offsetTop - 100,
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>
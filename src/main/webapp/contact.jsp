<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Mega City Cab</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

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

        body {
            background-color: var(--off-white);
            color: var(--dark-black);
            line-height: 1.6;
            padding-bottom: 70px;
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

        .btn1 {
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

        /* Page Header */
        .page-header {
            background-color: var(--dark-black);
            color: var(--pure-white);
            padding: 4rem 5% 6rem;
            position: relative;
            overflow: hidden;
        }

        .header-container {
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

        .page-title {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            position: relative;
            display: inline-block;
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 80px;
            height: 4px;
            background-color: var(--primary-yellow);
            border-radius: 2px;
        }

        .page-subtitle {
            font-size: 1.2rem;
            max-width: 600px;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .page-header-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.1;
            background: radial-gradient(var(--primary-yellow) 2px, transparent 2px);
            background-size: 30px 30px;
        }

        /* Contact Section */
        .contact-section {
            margin-top: -3rem;
            position: relative;
            z-index: 10;
            padding: 0 5%;
        }

        .contact-container {
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
        }

        /* Contact Form */
        .contact-form-container {
            background-color: var(--pure-white);
            border-radius: 10px;
            box-shadow: 0 5px 30px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
        }

        .form-title {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--dark-black);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--light-black);
        }

        .form-control {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s, box-shadow 0.3s;
            background-color: var(--off-white);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-yellow);
            box-shadow: 0 0 0 3px var(--transparent-yellow);
        }

        .form-control::placeholder {
            color: #999;
        }

        textarea.form-control {
            min-height: 150px;
            resize: vertical;
        }

        .btn {
            display: inline-block;
            background-color: var(--primary-yellow);
            color: var(--dark-black);
            padding: 0.5rem 1.5rem;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 500;
            font-size: 1rem;
            border: none;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(255, 184, 0, 0.3);
            background-color: var(--secondary-yellow);
        }

        .btn-block {
            display: block;
            width: 100%;
        }

        /* Contact Info */
        .contact-info-container {
            background-color: var(--pure-white);
            border-radius: 10px;
            box-shadow: 0 5px 30px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            display: flex;
            flex-direction: column;
        }

        .info-title {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--dark-black);
        }

        .info-subtitle {
            font-size: 1rem;
            color: var(--light-black);
            margin-bottom: 2rem;
        }

        .contact-methods {
            margin-bottom: 2.5rem;
        }

        .contact-method {
            display: flex;
            align-items: flex-start;
            margin-bottom: 1.5rem;
        }

        .method-icon {
            width: 45px;
            height: 45px;
            background-color: var(--transparent-yellow);
            color: var(--primary-yellow);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            margin-right: 1rem;
            flex-shrink: 0;
        }

        .method-details h4 {
            font-size: 1.1rem;
            margin-bottom: 0.3rem;
            color: var(--dark-black);
        }

        .method-details p {
            color: var(--light-black);
            line-height: 1.5;
        }

        .method-details a {
            color: var(--light-black);
            text-decoration: none;
            transition: color 0.3s;
        }

        .method-details a:hover {
            color: var(--primary-yellow);
        }

        .social-links {
            margin-top: auto;
        }

        .social-title {
            font-size: 1.2rem;
            margin-bottom: 1rem;
            color: var(--dark-black);
        }

        .social-icons {
            display: flex;
            gap: 1rem;
        }

        .social-icon {
            width: 40px;
            height: 40px;
            background-color: var(--off-white);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--light-black);
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s, transform 0.3s;
        }

        .social-icon:hover {
            background-color: var(--primary-yellow);
            color: var(--pure-white);
            transform: translateY(-3px);
        }

        /* Business Hours */
        .business-hours {
            background-color: var(--pure-white);
            border-radius: 10px;
            box-shadow: 0 5px 30px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            margin-top: 2rem;
        }

        .hours-title {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--dark-black);
        }

        .hours-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 1.5rem;
        }

        .hours-item {
            background-color: var(--off-white);
            padding: 1.5rem;
            border-radius: 8px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .hours-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
        }

        .hours-day {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--dark-black);
        }

        .hours-time {
            color: var(--light-black);
        }

        /* Map Section */
        .map-section {
            margin-top: 3rem;
            padding: 0 5%;
        }

        .map-container {
            max-width: 1400px;
            margin: 0 auto;
        }

        .map-title {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--dark-black);
        }

        .map-frame {
            width: 100%;
            height: 450px;
            border-radius: 10px;
            border: none;
            box-shadow: 0 5px 30px rgba(0, 0, 0, 0.1);
        }

        /* FAQs Section */
        .faq-section {
            margin-top: 3rem;
            padding: 0 5%;
        }

        .faq-container {
            max-width: 1400px;
            margin: 0 auto;
        }

        .faq-title {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--dark-black);
        }

        .faq-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .faq-item {
            background-color: var(--pure-white);
            border-radius: 8px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .faq-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .faq-question {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.8rem;
            color: var(--dark-black);
        }

        .faq-answer {
            color: var(--light-black);
            line-height: 1.5;
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


        /* Responsive Design */
        @media (max-width: 992px) {
            .contact-container {
                grid-template-columns: 1fr;
            }

            .contact-form-container {
                order: 2;
            }

            .contact-info-container {
                order: 1;
            }
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                flex-direction: column;
                background-color: var(--dark-black);
                padding: 1rem;
                text-align: center;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
            }

            .nav-links.active {
                display: flex;
            }

            .nav-links li {
                margin: 1rem 0;
            }

            .mobile-toggle {
                display: block;
            }

            .page-title {
                font-size: 2.5rem;
            }

            .contact-form-container,
            .contact-info-container,
            .business-hours,
            .faq-item {
                padding: 1.5rem;
            }

            .hours-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 576px) {
            .page-title {
                font-size: 2rem;
            }

            .hours-grid {
                grid-template-columns: 1fr;
            }
        }

        /* Animation and Effects */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .contact-form-container,
        .contact-info-container,
        .business-hours,
        .map-container,
        .faq-item {
            animation: fadeIn 0.6s ease-out forwards;
        }

        .faq-item:nth-child(2) {
            animation-delay: 0.1s;
        }

        .faq-item:nth-child(3) {
            animation-delay: 0.2s;
        }

        .faq-item:nth-child(4) {
            animation-delay: 0.3s;
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
                <a href="contact.jsp" class="active">Contact</a>
            </div>
            <div class="mobile-toggle">
                <i class="fas fa-bars"></i>
            </div>
            <div class="auth-buttons">
                <a href="login.jsp" class="btn1 btn-login">Login</a>
                <a href="register.jsp " class="btn1 btn-register">Register</a>
            </div>
        </nav>
    </header>

    <!-- Page Header -->
    <header class="page-header">
        <div class="page-header-bg"></div>
        <div class="header-container">
            <h1 class="page-title">Contact Us</h1>
            <p class="page-subtitle">Have questions or need assistance? We're here to help! Reach out to our team through any of the contact methods below.</p>
        </div>
    </header>

    <!-- Contact Section -->
    <section class="contact-section">
        <div class="contact-container">
            <!-- Contact Form -->
            <div class="contact-form-container">
                <h2 class="form-title">Send Us a Message</h2>
                <form id="contactForm">
                    <div class="form-group">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" id="name" class="form-control" placeholder="Enter your full name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email" class="form-label">Email Address</label>
                        <input type="email" id="email" class="form-control" placeholder="Enter your email address" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="tel" id="phone" class="form-control" placeholder="Enter your phone number">
                    </div>
                    
                    <div class="form-group">
                        <label for="subject" class="form-label">Subject</label>
                        <select id="subject" class="form-control" required>
                            <option value="" disabled selected>Select a subject</option>
                            <option value="general">General Inquiry</option>
                            <option value="booking">Booking Information</option>
                            <option value="feedback">Feedback</option>
                            <option value="complaint">Complaint</option>
                            <option value="corporate">Corporate Services</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="message" class="form-label">Your Message</label>
                        <textarea id="message" class="form-control" placeholder="Type your message here..." required></textarea>
                    </div>
                    
                    <button type="submit" class="btn btn-block">Send Message</button>
                </form>
            </div>
            
            <!-- Contact Info -->
            <div class="contact-info-container">
                <h2 class="info-title">Contact Information</h2>
                <p class="info-subtitle">Feel free to reach out to us using any of the following contact methods.</p>
                
                <div class="contact-methods">
                    <div class="contact-method">
                        <div class="method-icon">📞</div>
                        <div class="method-details">
                            <h4>Phone</h4>
                            <p><a href="tel:+94112345678">+94 11 234 5678</a> (24/7 Customer Service)</p>
                            <p><a href="tel:+94112345679">+94 11 234 5679</a> (Corporate Inquiries)</p>
                        </div>
                    </div>
                    
                    <div class="contact-method">
                        <div class="method-icon">✉️</div>
                        <div class="method-details">
                            <h4>Email</h4>
                            <p><a href="mailto:info@megacitycab.com">info@megacitycab.com</a> (General Inquiries)</p>
                            <p><a href="mailto:support@megacitycab.com">support@megacitycab.com</a> (Customer Support)</p>
                        </div>
                    </div>
                    
                    <div class="contact-method">
                        <div class="method-icon">📍</div>
                        <div class="method-details">
                            <h4>Main Office</h4>
                            <p>Mega City Cab,<br>Colombo,<br>Sri Lanka</p>
                        </div>
                    </div>
                    
                    <div class="contact-method">
                        <div class="method-icon">🕒</div>
                        <div class="method-details">
                            <h4>Hours of Operation</h4>
                            <p>24/7 Ride Service<br>Office Hours: Mon-Fri, 9:00 AM - 6:00 PM</p>
                        </div>
                    </div>
                </div>
                
                <div class="social-links">
                    <h3 class="social-title">Connect With Us</h3>
                    <div class="social-icons">
                        <a href="#" class="social-icon" title="Facebook">
                            <span>f</span>
                        </a>
                        <a href="#" class="social-icon" title="Twitter">
                            <span>𝕏</span>
                        </a>
                        <a href="#" class="social-icon" title="Instagram">
                            <span>📷</span>
                        </a>
                        <a href="#" class="social-icon" title="LinkedIn">
                            <span>in</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Business Hours Section -->
    <section class="contact-section">
        <div class="business-hours">
            <h2 class="hours-title">Business Hours</h2>
            <div class="hours-grid">
                <div class="hours-item">
                    <div class="hours-day">Monday</div>
                    <div class="hours-time">9:00 AM - 6:00 PM</div>
                </div>
                <div class="hours-item">
                    <div class="hours-day">Tuesday</div>
                    <div class="hours-time">9:00 AM - 6:00 PM</div>
                </div>
                <div class="hours-item">
                    <div class="hours-day">Wednesday</div>
                    <div class="hours-time">9:00 AM - 6:00 PM</div>
                </div>
                <div class="hours-item">
                    <div class="hours-day">Thursday</div>
                    <div class="hours-time">9:00 AM - 6:00 PM</div>
                </div>
                <div class="hours-item">
                    <div class="hours-day">Friday</div>
                    <div class="hours-time">9:00 AM - 6:00 PM</div>
                </div>
                <div class="hours-item">
                    <div class="hours-day">Saturday</div>
                    <div class="hours-time">10:00 AM - 4:00 PM</div>
                </div>
                <div class="hours-item">
                    <div class="hours-day">Sunday</div>
                    <div class="hours-time">Closed (24/7 Ride Service Available)</div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Map Section -->
<section class="map-section">
    <div class="map-container">
        <h2 class="map-title">Find Us</h2>
        <!-- Google Maps Embed -->
        <div class="map-frame">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.906244274126!2d79.8507853153285!3d6.934604495008617!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2591b6e7c3391%3A0x1c0f5a9a5a5a5a5a!2sPettah%2C%20Colombo!5e0!3m2!1sen!2slk!4v1698765432100!5m2!1sen!2slk"
                width="100%"
                height="450"
                style="border:0;"
                allowfullscreen=""
                loading="lazy">
            </iframe>
        </div>
    </div>
</section>
    
    <!-- FAQs Section -->
    <section class="faq-section">
        <div class="faq-container">
            <h2 class="faq-title">Frequently Asked Questions</h2>
            <div class="faq-grid">
                <div class="faq-item">
                    <h3 class="faq-question">How can I book a ride?</h3>
                    <p class="faq-answer">You can book a ride through our mobile app, website, or by calling our customer service line at +1 (123) 456-7890. Our mobile app provides the most convenient booking experience.</p>
                </div>
                
                <div class="faq-item">
                    <h3 class="faq-question">What payment methods do you accept?</h3>
                    <p class="faq-answer">We accept cash, all major credit/debit cards, mobile wallets (Apple Pay, Google Pay), and our in-app wallet. Corporate clients can set up monthly billing arrangements.</p>
                </div>
                
                <div class="faq-item">
                    <h3 class="faq-question">How do I apply to become a driver?</h3>
                    <p class="faq-answer">Visit our Careers page or contact our HR department at careers@megacitycab.com. We require a valid driver's license, clean driving record, background check, and vehicle inspection.</p>
                </div>
                
                <div class="faq-item">
                    <h3 class="faq-question">Do you offer corporate accounts?</h3>
                    <p class="faq-answer">Yes, we offer corporate accounts with customized solutions, centralized billing, and dedicated account managers. Contact our corporate team at corporate@megacitycab.com for details.</p>
                </div>
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
	
    <!-- Simple JavaScript for the mobile menu toggle -->
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

        document.addEventListener('DOMContentLoaded', function() {
            const mobileToggle = document.querySelector('.mobile-toggle');
            const navLinks = document.querySelector('.nav-links');
            
            mobileToggle.addEventListener('click', function() {
                navLinks.classList.toggle('active');
            });
            
            // Simple form validation
            const contactForm = document.getElementById('contactForm');
            
            contactForm.addEventListener('submit', function(event) {
                event.preventDefault();
                alert('Thank you for your message! We will get back to you soon.');
                contactForm.reset();
            });
            
            // Animate FAQ items on click (for a real implementation, you would toggle answers)
            const faqItems = document.querySelectorAll('.faq-item');
            
            faqItems.forEach(item => {
                item.addEventListener('click', function() {
                    this.classList.toggle('active');
                });
            });
        });
    </script>
</body>
</html>
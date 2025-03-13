<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega Cit Cab - Privacy Policy</title>
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

        .privacy-container {
            background-color: var(--pure-white);
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
        }

        .privacy-nav {
            background-color: var(--transparent-yellow);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            position: none;
            top: 90px;
            z-index: 90;
        }

        .privacy-nav h3 {
            margin-bottom: 15px;
            color: var(--medium-black);
            font-size: 18px;
        }

        .privacy-nav ul {
            list-style: none;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .privacy-nav li a {
            display: block;
            padding: 8px 16px;
            background-color: var(--pure-white);
            border-radius: 30px;
            color: var(--medium-black);
            text-decoration: none;
            font-size: 14px;
            transition: all 0.3s;
        }

        .privacy-nav li a:hover {
            background-color: var(--primary-yellow);
            color: var(--pure-white);
        }

        .privacy-nav li a.active {
            background-color: var(--primary-yellow);
            color: var(--pure-white);
        }

        .privacy-content section {
            margin-bottom: 40px;
            scroll-margin-top: 150px;
        }

        .privacy-content h2 {
            font-size: 24px;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 3px solid var(--primary-yellow);
            display: inline-block;
        }

        .privacy-content h3 {
            font-size: 20px;
            margin: 20px 0 15px;
            color: var(--medium-black);
        }

        .privacy-content p, .privacy-content ul, .privacy-content ol {
            margin-bottom: 15px;
        }

        .privacy-content ul, .privacy-content ol {
            padding-left: 20px;
        }

        .privacy-content li {
            margin-bottom: 8px;
        }

        .data-card {
            margin: 20px 0;
            padding: 20px;
            border-radius: 8px;
            background-color: var(--transparent-yellow);
            border-left: 4px solid var(--primary-yellow);
        }

        .data-card h4 {
            margin-bottom: 10px;
            color: var(--dark-black);
            font-size: 18px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .data-card h4 svg {
            width: 24px;
            height: 24px;
        }

        .data-card ul {
            columns: 2;
            column-gap: 30px;
        }

        @media (max-width: 768px) {
            .data-card ul {
                columns: 1;
            }
        }

        .data-visual {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin: 30px 0;
        }

        .data-category {
            flex: 1 1 200px;
            padding: 20px;
            border-radius: 8px;
            background-color: var(--pure-white);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .data-category:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .data-category h4 {
            font-size: 18px;
            margin-bottom: 15px;
            color: var(--medium-black);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .data-category svg {
            width: 24px;
            height: 24px;
        }

        .data-category p {
            font-size: 14px;
        }

        .icon-container {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--transparent-yellow);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
        }

        .icon-container svg {
            width: 20px;
            height: 20px;
            color: var(--primary-yellow);
        }

        .privacy-timeline {
            position: relative;
            margin: 40px 0;
            padding-left: 30px;
        }

        .timeline-line {
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 3px;
            background-color: var(--primary-yellow);
        }

        .timeline-item {
            position: relative;
            margin-bottom: 30px;
            padding-bottom: 30px;
            border-bottom: 1px dashed #e0e0e0;
        }

        .timeline-item:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .timeline-item::before {
            content: '';
            position: absolute;
            left: -37px;
            top: 5px;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background-color: var(--primary-yellow);
            border: 4px solid var(--pure-white);
            box-shadow: 0 0 0 2px var(--primary-yellow);
        }

        .timeline-date {
            font-size: 14px;
            font-weight: 600;
            color: var(--primary-yellow);
            margin-bottom: 10px;
        }

        .accordion {
            margin: 20px 0;
        }

        .accordion-item {
            margin-bottom: 10px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .accordion-header {
            padding: 15px 20px;
            background-color: var(--transparent-yellow);
            font-size: 18px;
            font-weight: 600;
            color: var(--medium-black);
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: background-color 0.3s;
        }

        .accordion-header:hover {
            background-color: rgba(255, 184, 0, 0.2);
        }

        .accordion-content {
            padding: 0;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease-out, padding 0.3s ease;
            background-color: var(--pure-white);
        }

        .accordion-content-inner {
            padding: 20px;
        }

        .accordion-item.active .accordion-content {
            max-height: 500px;
            padding: 20px;
        }

        .accordion-icon {
            transition: transform 0.3s;
        }

        .accordion-item.active .accordion-icon {
            transform: rotate(180deg);
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

        .toggle-switch {
            display: flex;
            align-items: center;
            margin: 30px 0;
            padding: 20px;
            background-color: var(--transparent-yellow);
            border-radius: 8px;
        }

        .toggle-switch-label {
            flex: 1;
            font-weight: 600;
        }

        .toggle-switch-description {
            margin-top: 5px;
            font-size: 14px;
            opacity: 0.8;
        }

        .toggle {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 30px;
            margin-left: 20px;
        }

        .toggle input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 30px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 22px;
            width: 22px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: var(--primary-yellow);
        }

        input:focus + .slider {
            box-shadow: 0 0 1px var(--primary-yellow);
        }

        input:checked + .slider:before {
            transform: translateX(30px);
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

            .privacy-container {
                padding: 20px;
            }

            .privacy-nav {
                position: relative;
                top: 0;
                margin-bottom: 20px;
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
            .privacy-nav ul {
                flex-direction: column;
            }

            .privacy-nav li a {
                width: 100%;
                text-align: center;
            }
        }

        /* Print styles */
        @media print {
            header, .privacy-nav, footer, .cta-container {
                display: none;
            }

            body, .privacy-container {
                background-color: white;
                color: black;
                box-shadow: none;
            }

            .privacy-content h2 {
                border-bottom-color: #000;
            }

            .data-card, .update-info {
                border: 1px solid #ddd;
                background-color: white;
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
    <div class="progress-container">
        <div class="progress-bar" id="progressBar"></div>
    </div>

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

    <div class="hero">
        <div class="container">
            <h1>Privacy <span class="accent">Policy</span></h1>
            <p>We are committed to protecting your personal information and ensuring your experience with Mega Cit Cab is as safe as your ride.</p>
        </div>
    </div>

    <main>
        <div class="container">
            <div class="privacy-container">
                <div class="privacy-nav">
                    <h3>Quick Navigation</h3>
                    <ul>
                        <li><a href="#introduction">Introduction</a></li>
                        <li><a href="#data-collection">Data Collection</a></li>
                        <li><a href="#data-usage">Data Usage</a></li>
                        <li><a href="#data-sharing">Data Sharing</a></li>
                        <li><a href="#data-security">Data Security</a></li>
                        <li><a href="#your-rights">Your Rights</a></li>
                        <li><a href="#cookies">Cookies</a></li>
                        <li><a href="#changes">Policy Changes</a></li>
                        <li><a href="#contact">Contact Us</a></li>
                    </ul>
                </div>

                <div class="privacy-content">
                    <section id="introduction">
                        <h2>Introduction</h2>
                        <p>Welcome to Mega Cit Cab's Privacy Policy. At Mega Cit Cab, we understand the importance of protecting your personal information and are committed to being transparent about how we collect, use, and protect your data.</p>
                        <p>This Privacy Policy is designed to help you understand what information we collect, how we use it, and what choices you have regarding your personal data.</p>
                        
                        <div class="data-card">
                            <h4>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <line x1="12" y1="16" x2="12" y2="12"></line>
                                    <line x1="12" y1="8" x2="12.01" y2="8"></line>
                                </svg>
                                This Policy Applies To:
                            </h4>
                            <ul>
                                <li>Mega Cit Cab mobile application</li>
                                <li>Mega Cit Cab website</li>
                                <li>All Mega Cit Cab transportation services</li>
                                <li>Customer support interactions</li>
                                <li>Marketing communications</li>
                                <li>Job applications</li>
                                <li>Third-party integrations</li>
                                <li>Mega Cit Cab business partners</li>
                            </ul>
                        </div>
                    </section>

                    <section id="data-collection">
                        <h2>Data Collection</h2>
                        <p>We collect various types of information to provide, improve, and protect our services. The data we collect depends on how you use our service and the permissions you've granted.</p>

                        <div class="data-visual">
                            <div class="data-category">
                                <h4>
                                    <div class="icon-container">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                    </div>
                                    Personal Information
                                </h4>
                                <p>Information that identifies you, such as your name, email address, phone number, profile photo, and payment information.</p>
                            </div>
                            <div class="data-category">
                                <h4>
                                    <div class="icon-container">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6"></polygon>
                                            <line x1="8" y1="2" x2="8" y2="18"></line>
                                            <line x1="16" y1="6" x2="16" y2="22"></line>
                                        </svg>
                                    </div>
                                    Location Data
                                </h4>
                                <p>Information about your precise or approximate location, including pick-up and drop-off locations, and route data.</p>
                            </div>
                            <div class="data-category">
                                <h4>
                                    <div class="icon-container">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <rect x="4" y="2" width="16" height="20" rx="2" ry="2"></rect>
                                            <line x1="12" y1="18" x2="12.01" y2="18"></line>
                                        </svg>
                                    </div>
                                    Device Information
                                </h4>
                                <p>Information about your device such as IP address, browser type, operating system, device model, and mobile network information.</p>
                            </div>
                            <div class="data-category">
                                <h4>
                                    <div class="icon-container">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <circle cx="12" cy="12" r="10"></circle>
                                            <polyline points="12 6 12 12 16 14"></polyline>
                                        </svg>
                                    </div>
                                    Usage Data
                                </h4>
                                <p>Information about how you interact with our services, including ride history, app features used, and time spent on different screens.</p>
                            </div>
                        </div>

                        <h3>How We Collect Information</h3>
                        <p>We collect information in several ways:</p>
                        <ul>
                            <li><strong>Directly from you:</strong> Information you provide when creating an account, requesting a ride, contacting customer support, or participating in surveys.</li>
                            <li><strong>Automatically:</strong> When you use our services, we automatically collect information about your device and how you interact with our platform.</li>
                            <li><strong>From third parties:</strong> We may receive information from partners, service providers, and publicly available sources.</li>
                        </ul>
                    </section>

                    <section id="data-usage">
                        <h2>Data Usage</h2>
                        <p>We use the information we collect for various purposes to provide, maintain, and improve our services. Here's how we use your data:</p>

                        <div class="accordion">
                            <div class="accordion-item">
                                <div class="accordion-header">
                                    Providing and Improving Our Services
                                    <span class="accordion-icon">▼</span>
                                </div>
                                <div class="accordion-content">
                                    <div class="accordion-content-inner">
                                        <ul>
                                            <li>Processing and fulfilling your ride requests</li>
                                            <li>Matching you with available drivers</li>
                                            <li>Calculating fares and processing payments</li>
                                            <li>Providing customer support</li>
                                            <li>Developing new features and services</li>
                                            <li>Troubleshooting and resolving technical issues</li>
                                            <li>Improving the safety and reliability of our platform</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="accordion-item">
                                <div class="accordion-header">
                                    Communications
                                    <span class="accordion-icon">▼</span>
                                </div>
                                <div class="accordion-content">
                                    <div class="accordion-content-inner">
                                        <ul>
                                            <li>Sending ride confirmations and receipts</li>
                                            <li>Providing updates about your ride status</li>
                                            <li>Sending service-related notifications</li>
                                            <li>Responding to your inquiries and feedback</li>
                                            <li>Sending promotional offers and marketing communications (where permitted)</li>
                                            <li>Conducting surveys to improve our service</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="accordion-item">
                                <div class="accordion-header">
                                    Safety and Security
                                    <span class="accordion-icon">▼</span>
                                </div>
                                <div class="accordion-content">
                                    <div class="accordion-content-inner">
                                        <ul>
                                            <li>Verifying your identity</li>
                                            <li>Preventing and detecting fraud, spam, and other harmful activities</li>
                                            <li>Investigating violations of our terms or policies</li>
                                            <li>Enhancing the safety of our users and drivers</li>
                                            <li>Protecting against security risks</li>
                                            <li>Monitoring and analyzing usage patterns</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <div class="accordion-header">
                                    Legal and Compliance
                                    <span class="accordion-icon">▼</span>
                                </div>
                                <div class="accordion-content">
                                    <div class="accordion-content-inner">
                                        <ul>
                                            <li>Complying with legal obligations and regulations</li>
                                            <li>Responding to legal requests and court orders</li>
                                            <li>Enforcing our terms and policies</li>
                                            <li>Protecting our rights and property</li>
                                            <li>Resolving disputes and claims</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <h3>Data Retention</h3>
                        <p>We retain your personal data only for as long as necessary to fulfill the purposes outlined in this Privacy Policy, unless a longer retention period is required or permitted by law. Factors influencing retention include:</p>
                        <ul>
                            <li>The duration of your relationship with Mega Cit Cab</li>
                            <li>Legal obligations and regulatory requirements</li>
                            <li>The need to resolve disputes or enforce agreements</li>
                            <li>The necessity to maintain accurate business and financial records</li>
                        </ul>
                    </section>

                    <section id="data-sharing">
                        <h2>Data Sharing</h2>
                        <p>We may share your information with third parties in the following circumstances:</p>

                        <div class="data-card">
                            <h4>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                </svg>
                                With Your Consent
                            </h4>
                            <p>We may share your information with third parties when you give us explicit consent to do so.</p>
                        </div>

                        <div class="data-card">
                            <h4>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                </svg>
                                With Service Providers
                            </h4>
                            <p>We share information with trusted service providers who assist us in operating our platform, such as payment processors, cloud storage providers, and customer support tools.</p>
                        </div>

                        <div class="data-card">
                            <h4>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                </svg>
                                For Legal Reasons
                            </h4>
                            <p>We may disclose your information if required by law, such as to comply with a subpoena, court order, or other legal process.</p>
                        </div>

                        <div class="data-card">
                            <h4>
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                </svg>
                                For Business Transfers
                            </h4>
                            <p>In the event of a merger, acquisition, or sale of assets, your information may be transferred as part of the transaction.</p>
                        </div>
                    </section>

                    <section id="data-security">
                        <h2>Data Security</h2>
                        <p>We take the security of your data seriously and implement appropriate technical and organizational measures to protect it. These measures include:</p>
                        <ul>
                            <li>Encryption of sensitive data in transit and at rest</li>
                            <li>Regular security audits and vulnerability assessments</li>
                            <li>Access controls to limit who can access your information</li>
                            <li>Employee training on data protection best practices</li>
                            <li>Incident response plans to address potential breaches</li>
                        </ul>
                    </section>

                    <section id="your-rights">
                        <h2>Your Rights</h2>
                        <p>You have certain rights regarding your personal data, including:</p>
                        <ul>
                            <li><strong>Access:</strong> You can request a copy of the personal data we hold about you.</li>
                            <li><strong>Correction:</strong> You can request corrections to inaccurate or incomplete data.</li>
                            <li><strong>Deletion:</strong> You can request the deletion of your data under certain conditions.</li>
                            <li><strong>Restriction:</strong> You can request restrictions on how we process your data.</li>
                            <li><strong>Objection:</strong> You can object to certain types of processing, such as direct marketing.</li>
                            <li><strong>Portability:</strong> You can request a copy of your data in a machine-readable format.</li>
                        </ul>
                        <p>To exercise these rights, please contact us using the information provided in the <a href="contact.jsp">Contact Us</a> section.</p>
                    </section>

                    <section id="cookies">
                        <h2>Cookies</h2>
                        <p>We use cookies and similar technologies to enhance your experience on our platform. Cookies are small text files stored on your device that help us:</p>
                        <ul>
                            <li>Remember your preferences and settings</li>
                            <li>Analyze how you use our services</li>
                            <li>Deliver personalized content and ads</li>
                            <li>Improve the performance and security of our platform</li>
                        </ul>
                        <p>You can manage your cookie preferences through your browser settings or our cookie consent tool.</p>
                    </section>

                    <section id="changes">
                        <h2>Policy Changes</h2>
                        <p>We may update this Privacy Policy from time to time. If we make significant changes, we will notify you through our platform or by email. Your continued use of our services after such changes constitutes your acceptance of the updated policy.</p>
                    </section>

                    <section id="contact">
                        <h2>Contact Us</h2>
                        <p>If you have any questions or concerns about this Privacy Policy or our data practices, please contact us at:</p>
                        <p><strong>Email:</strong> privacy@megacitcab.com</p>
                        <p><strong>Phone:</strong> +94 11 234 5677</p>
                        <p><strong>Address:</strong> Mega city cab, Colombo, Sri Lanka</p>
                    </section>
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
<!-- Scroll to Top Button -->
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

    // FAQ Toggle Functionality
    const faqItems = document.querySelectorAll('.faq-item');
    faqItems.forEach(item => {
        item.querySelector('.faq-question').addEventListener('click', () => {
            item.classList.toggle('active');
        });
    });
</script>
</body>
</html>
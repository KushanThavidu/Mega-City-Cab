<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Home</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Root variables for consistent theming */
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

        /* Global reset and basic styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: var(--dark-black);
            color: var(--off-white);
            overflow-x: hidden;
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

        /* Hero section */
        .hero {
            height: 60vh;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('/api/placeholder/1200/800');
            background-size: cover;
            background-position: center;
        }

        .hero-content {
            text-align: center;
            max-width: 800px;
            padding: 0 20px;
            position: relative;
            z-index: 1;
        }

        .hero-content h1 {
            font-size: 4rem;
            margin-bottom: 20px;
            color: var(--pure-white);
            text-transform: uppercase;
            font-weight: 800;
            letter-spacing: 2px;
        }

        .hero-content h1 span {
            color: var(--primary-yellow);
        }

        .hero-content p {
            font-size: 1.2rem;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .cta-button {
            padding: 12px 30px;
            background: var(--primary-yellow);
            color: var(--dark-black);
            text-decoration: none;
            border-radius: 30px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            display: inline-block;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: 2px solid var(--primary-yellow);
        }

        .cta-button:hover {
            background: transparent;
            color: var(--primary-yellow);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(255, 184, 0, 0.2);
        }

        .yellow-stripe {
            background: var(--primary-yellow);
            height: 5px;
            width: 100%;
        }

        /* About section */
        .section {
            padding: 80px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            font-size: 2.5rem;
            margin-bottom: 50px;
            text-align: center;
            color: var(--pure-white);
            position: relative;
        }

        .section-title::after {
            content: '';
            position: absolute;
            height: 4px;
            width: 80px;
            background: var(--primary-yellow);
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }

        .about-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
            margin-top: 50px;
        }

        .about-card {
            background: var(--medium-black);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
            height: 100%;
        }

        .about-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
            border-color: var(--primary-yellow);
        }

        .card-icon {
            width: 100%;
            padding: 30px 0;
            text-align: center;
            font-size: 3rem;
            color: var(--primary-yellow);
            background: var(--light-black);
            border-bottom: 2px solid var(--primary-yellow);
        }

        .card-content {
            padding: 30px;
        }

        .card-title {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: var(--pure-white);
        }

        .card-text {
            line-height: 1.6;
            color: var(--off-white);
            margin-bottom: 20px;
        }

        /* Our Story section */
        .our-story {
            display: flex;
            flex-wrap: wrap;
            gap: 40px;
            align-items: center;
            justify-content: space-between;
        }

        .story-content {
            flex: 1;
            min-width: 300px;
        }

        .story-content h2 {
            font-size: 2.2rem;
            margin-bottom: 25px;
            color: var(--pure-white);
        }

        .story-content h2 span {
            color: var(--primary-yellow);
        }

        .story-text {
            line-height: 1.8;
            margin-bottom: 20px;
        }

        .story-image {
            flex: 1;
            min-width: 300px;
            position: relative;
        }

        .story-image img {
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            border: 3px solid var(--primary-yellow);
        }

        .story-image::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            border: 3px solid var(--primary-yellow);
            border-radius: 10px;
            top: 15px;
            left: 15px;
            z-index: -1;
        }

        /* Stats section */
        .stats-section {
            background: var(--light-black);
            padding: 60px 0;
            border-top: 2px solid var(--primary-yellow);
            border-bottom: 2px solid var(--primary-yellow);
        }

        .stats-container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 30px;
            padding: 0 20px;
        }

        .stat-item {
            text-align: center;
            padding: 20px;
            position: relative;
        }

        .stat-item:not(:last-child)::after {
            content: '';
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            height: 50px;
            width: 1px;
            background: var(--primary-yellow);
            opacity: 0.5;
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 800;
            color: var(--primary-yellow);
            margin-bottom: 10px;
            line-height: 1;
        }

        .stat-label {
            font-size: 1rem;
            color: var(--pure-white);
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Team section */
        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 50px;
        }

        .team-card {
            background: var(--medium-black);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .team-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            border-color: var(--primary-yellow);
        }

        .team-image {
            width: 100%;
            height: 300px;
            overflow: hidden;
            position: relative;
        }

        .team-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .team-card:hover .team-image img {
            transform: scale(1.05);
        }

        .team-details {
            padding: 20px;
            text-align: center;
        }

        .team-name {
            font-size: 1.3rem;
            margin-bottom: 5px;
            color: var(--pure-white);
        }

        .team-position {
            color: var(--primary-yellow);
            font-size: 0.9rem;
            margin-bottom: 15px;
            font-weight: 500;
        }

        .team-bio {
            line-height: 1.6;
            margin-bottom: 15px;
            color: var(--off-white);
            font-size: 0.9rem;
        }

        .team-social {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }

        .team-social a {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: var(--light-black);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--off-white);
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .team-social a:hover {
            background: var(--primary-yellow);
            color: var(--dark-black);
            transform: translateY(-3px);
        }

        /* Testimonials section */
        .testimonials {
            background: var(--light-black);
            padding: 80px 20px;
            position: relative;
            overflow: hidden;
        }

        .testimonials::before {
            content: '';
            position: absolute;
            width: 200px;
            height: 200px;
            background: var(--primary-yellow);
            border-radius: 50%;
            left: -100px;
            top: -100px;
            opacity: 0.05;
        }

        .testimonials::after {
            content: '';
            position: absolute;
            width: 200px;
            height: 200px;
            background: var(--primary-yellow);
            border-radius: 50%;
            right: -100px;
            bottom: -100px;
            opacity: 0.05;
        }

        .testimonial-container {
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }

        .testimonial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 50px;
        }

        .testimonial-card {
            background: var(--medium-black);
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            position: relative;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: transform 0.3s ease;
        }

        .testimonial-card:hover {
            transform: translateY(-5px);
            border-color: var(--primary-yellow);
        }

        .testimonial-card::before {
            content: '"';
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 5rem;
            line-height: 1;
            color: var(--primary-yellow);
            opacity: 0.2;
            font-family: Georgia, serif;
        }

        .testimonial-text {
            margin-bottom: 20px;
            line-height: 1.7;
            position: relative;
            z-index: 1;
        }

        .testimonial-author {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .author-image {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            overflow: hidden;
            border: 2px solid var(--primary-yellow);
        }

        .author-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .author-info {
            display: flex;
            flex-direction: column;
        }

        .author-name {
            font-weight: 600;
            color: var(--pure-white);
        }

        .author-title {
            font-size: 0.9rem;
            color: var(--primary-yellow);
        }

        .rating {
            margin-top: 10px;
            color: var(--primary-yellow);
        }

        /* CTA section */
        .cta-section {
            padding: 100px 20px;
            text-align: center;
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)), url('/api/placeholder/1200/400');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            position: relative;
            border-top: 5px solid var(--primary-yellow);
        }

        .cta-content {
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }

        .cta-title {
            font-size: 3rem;
            color: var(--pure-white);
            margin-bottom: 20px;
        }

        .cta-text {
            font-size: 1.2rem;
            margin-bottom: 40px;
            line-height: 1.6;
        }

        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .cta-primary {
            padding: 15px 40px;
            background: var(--primary-yellow);
            color: var(--dark-black);
            text-decoration: none;
            border-radius: 30px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: 2px solid var(--primary-yellow);
        }

        .cta-secondary {
            padding: 15px 40px;
            background: transparent;
            color: var(--pure-white);
            text-decoration: none;
            border-radius: 30px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: 2px solid var(--pure-white);
        }

        .cta-primary:hover {
            background: transparent;
            color: var(--primary-yellow);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(255, 184, 0, 0.2);
        }

        .cta-secondary:hover {
            background: var(--pure-white);
            color: var(--dark-black);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(255, 255, 255, 0.2);
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

        /* Responsive styles */
        @media (max-width: 992px) {
            .hero-content h1 {
                font-size: 3rem;
            }
            .section-title {
                font-size: 2.2rem;
            }
            .nav-links {
                gap: 20px;
            }
        }

        @media (max-width: 768px) {
            .nav-links {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                width: 100%;
                background: var(--medium-black);
                padding: 20px;
                flex-direction: column;
                align-items: center;
                gap: 15px;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
                border-bottom: 2px solid var(--primary-yellow);
            }
            .nav-links.active {
                display: flex;
            }
            .mobile-toggle {
                display: block;
            }
            .hero-content h1 {
                font-size: 2.5rem;
            }
            .stat-item:after {
                display: none;
            }
        }

        @media (max-width: 576px) {
            .hero-content h1 {
                font-size: 2rem;
            }
            .hero-content p {
                font-size: 1rem;
            }
            .section-title {
                font-size: 1.8rem;
            }
            .cta-title {
                font-size: 2rem;
            }
            .cta-buttons {
                flex-direction: column;
                width: 100%;
                max-width: 280px;
                margin: 0 auto;
            }
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
                <a href="index.jsp" class="active">Home</a>
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

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content animate">
            <h1>Mega City <span>Cab</span></h1>
            <p>Your trusted transportation partner - bringing safety, reliability, and comfort to every journey since 2015.</p>
            <a href="login.jsp" class="cta-button">Book a Ride</a>
        </div>
    </section>
    <div class="yellow-stripe"></div>

    <!-- About Cards Section -->
    <section class="section">
        <h2 class="section-title">Why Choose Us</h2>
        <div class="about-grid">
            <div class="about-card">
                <div class="card-icon">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <div class="card-content">
                    <h3 class="card-title">Safety First</h3>
                    <p class="card-text">Your safety is our top priority. All our drivers undergo rigorous background checks and our vehicles are inspected daily to ensure they meet our high safety standards.</p>
                </div>
            </div>
            <div class="about-card">
                <div class="card-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <div class="card-content">
                    <h3 class="card-title">Always On Time</h3>
                    <p class="card-text">We understand the value of your time. Our smart dispatch system and experienced drivers ensure you reach your destination on schedule, every time.</p>
                </div>
            </div>
            <div class="about-card">
                <div class="card-icon">
                    <i class="fas fa-star"></i>
                </div>
                <div class="card-content">
                    <h3 class="card-title">Premium Service</h3>
                    <p class="card-text">Experience transportation excellence with our meticulously maintained fleet, professional drivers, and attention to every detail of your journey.</p>
                </div>
            </div>
            <div class="about-card">
                <div class="card-icon">
                    <i class="fas fa-hand-holding-usd"></i>
                </div>
                <div class="card-content">
                    <h3 class="card-title">Transparent Pricing</h3>
                    <p class="card-text">No hidden charges or surprise fees. Our upfront pricing ensures you know exactly what you're paying before your trip begins.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Our Story Section -->
    <section class="section">
        <div class="our-story">
            <div class="story-content">
                <h2>Our <span>Story</span></h2>
                <p class="story-text">Mega City Cab was founded in 2015 with a simple mission: to transform urban transportation by combining technology with exceptional service. What started with just 5 cars has grown into a fleet of over 500 vehicles serving thousands of passengers daily.</p>
                <p class="story-text">Our journey began when our founder, Michael Chen, experienced frustration with inconsistent taxi services in the city. He envisioned a transportation service that would prioritize reliability, safety, and customer satisfaction above all else.</p>
                <p class="story-text">Today, Mega City Cab stands as the city's premier transportation provider, known for our distinctive yellow cabs, professional drivers, and commitment to innovation. We continue to evolve, integrating new technologies and sustainable practices while maintaining the personal touch that has defined our service from day one.</p>
            </div>
            <div class="story-image">
                <img src="images/story.jpg" alt="Mega City Cab Fleet">
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="stats-container">
            <div class="stat-item">
                <div class="stat-number">500+</div>
                <div class="stat-label">Vehicles</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">1.2M+</div>
                <div class="stat-label">Happy Riders</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">750+</div>
                <div class="stat-label">Professional Drivers</div>
            </div>
            <div class="stat-item">
                <div class="stat-number">9</div>
                <div class="stat-label">Years of Service</div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="section">
        <h2 class="section-title">Meet Our Leadership</h2>
        <div class="team-grid">
            <div class="team-card">
                <div class="team-image">
                    <img src="images/kushan.jpg" alt="Kushan Thavidu">
                </div>
                <div class="team-details">
                    <h3 class="team-name">Kushan Thavidu</h3>
                    <p class="team-position">Founder and CEO</p>
                    <p class="team-bio">Founded Mega City Cab in 2015 with a vision to revolutionize urban transportation.</p>
                </div>
            </div>
            <div class="team-card">
                <div class="team-image">
                    <img src="images/missaka.jpg" alt="Shashith Missaka">
                </div>
                <div class="team-details">
                    <h3 class="team-name">Shashith Missaka</h3>
                    <p class="team-position">Chief Operations Officer</p>
                    <p class="team-bio">Oversees day-to-day operations and ensures service excellence across the fleet.</p>
                </div>
            </div>
            <div class="team-card">
                <div class="team-image">
                    <img src="images/pasindu.jpg" alt="Pasindu Nimsara">
                </div>
                <div class="team-details">
                    <h3 class="team-name">Pasindu Nimsara</h3>
                    <p class="team-position">Fleet Manager</p>
                    <p class="team-bio">Manages vehicle maintenance and upgrades to maintain our premium fleet standards.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="section testimonials">
        <h2 class="section-title">What Our Customers Say</h2>
        <div class="testimonial-container">
            <div class="testimonial-grid">
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "The most reliable cab service in the city. Always on time and their drivers are exceptionally professional."
                    </div>
                    <div class="testimonial-author">
                        <div class="author-image">
                            <img src="images/nipun.JPG" alt="Jennifer T.">
                        </div>
                        <div class="author-info">
                            <div class="author-name">Nipun Sandeepa</div>
                            <div class="author-title">Business Traveler</div>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card">
                    <div class="testimonial-text">
                        "As someone who relies on taxis daily, I can confidently say Mega City Cab offers the best experience in town."
                    </div>
                    <div class="testimonial-author">
                        <div class="author-image">
                            <img src="images/maheesha.JPG" alt="Robert K.">
                        </div>
                        <div class="author-info">
                            <div class="author-name">Maheesha Maduwantha</div>
                            <div class="author-title">Regular Customer</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="cta-content">
            <h2 class="cta-title">Ready to Ride with Us?</h2>
            <p class="cta-text">Join thousands of satisfied customers and experience the Mega City Cab difference today.</p>
            <div class="cta-buttons">
                <a href="login.jsp" class="cta-primary">Book a Ride</a>
                <a href="contact.jsp" class="cta-secondary">Contact Us</a>
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
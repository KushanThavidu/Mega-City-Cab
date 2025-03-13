<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Services</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f8f8f8;
            color: #333;
            line-height: 1.6;
        }

        /* Color Variables */
        :root {
            --primary: #FFB800;
            --dark: #2A2A2A;
            --light: #ffffff;
            --accent: #ffd000;
            --gray: #f0f0f0;
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
            background-color: var(--dark);
            color: var(--light);
            text-align: center;
            padding: 5rem 1rem;
            position: relative;
            overflow: hidden;
        }

        .hero-pattern {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: radial-gradient(var(--primary) 2px, transparent 2px);
            background-size: 30px 30px;
            opacity: 0.1;
        }

        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            font-weight: 800;
        }

        .hero-highlight {
            color: var(--primary);
        }

        .hero p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .btn {
            padding: 0.5rem 1.5rem;
            border-radius: 5px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .btn-outline {
            background-color: transparent;
            border: 2px solid var(--primary);
            color: var(--primary);
            margin-left: 1rem;
        }

        /* Services Section */
        .services {
            padding: 5rem 5%;
        }

        .section-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .section-title {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 4px;
            background-color: var(--primary);
            border-radius: 2px;
        }

        .section-subtitle {
            color: #666;
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto;
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .service-card {
            background-color: var(--light);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .service-image {
            height: 200px;
            background-color: var(--gray);
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .service-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .service-icon {
            font-size: 4rem;
            color: var(--dark);
        }

        .service-content {
            padding: 1.5rem;
        }

        .service-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--dark);
        }

        .service-description {
            color: #666;
            margin-bottom: 1.5rem;
        }

        .service-features {
            list-style: none;
            margin-bottom: 1.5rem;
        }

        .service-features li {
            margin-bottom: 0.5rem;
            position: relative;
            padding-left: 1.5rem;
        }

        .service-features li::before {
            content: '✓';
            position: absolute;
            left: 0;
            color: var(--primary);
            font-weight: bold;
        }

        .service-link {
            color: var(--dark);
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            transition: color 0.3s;
        }

        .service-link:hover {
            color: var(--accent);
        }

        .service-link-icon {
            margin-left: 5px;
            transition: transform 0.3s;
        }

        .service-link:hover .service-link-icon {
            transform: translateX(5px);
        }

        /* Testimonials */
        .testimonials {
            background-color: var(--dark);
            color: var(--light);
            padding: 5rem 5%;
            position: relative;
            overflow: hidden;
        }

        .testimonials .section-title {
            color: var(--light);
        }

        .testimonials .section-subtitle {
            color: #ccc;
        }

        .testimonial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .testimonial-card {
            background-color: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 2rem;
            border-left: 4px solid var(--primary);
            backdrop-filter: blur(10px);
        }

        .testimonial-quote {
            font-style: italic;
            margin-bottom: 1.5rem;
            line-height: 1.7;
        }

        .testimonial-author {
            display: flex;
            align-items: center;
        }

        .author-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--primary);
            margin-right: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: var(--dark);
        }

        .author-info h4 {
            margin-bottom: 0.2rem;
        }

        .author-info p {
            color: #ccc;
            font-size: 0.9rem;
        }

        /* App Download Section */
        .app-download {
            padding: 5rem 5%;
            background-color: var(--gray);
            text-align: center;
        }

        .app-container {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            max-width: 1000px;
            margin: 0 auto;
        }

        .app-content {
            flex: 1;
            min-width: 300px;
            text-align: left;
            padding: 2rem;
        }

        .app-title {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: var(--dark);
        }

        .app-description {
            margin-bottom: 2rem;
            color: #666;
        }

        .app-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .app-btn {
            display: inline-flex;
            align-items: center;
            background-color: var(--dark);
            color: var(--light);
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .app-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .app-btn-icon {
            font-size: 1.5rem;
            margin-right: 0.5rem;
        }

        .app-btn-text {
            text-align: left;
        }

        .app-btn-text small {
            display: block;
            font-size: 0.7rem;
            opacity: 0.8;
        }

        .app-btn-text span {
            font-weight: bold;
            font-size: 1.1rem;
        }

        .app-image {
            flex: 1;
            min-width: 300px;
            display: flex;
            justify-content: center;
        }

        .app-phone {
            height: 500px;
            max-width: 100%;
            object-fit: contain;
        }

        /* FAQ Section */
        .faq {
            padding: 5rem 5%;
        }

        .faq-container {
            max-width: 800px;
            margin: 0 auto;
        }

        .faq-item {
            margin-bottom: 1rem;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            background-color: var(--light);
        }

        .faq-question {
            padding: 1.5rem;
            background-color: var(--light);
            color: var(--dark);
            font-weight: 600;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: background-color 0.3s;
        }

        .faq-question:hover {
            background-color: #f9f9f9;
        }

        .faq-arrow {
            transition: transform 0.3s;
        }

        .faq-answer {
            padding: 0 1.5rem;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s, padding 0.3s;
            color: #666;
        }

        .faq-item.active .faq-answer {
            padding: 0 1.5rem 1.5rem;
            max-height: 500px;
        }

        .faq-item.active .faq-arrow {
            transform: rotate(180deg);
        }

        /* CTA Section */
        .cta {
            background-color: var(--primary);
            padding: 5rem 5%;
            text-align: center;
        }

        .cta-content {
            max-width: 700px;
            margin: 0 auto;
        }

        .cta-title {
            font-size: 2.5rem;
            color: var(--dark);
            margin-bottom: 1rem;
        }

        .cta-description {
            color: #555;
            margin-bottom: 2rem;
        }

        .cta-btn {
            background-color: var(--dark);
            color: var(--light);
            padding: 1rem 2.5rem;
            font-size: 1.1rem;
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
        @media (max-width: 768px) {
            .nav-links {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                flex-direction: column;
                background-color: var(--dark);
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

            .hero h1 {
                font-size: 2.5rem;
            }

            .btn-group {
                display: flex;
                flex-direction: column;
                gap: 1rem;
                align-items: center;
            }

            .btn-outline {
                margin-left: 0;
            }

            .app-content, .app-image {
                padding: 1rem;
            }

            .app-buttons {
                justify-content: center;
            }
        }

        @media (max-width: 480px) {
            .hero h1 {
                font-size: 2rem;
            }

            .section-title {
                font-size: 2rem;
            }

            .service-card {
                width: 100%;
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
                <a href="about.jsp" >About Us</a>
                <a href="services.jsp" class="active">Services</a>
                <a href="contact.jsp">Contact</a>
            </div>
            <div class="mobile-toggle">
                <i class="fas fa-bars"></i>
            </div>
            <div class="auth-buttons">
                <a href="login.jsp" class="btn btn-login">Login</a>
                <a href="register.jsp " class="btn btn-register">Register</a>
            </div>
        </nav>
    </header>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-pattern"></div>
        <div class="hero-content">
            <h1>Premium <span class="hero-highlight">Cab Services</span> for the Modern City</h1>
            <p>Experience safe, reliable, and comfortable transportation across the city with our professional drivers and premium fleet.</p>
            <div class="btn-group">
                <a href="login.jsp" class="btn btn-register">Book a Ride Now</a>
                <a href="index.jsp" class="btn btn-outline">Learn More</a>
            </div>
        </div>
    </section>

    <!-- Services Section -->
    <section class="services" id="services">
        <div class="section-header">
            <h2 class="section-title">Our Services</h2>
            <p class="section-subtitle">We offer a wide range of premium transportation solutions to meet all your travel needs within the city and beyond.</p>
        </div>
        <div class="services-grid">
            <!-- Service 1 -->
            <div class="service-card">
                <div class="service-image">
                    <div class="service-icon">🚗</div>
                </div>
                <div class="service-content">
                    <h3 class="service-title">Standard City Rides</h3>
                    <p class="service-description">Comfortable and affordable rides for your daily commute within the city limits.</p>
                    <ul class="service-features">
                        <li>Professional drivers</li>
                        <li>Air-conditioned vehicles</li>
                        <li>Cashless payment options</li>
                        <li>24/7 availability</li>
                    </ul>
                    <a href="services.jsp" class="service-link">
                        Learn More <span class="service-link-icon">→</span>
                    </a>
                </div>
            </div>

            <!-- Service 2 -->
            <div class="service-card">
                <div class="service-image">
                    <div class="service-icon">🚘</div>
                </div>
                <div class="service-content">
                    <h3 class="service-title">Premium Luxury Rides</h3>
                    <p class="service-description">Travel in style with our luxury fleet for special occasions or business meetings.</p>
                    <ul class="service-features">
                        <li>Luxury vehicles</li>
                        <li>Professionally trained chauffeurs</li>
                        <li>Complimentary refreshments</li>
                        <li>Red carpet service available</li>
                    </ul>
                    <a href="services.jsp" class="service-link">
                        Learn More <span class="service-link-icon">→</span>
                    </a>
                </div>
            </div>

            <!-- Service 3 -->
            <div class="service-card">
                <div class="service-image">
                    <div class="service-icon">🚐</div>
                </div>
                <div class="service-content">
                    <h3 class="service-title">Group Transportation</h3>
                    <p class="service-description">Perfect for group outings, corporate events, or airport transfers for teams.</p>
                    <ul class="service-features">
                        <li>Vehicles for 6-15 passengers</li>
                        <li>Luggage space</li>
                        <li>Corporate accounts available</li>
                        <li>Custom itineraries</li>
                    </ul>
                    <a href="services.jsp" class="service-link">
                        Learn More <span class="service-link-icon">→</span>
                    </a>
                </div>
            </div>

            <!-- Service 4 -->
            <div class="service-card">
                <div class="service-image">
                    <div class="service-icon">✈️</div>
                </div>
                <div class="service-content">
                    <h3 class="service-title">Airport Transfers</h3>
                    <p class="service-description">Reliable pickup and drop-off services for all your air travel needs.</p>
                    <ul class="service-features">
                        <li>Flight tracking</li>
                        <li>Meet and greet service</li>
                        <li>Assistance with luggage</li>
                        <li>Fixed competitive rates</li>
                    </ul>
                    <a href="services.jsp" class="service-link">
                        Learn More <span class="service-link-icon">→</span>
                    </a>
                </div>
            </div>

            <!-- Service 5 -->
            <div class="service-card">
                <div class="service-image">
                    <div class="service-icon">🏙️</div>
                </div>
                <div class="service-content">
                    <h3 class="service-title">City Tours</h3>
                    <p class="service-description">Explore the best of Mega City with our customized tour packages.</p>
                    <ul class="service-features">
                        <li>Knowledgeable local guides</li>
                        <li>Customizable itineraries</li>
                        <li>Popular attractions covered</li>
                        <li>Half-day and full-day options</li>
                    </ul>
                    <a href="services.jsp" class="service-link">
                        Learn More <span class="service-link-icon">→</span>
                    </a>
                </div>
            </div>

            <!-- Service 6 -->
            <div class="service-card">
                <div class="service-image">
                    <div class="service-icon">📆</div>
                </div>
                <div class="service-content">
                    <h3 class="service-title">Hourly Rentals</h3>
                    <p class="service-description">Rent a cab with driver by the hour for meetings, shopping, or errands.</p>
                    <ul class="service-features">
                        <li>Flexible booking options</li>
                        <li>Wait-and-return service</li>
                        <li>Multiple stops allowed</li>
                        <li>Cost-effective for multiple destinations</li>
                    </ul>
                    <a href="services.jsp" class="service-link">
                        Learn More <span class="service-link-icon">→</span>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonials">
        <div class="section-header">
            <h2 class="section-title">What Our Customers Say</h2>
            <p class="section-subtitle">Don't just take our word for it. See what our satisfied customers have to say about our services.</p>
        </div>
        <div class="testimonial-grid">
            <!-- Testimonial 1 -->
            <div class="testimonial-card">
                <p class="testimonial-quote">"I use Mega City Cab for my daily commute and couldn't be happier. The drivers are always on time, professional, and the cars are clean and comfortable. Highly recommend!"</p>
                <div class="testimonial-author">
                    <div class="author-avatar">SM</div>
                    <div class="author-info">
                        <h4>Sahan Madusanka</h4>
                        <p>Regular Customer</p>
                    </div>
                </div>
            </div>

            <!-- Testimonial 2 -->
            <div class="testimonial-card">
                <p class="testimonial-quote">"Their airport transfer service is exceptional. My flight was delayed by 2 hours, but my driver was still waiting for me with a smile. That's the kind of service that earns my loyalty."</p>
                <div class="testimonial-author">
                    <div class="author-avatar">UW</div>
                    <div class="author-info">
                        <h4>Udara Wickramasinghe</h4>
                        <p>Business Traveler</p>
                    </div>
                </div>
            </div>

            <!-- Testimonial 3 -->
            <div class="testimonial-card">
                <p class="testimonial-quote">"We booked the group transportation service for our company retreat, and everything was perfectly organized. The drivers were professional, and the vehicles were spacious and comfortable."</p>
                <div class="testimonial-author">
                    <div class="author-avatar">AI</div>
                    <div class="author-info">
                        <h4>Anuja Iman</h4>
                        <p>Corporate Client</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- App Download Section -->
    <section class="app-download">
        <div class="app-container">
            <div class="app-content">
                <h2 class="app-title">Download Our App</h2>
                <p class="app-description">Get the best cab experience with our mobile app. Book rides, track your driver, pay seamlessly, and earn rewards with every trip.</p>
                <div class="app-buttons">
                    <a href="services.jsp" class="app-btn">
                        <span class="app-btn-icon">🍎</span>
                        <div class="app-btn-text">
                            <small>Download on the</small>
                            <span>App Store</span>
                        </div>
                    </a>
                    <a href="services.jsp" class="app-btn">
                        <span class="app-btn-icon">🤖</span>
                        <div class="app-btn-text">
                            <small>GET IT ON</small>
                            <span>Google Play</span>
                        </div>
                    </a>
                </div>
            </div>
            <div class="app-image">
                <img src="images/app.jpg" alt="Mobile App Screenshot" class="app-phone">
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="faq">
        <div class="section-header">
            <h2 class="section-title">Frequently Asked Questions</h2>
            <p class="section-subtitle">Find answers to the most common questions about our services.</p>
        </div>
        <div class="faq-container">
            <!-- FAQ Item 1 -->
            <div class="faq-item">
                <div class="faq-question">
                    How do I book a ride?
                    <span class="faq-arrow">▼</span>
                </div>
                <div class="faq-answer">
                    <p>You can book a ride through our mobile app, website, or by calling our 24/7 customer service line. We recommend using the app for the fastest booking experience and to track your driver in real-time.</p>
                </div>
            </div>

            <!-- FAQ Item 2 -->
            <div class="faq-item">
                <div class="faq-question">
                    What payment methods do you accept?
                    <span class="faq-arrow">▼</span>
                </div>
                <div class="faq-answer">
                    <p>We accept cash, credit/debit cards, mobile wallets, and our own in-app wallet system. You can also set up a corporate account for business travel with monthly invoicing.</p>
                </div>
            </div>

            <!-- FAQ Item 3 -->
            <div class="faq-item">
                <div class="faq-question">
                    How do airport pickups work?
                    <span class="faq-arrow">▼</span>
                </div>
                <div class="faq-answer">
                    <p>When booking an airport pickup, please provide your flight details. We monitor your flight status and adjust your pickup time accordingly. Your driver will wait at the designated pickup area with a name sign, and we provide a complimentary 60-minute waiting time for international flights.</p>
                </div>
            </div>

            <!-- FAQ Item 4 -->
            <div class="faq-item">
                <div class="faq-question">
                    Can I book a ride in advance?
                    <span class="faq-arrow">▼</span>
                </div>
                <div class="faq-answer">
                    <p>We accept all major credit and debit cards, including Visa, MasterCard, and American Express. You can also pay via digital wallets like Apple Pay and Google Pay. Cash payments are accepted for in-person bookings only. </p>

                </div>
            </div>
        </div>
    </section>
    <!-- CTA Section -->
<section class="cta">
    <div class="cta-content">
        <h2 class="cta-title">Still Have Questions?</h2>
        <p class="cta-description">Our support team is available 24/7 to assist you with any inquiries or special requests.</p>
        <a href="contact.jsp" class="btn cta-btn">Contact Us</a>
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
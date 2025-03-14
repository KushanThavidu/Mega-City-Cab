<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help Center - Mega City Cab Service</title>
    <style>
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

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--off-white);
            color: var(--dark-black);
            line-height: 1.6;
        }

        header {
            background-color: var(--primary-yellow);
            padding: 1.5rem 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--dark-black);
            display: flex;
            align-items: center;
        }

        .logo span {
            display: inline-block;
            margin-right: 10px;
            font-size: 2rem;
        }

        .search-bar {
            width: 40%;
            position: relative;
        }

        .search-bar input {
            width: 100%;
            padding: 12px 20px;
            border-radius: 30px;
            border: none;
            background-color: var(--white);
            font-size: 1rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .search-bar input:focus {
            outline: none;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.15);
        }

        .search-bar button {
            position: absolute;
            right: 5px;
            top: 5px;
            background-color: var(--primary-yellow);
            border: none;
            border-radius: 50%;
            width: 34px;
            height: 34px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }

        .hero-section {
            background-color: var(--transparent-yellow);
            padding: 60px 0;
            text-align: center;
        }

        .hero-title {
            font-size: 2.5rem;
            color: var(--dark-black);
            margin-bottom: 16px;
        }

        .hero-subtitle {
            font-size: 1.2rem;
            color: var(--medium-black);
            max-width: 700px;
            margin: 0 auto 30px;
        }

        .search-categories {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
            margin-top: 30px;
        }

        .category-tag {
            background-color: var(--white);
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }

        .category-tag:hover {
            background-color: var(--primary-yellow);
            border-color: var(--dark-black);
        }

        .help-categories {
            padding: 60px 0;
        }

        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .category-card {
            background-color: var(--white);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        .card-icon {
            background-color: var(--transparent-yellow);
            height: 120px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 3rem;
        }

        .card-content {
            padding: 20px;
        }

        .card-title {
            font-size: 1.3rem;
            margin-bottom: 10px;
            color: var(--dark-black);
        }

        .card-description {
            color: var(--medium-black);
            margin-bottom: 20px;
        }

        .card-links {
            list-style: none;
        }

        .card-links li {
            margin-bottom: 10px;
        }

        .card-links a {
            color: var(--primary-yellow);
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .card-links a:hover {
            text-decoration: underline;
        }

        .faq-section {
            padding: 60px 0;
            background-color: var(--light-gray);
        }

        .section-title {
            font-size: 2rem;
            text-align: center;
            margin-bottom: 40px;
            color: var(--dark-black);
        }

        .accordion {
            max-width: 900px;
            margin: 0 auto;
        }

        .accordion-item {
            background-color: var(--white);
            border-radius: 8px;
            margin-bottom: 15px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .accordion-header {
            padding: 20px;
            background-color: var(--white);
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-weight: 600;
            border-bottom: 1px solid transparent;
            transition: all 0.3s ease;
        }

        .accordion-header:hover {
            background-color: var(--transparent-yellow);
        }

        .accordion-header.active {
            border-bottom-color: var(--medium-gray);
        }

        .accordion-content {
            padding: 0 20px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease, padding 0.3s ease;
        }

        .accordion-content.active {
            padding: 20px;
            max-height: 500px;
        }

        .contact-section {
            padding: 60px 0;
            text-align: center;
        }

        .contact-options {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            margin-top: 40px;
        }

        .contact-card {
            background-color: var(--white);
            padding: 30px;
            border-radius: 10px;
            width: 280px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: transform 0.3s ease;
        }

        .contact-card:hover {
            transform: translateY(-5px);
        }

        .contact-icon {
            width: 60px;
            height: 60px;
            background-color: var(--transparent-yellow);
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        .contact-title {
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .contact-info {
            color: var(--medium-black);
            margin-bottom: 20px;
        }

        .btn {
            background-color: var(--primary-yellow);
            color: var(--dark-black);
            padding: 12px 24px;
            border-radius: 30px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }

        .btn:hover {
            background-color: var(--secondary-yellow);
            border-color: var(--dark-black);
        }

        .app-banner {
            background-color: var(--dark-black);
            color: var(--white);
            padding: 60px 0;
            text-align: center;
        }

        .banner-content {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            gap: 30px;
        }

        .banner-text {
            flex: 1;
            min-width: 300px;
            text-align: left;
        }

        .banner-title {
            font-size: 2rem;
            margin-bottom: 15px;
        }

        .banner-description {
            margin-bottom: 25px;
            color: var(--medium-gray);
        }

        .app-buttons {
            display: flex;
            gap: 15px;
        }

        .app-button {
            background-color: var(--light-black);
            color: var(--white);
            display: flex;
            align-items: center;
            padding: 12px 20px;
            border-radius: 10px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .app-button:hover {
            background-color: var(--primary-yellow);
            color: var(--dark-black);
        }

        .app-icon {
            font-size: 1.8rem;
            margin-right: 10px;
        }

        .app-text {
            text-align: left;
        }

        .app-text small {
            display: block;
            font-size: 0.8rem;
        }

        .app-text strong {
            font-size: 1.1rem;
        }

        .banner-image {
            flex: 1;
            min-width: 300px;
            display: flex;
            justify-content: center;
        }

        .app-mockup {
            max-width: 100%;
            height: auto;
            max-height: 400px;
        }

        footer {
            background-color: var(--light-black);
            color: var(--white);
            padding: 40px 0 20px;
        }

        .footer-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 40px;
            margin-bottom: 40px;
        }

        .footer-column {
            flex: 1;
            min-width: 200px;
        }

        .footer-column h3 {
            font-size: 1.3rem;
            margin-bottom: 20px;
            color: var(--primary-yellow);
        }

        .footer-column ul {
            list-style: none;
        }

        .footer-column ul li {
            margin-bottom: 10px;
        }

        .footer-column a {
            color: var(--medium-gray);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-column a:hover {
            color: var(--primary-yellow);
        }

        .social-icons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .social-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--medium-black);
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 1.2rem;
            color: var(--white);
            transition: all 0.3s ease;
        }

        .social-icon:hover {
            background-color: var(--primary-yellow);
            color: var(--dark-black);
        }

        .copyright {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid var(--medium-black);
            color: var(--medium-gray);
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 15px;
            }

            .search-bar {
                width: 100%;
            }

            .banner-content {
                flex-direction: column;
                text-align: center;
            }

            .banner-text {
                text-align: center;
            }

            .app-buttons {
                justify-content: center;
            }

            .hero-title {
                font-size: 2rem;
            }

            .contact-options {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container header-content">
            <div class="logo">
                <span class="logo-icon">🚖</span> Mega City Cab
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Search for help topics...">
                <button>🔍</button>
            </div>
        </div>
    </header>

    <section class="hero-section">
        <div class="container">
            <h1 class="hero-title">How can we help you today?</h1>
            <p class="hero-subtitle">Find answers, guides, and support for all your Mega City Cab service needs.</p>
            <div class="search-categories">
                <div class="category-tag">Booking a Ride</div>
                <div class="category-tag">Payment Issues</div>
                <div class="category-tag">Account Management</div>
                <div class="category-tag">Driver Support</div>
                <div class="category-tag">Safety & Security</div>
            </div>
        </div>
    </section>

    <section class="help-categories">
        <div class="container">
            <h2 class="section-title">Browse Help Topics</h2>
            <div class="categories-grid">
                <div class="category-card">
                    <div class="card-icon">🚗</div>
                    <div class="card-content">
                        <h3 class="card-title">Booking a Ride</h3>
                        <p class="card-description">Learn how to book, modify, or cancel your ride with ease.</p>
                        <ul class="card-links">
                            <li><a href="#">How to book a cab ▸</a></li>
                            <li><a href="#">Scheduling rides in advance ▸</a></li>
                            <li><a href="#">Cancellation policy ▸</a></li>
                            <li><a href="#">Ride sharing options ▸</a></li>
                        </ul>
                    </div>
                </div>

                <div class="category-card">
                    <div class="card-icon">💰</div>
                    <div class="card-content">
                        <h3 class="card-title">Payments & Billing</h3>
                        <p class="card-description">Understand fare calculations and manage payment methods.</p>
                        <ul class="card-links">
                            <li><a href="#">Understanding fare estimates ▸</a></li>
                            <li><a href="#">Payment methods ▸</a></li>
                            <li><a href="#">Receipts and invoices ▸</a></li>
                            <li><a href="#">Resolving payment issues ▸</a></li>
                        </ul>
                    </div>
                </div>

                <div class="category-card">
                    <div class="card-icon">👤</div>
                    <div class="card-content">
                        <h3 class="card-title">Account Management</h3>
                        <p class="card-description">Manage your profile, preferences, and account settings.</p>
                        <ul class="card-links">
                            <li><a href="#">Creating or updating profile ▸</a></li>
                            <li><a href="#">Managing saved locations ▸</a></li>
                            <li><a href="#">Privacy settings ▸</a></li>
                            <li><a href="#">Deleting your account ▸</a></li>
                        </ul>
                    </div>
                </div>

                <div class="category-card">
                    <div class="card-icon">🚨</div>
                    <div class="card-content">
                        <h3 class="card-title">Safety & Security</h3>
                        <p class="card-description">Learn about our safety features and emergency protocols.</p>
                        <ul class="card-links">
                            <li><a href="#">Safety features explained ▸</a></li>
                            <li><a href="#">Emergency assistance ▸</a></li>
                            <li><a href="#">COVID-19 safety measures ▸</a></li>
                            <li><a href="#">Reporting incidents ▸</a></li>
                        </ul>
                    </div>
                </div>

                <div class="category-card">
                    <div class="card-icon">🏅</div>
                    <div class="card-content">
                        <h3 class="card-title">Rewards & Promotions</h3>
                        <p class="card-description">Make the most of discounts, loyalty programs, and referrals.</p>
                        <ul class="card-links">
                            <li><a href="#">Loyalty program details ▸</a></li>
                            <li><a href="#">Referral bonuses ▸</a></li>
                            <li><a href="#">Promo codes ▸</a></li>
                            <li><a href="#">Seasonal offers ▸</a></li>
                        </ul>
                    </div>
                </div>

                <div class="category-card">
                    <div class="card-icon">🔧</div>
                    <div class="card-content">
                        <h3 class="card-title">Troubleshooting</h3>
                        <p class="card-description">Resolve common issues with the app or service.</p>
                        <ul class="card-links">
                            <li><a href="#">App not working ▸</a></li>
                            <li><a href="#">GPS inaccuracy issues ▸</a></li>
                            <li><a href="#">Can't contact driver ▸</a></li>
                            <li><a href="#">Lost items ▸</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="faq-section">
        <div class="container">
            <h2 class="section-title">Frequently Asked Questions</h2>
            <div class="accordion">
                <div class="accordion-item">
                    <div class="accordion-header">
                        How do I book a ride?
                        <span>+</span>
                    </div>
                    <div class="accordion-content">
                        <p>Booking a ride with Mega City Cab is simple! Open the app, enter your destination, select your preferred ride type, and tap 'Book Now'. You can also schedule rides in advance by selecting the date and time before confirming your booking.</p>
                    </div>
                </div>

                <div class="accordion-item">
                    <div class="accordion-header">
                        What payment methods are accepted?
                        <span>+</span>
                    </div>
                    <div class="accordion-content">
                        <p>We accept various payment methods including credit/debit cards, digital wallets like Apple Pay and Google Pay, and cash payments in select locations. You can manage your payment methods in the Payment section of your app profile.</p>
                    </div>
                </div>

                <div class="accordion-item">
                    <div class="accordion-header">
                        How do I cancel a ride?
                        <span>+</span>
                    </div>
                    <div class="accordion-content">
                        <p>To cancel a ride, open the app and go to your current booking. Tap the 'Cancel Ride' button at the bottom of the screen. Please note that cancellation fees may apply depending on how much time has passed since booking or if the driver is already on their way.</p>
                    </div>
                </div>

                <div class="accordion-item">
                    <div class="accordion-header">
                        What if I left something in the cab?
                        <span>+</span>
                    </div>
                    <div class="accordion-content">
                        <p>If you've left an item in a Mega City Cab, don't worry! Go to 'Trip History' in the app, select the relevant trip, and tap 'Report Lost Item'. You can also contact our support team directly, and we'll help connect you with the driver to retrieve your belongings.</p>
                    </div>
                </div>

                <div class="accordion-item">
                    <div class="accordion-header">
                        How do I report an issue with my ride?
                        <span>+</span>
                    </div>
                    <div class="accordion-content">
                        <p>You can report issues through the app by going to 'Trip History', selecting the ride in question, and tapping 'Report an Issue'. Alternatively, reach out to our 24/7 customer support team via the Help section in the app or by calling our support hotline.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="contact-section">
        <div class="container">
            <h2 class="section-title">Need More Help?</h2>
            <div class="contact-options">
                <div class="contact-card">
                    <div class="contact-icon">📞</div>
                    <h3 class="contact-title">Call Support</h3>
                    <p class="contact-info">Our support team is available 24/7 to assist you with any questions or concerns.</p>
                    <a href="#" class="btn">Call Now</a>
                </div>

                <div class="contact-card">
                    <div class="contact-icon">💬</div>
                    <h3 class="contact-title">Live Chat</h3>
                    <p class="contact-info">Connect with a support agent instantly for real-time assistance.</p>
                    <a href="#" class="btn">Start Chat</a>
                </div>

                <div class="contact-card">
                    <div class="contact-icon">✉️</div>
                    <h3 class="contact-title">Email Support</h3>
                    <p class="contact-info">Send us a detailed email and we'll get back to you within 24 hours.</p>
                    <a href="#" class="btn">Email Us</a>
                </div>
            </div>
        </div>
    </section>

    <section class="app-banner">
        <div class="container banner-content">
            <div class="banner-text">
                <h2 class="banner-title">Get the Mega City Cab App</h2>
                <p class="banner-description">Download our app for a faster, more personalized experience. Book rides, track drivers, and manage payments with ease.</p>
                <div class="app-buttons">
                    <a href="#" class="app-button">
                        <div class="app-icon">📱</div>
                        <div class="app-text">
                            <small>Download on the</small>
                            <strong>App Store</strong>
                        </div>
                    </a>
                    <a href="#" class="app-button">
                        <div class="app-icon">🤖</div>
                        <div class="app-text">
                            <small>Get it on</small>
                            <strong>Google Play</strong>
                        </div>
                    </a>
                </div>
            </div>
            <div class="banner-image">
                <img src="images/app.jpg" alt="Mega City Cab App" class="app-mockup">
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-column">
                    <h3>Mega City Cab</h3>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Press</a></li>
                        <li><a href="#">Investor Relations</a></li>
                    </ul>
                </div>

                <div class="footer-column">
                    <h3>Products</h3>
                    <ul>
                        <li><a href="#">Ride</a></li>
                        <li><a href="#">Corporate Travel</a></li>
                        <li><a href="#">Delivery</a></li>
                        <li><a href="#">Events & Venues</a></li>
                        <li><a href="#">Business Solutions</a></li>
                    </ul>
                </div>

                <div class="footer-column">
                    <h3>Resources</h3>
                    <ul>
                        <li><a href="#">Safety Center</a></li>
                        <li><a href="#">Community Guidelines</a></li>
                        <li><a href="#">Accessibility</a></li>
                        <li><a href="#">Driver Requirements</a></li>
                        <li><a href="#">City Regulations</a></li>
                    </ul>
                </div>

                <div class="footer-column">
                    <h3>Connect With Us</h3>
                    <div class="social-icons">
                        <a href="#" class="social-icon">f</a>
                        <a href="#" class="social-icon">t</a>
                        <a href="#" class="social-icon">in</a>
                        <a href="#" class="social-icon">ig</a>
                    </div>
                </div>
            </div>

            <div class="copyright">
                <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script>
        // Toggle accordion content
        const accordionHeaders = document.querySelectorAll('.accordion-header');
        
        accordionHeaders.forEach(header => {
            header.addEventListener('click', () => {
                const content = header.nextElementSibling;
                
                // Close all other accordion items
                document.querySelectorAll('.accordion-content').forEach(item => {
                    if (item !== content) {
                        item.classList.remove('active');
                    }
                });
                
                document.querySelectorAll('.accordion-header').forEach(item => {
                    if (item !== header) {
                        item.classList.remove('active');
                        item.querySelector('span').textContent = '+';
                    }
                });
                
                // Toggle current accordion item
                header.classList.toggle('active');
                content.classList.toggle('active');
                
                // Change plus/minus sign
                const sign = header.querySelector('span');
                sign.textContent = content.classList.contains('active') ? '−' : '+';
            });
        });
        
        // Make category tags clickable
        const categoryTags = document.querySelectorAll('.category-tag');
        categoryTags.forEach(tag => {
            tag.addEventListener('click', () => {
                // Simulate search or navigation
                alert(`Navigating to ${tag.textContent} help section`);
            });
        });
    </script>
</body>
</html>
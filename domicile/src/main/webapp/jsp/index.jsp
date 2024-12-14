<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livraison à Domicile</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" 
          integrity="sha512-Fo3rlrQkTyUO8wOjYcq6kHseVD3jIkLgLk3kQ3CgExkWy1yR+5JXNIZ9MV5AEM5VwKlVjQ1YUBKAXd2FQfowkg==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* General Styles */
        body {
            font-family: 'Roboto', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .btn.primary {
            background-color: #00cc66;
            color: #fff;
            display: inline-block;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        .btn.primary:hover {
            background-color: #00994d;
        }
        .btn.login-btn {
            background-color: transparent;
            color: #333;
            border: 2px solid #333;
            margin-right: 10px;
        }
        .btn.login-btn:hover {
            background-color: #333;
            color: #fff;
        }
        .btn.signup-btn {
            background-color: #00cc66;
            color: #fff;
        }
        .btn.signup-btn:hover {
            background-color: #00994d;
        }

        /* Navbar */
        .navbar {
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .navbar-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .navbar-logo a {
            font-size: 1.5rem;
            font-weight: 700;
            color: #00cc66;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .navbar-links {
            list-style: none;
            display: flex;
            gap: 20px;
        }
        .navbar-links li a {
            font-size: 1rem;
            color: #333;
            transition: color 0.3s ease;
        }
        .navbar-links li a:hover {
            color: #00cc66;
        }
        .navbar-buttons {
		    display: flex; /* Flexbox for horizontal alignment */
		    align-items: center; /* Center align items vertically */
		    gap: 10px; /* Space between buttons */
		}
		        

        /* Hero Section */
        .hero {
    background: linear-gradient(rgba(0, 153, 76, 0.9), rgba(0, 153, 76, 0.9)), 
                url('../images/hero-bg.jpg') no-repeat center center/cover;
    color: #fff;
    padding: 100px 20px;
    text-align: center;
    position: relative;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3); /* Subtle shadow for depth */
}
        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }
        .hero h1 {
            font-size: 2.8rem;
            margin-bottom: 20px;
        }
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        /* Features Section */
        .features {
            padding: 60px 20px;
            background-color: #fff;
            text-align: center;
        }
        .features h2 {
            font-size: 2rem;
            margin-bottom: 40px;
            color: #333;
        }
        .features-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .feature {
            background-color: #f1f1f1;
            padding: 30px 20px;
            border-radius: 10px;
            transition: transform 0.3s ease, background-color 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        .feature:hover {
            transform: translateY(-10px);
            background-color: #e6ffee;
        }
        .feature i {
            color: #00cc66;
            margin-bottom: 20px;
        }
        .feature h3 {
            font-size: 1.5rem;
            margin-bottom: 15px;
        }
        .feature p {
            font-size: 1rem;
            color: #555;
        }

        /* Footer */
        footer {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
        }
        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            text-align: center;
        }
        .social-icons a {
            color: #fff;
            margin: 0 10px;
            font-size: 1.2rem;
            transition: color 0.3s ease;
        }
        .social-icons a:hover {
            color: #00cc66;
        }

        /* Responsive Adjustments */
        @media (max-width: 480px) {
            .hero h1 {
                font-size: 2rem;
            }
            .hero p {
                font-size: 1rem;
            }
            .features h2 {
                font-size: 1.5rem;
            }
            .feature h3 {
                font-size: 1.25rem;
            }
        }
        .sidebar-overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: none; /* Hidden by default */
        z-index: 999; /* Below the sidebar */
    }

    /* Auth Sidebar */
    .auth-sidebar {
        position: fixed;
        top: 0;
        right: -400px; /* Hidden off-screen */
        width: 400px;
        max-width: 100%;
        height: 100%;
        background-color: #fff;
        box-shadow: -2px 0 5px rgba(0,0,0,0.3);
        transition: right 0.3s ease;
        z-index: 1000;
        display: flex;
        flex-direction: column;
    }

    .auth-sidebar.open {
        right: 0; /* Slide in */
    }

    .sidebar-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 20px;
        border-bottom: 1px solid #ddd;
    }

    .sidebar-header h2 {
        margin: 0;
        font-size: 1.5rem;
    }

    .close-btn {
        background: none;
        border: none;
        font-size: 1.5rem;
        cursor: pointer;
    }

    .sidebar-content {
        padding: 20px;
        overflow-y: auto;
        flex: 1;
    }

    .auth-form {
        display: flex;
        flex-direction: column;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 5px;
        font-weight: 500;
    }

    .input-wrapper {
        position: relative;
    }

    .input-wrapper i {
        position: absolute;
        top: 50%;
        left: 10px;
        transform: translateY(-50%);
        color: #888;
    }

    .input-wrapper input {
        width: 100%;
        padding: 10px 10px 10px 35px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1rem;
    }

    .input-wrapper input.invalid {
        border-color: red;
    }

    .input-error {
        color: red;
        font-size: 0.875rem;
        display: none;
        margin-top: 5px;
    }

    .toggle-password {
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
        cursor: pointer;
        color: #888;
    }

    .toggle-form {
        margin-top: 10px;
        font-size: 0.9rem;
        text-align: center;
    }

    .toggle-form span {
        color: #00cc66;
        cursor: pointer;
        text-decoration: underline;
    }

    .social-login {
        margin-top: 20px;
        text-align: center;
    }

    .social-buttons {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-top: 10px;
    }

    .social-btn {
        flex: 1;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        color: #fff;
        font-size: 0.9rem;
    }

    .social-btn.facebook {
        background-color: #3b5998;
    }

    .social-btn.google {
        background-color: #db4437;
    }

    /* Responsive Adjustments for Sidebar */
    @media (max-width: 480px) {
        .auth-sidebar {
            width: 100%;
        }
    }
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="navbar-container">
                <div class="navbar-logo">
                    <a href="#">🚚 Livraison</a>
                </div>
                <ul class="navbar-links">
                    <li><a href="commandes?action=list">Commandes</a></li>
                    <li><a href="livreurs?action=list">Livreurs</a></li>
                    <li><a href="products?action=list">Produits</a></li>
                </ul>
                <div class="navbar-buttons">
				    <button class="btn login-btn" aria-haspopup="true" aria-controls="auth-sidebar">Login</button>
				    <button class="btn signup-btn" aria-haspopup="true" aria-controls="auth-sidebar">Signup</button>
				</div>
            </div>
        </nav>
    </header>

    <main>
        <section class="hero">
            <div class="hero-content">
                <h1>Bienvenue dans l'application Livraison à Domicile</h1>
                <p>Simplifiez vos livraisons avec notre service intuitif.</p>
                <a href="#" class="btn primary">Commencer</a>
            </div>
        </section>

        <section class="features">
            <h2>Nos Fonctionnalités</h2>
            <div class="features-container">
                <div class="feature">
                    <i class="fas fa-shopping-cart fa-3x"></i>
                    <h3>Commandes Faciles</h3>
                    <p>Gérez vos commandes en toute simplicité.</p>
                </div>
                <div class="feature">
                    <i class="fas fa-motorcycle fa-3x"></i>
                    <h3>Gestion des Livreurs</h3>
                    <p>Les livreurs peuvent accepter ou refuser des missions.</p>
                </div>
                <div class="feature">
                    <i class="fas fa-boxes fa-3x"></i>
                    <h3>Produits Disponibles</h3>
                    <p>Parcourez une large gamme de produits.</p>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <div class="footer-container">
            <p>© 2024 Livraison à Domicile - Tous droits réservés.</p>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </footer>
    <div id="sidebar-overlay" class="sidebar-overlay" aria-hidden="true"></div>

    <!-- Sidebar for Login and Signup -->
    <aside id="auth-sidebar" class="auth-sidebar" aria-hidden="true" aria-labelledby="sidebar-title" role="dialog" aria-modal="true">
        <div class="sidebar-header">
            <h2 id="sidebar-title">Login</h2>
            <button id="sidebar-close" class="close-btn" aria-label="Close Sidebar">&times;</button>
        </div>
        <div class="sidebar-content">
            <!-- Livraison SVG Animation -->
            <!-- <div class="sidebar-svg">
                Enhanced Minimalist Livraison SVG with Road and Sun
                <svg id="delivery-truck" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    Sun
                    <circle cx="450" cy="70" r="40" fill="#FFD700" class="sun"/>
                    <g class="sun-rays">
                        <line x1="450" y1="10" x2="450" y2="30" stroke="#FFD700" stroke-width="5"/>
                        <line x1="450" y1="110" x2="450" y2="130" stroke="#FFD700" stroke-width="5"/>
                        <line x1="390" y1="70" x2="370" y2="70" stroke="#FFD700" stroke-width="5"/>
                        <line x1="510" y1="70" x2="490" y2="70" stroke="#FFD700" stroke-width="5"/>
                        <line x1="420" y1="20" x2="400" y2="40" stroke="#FFD700" stroke-width="5"/>
                        <line x1="480" y1="120" x2="460" y2="140" stroke="#FFD700" stroke-width="5"/>
                        <line x1="380" y1="120" x2="360" y2="140" stroke="#FFD700" stroke-width="5"/>
                        <line x1="520" y1="20" x2="500" y2="40" stroke="#FFD700" stroke-width="5"/>
                        <line x1="380" y1="20" x2="360" y2="40" stroke="#FFD700" stroke-width="5"/>
                    </g>
                    
                    Road
                    <rect x="0" y="420" width="512" height="92" fill="#555"/>
                    <div class="road-lines">
                        <rect x="0" y="470" width="512" height="4" fill="#fff" opacity="0.6"/>
                        <rect x="0" y="480" width="512" height="4" fill="#fff" opacity="0.6"/>
                        <rect x="0" y="490" width="512" height="4" fill="#fff" opacity="0.6"/>
                    </div>
                    
                    Truck Body
                    <rect x="50" y="300" width="300" height="100" fill="#ff7f50" rx="10" ry="10"/>
                    Truck Cabin
                    <rect x="320" y="270" width="130" height="80" fill="#ff5722" rx="10" ry="10"/>
                    Windows
                    <rect x="350" y="290" width="30" height="30" fill="#fff"/>
                    <rect x="410" y="290" width="30" height="30" fill="#fff"/>
                    Wheels
                    <circle cx="150" cy="410" r="20" fill="#333" class="wheel"/>
                    <circle cx="350" cy="410" r="20" fill="#333" class="wheel"/>
                    Truck Logo
                    <text x="70" y="350" font-family="Arial, sans-serif" font-size="20" fill="#fff">Livraison</text>
                </svg>
            </div> -->

            <!-- Login Form -->
            <form id="login-form" class="auth-form" novalidate>
                <div class="form-group">
                    <label for="login-email">Email</label>
                    <div class="input-wrapper">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="login-email" name="email" placeholder="Entrez votre email" required>
                        <span class="input-error" id="login-email-error">Veuillez entrer un email valide.</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="login-password">Mot de passe</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="login-password" name="password" placeholder="Entrez votre mot de passe" required>
                        <span class="input-error" id="login-password-error">Veuillez entrer votre mot de passe.</span>
                        <i class="fas fa-eye toggle-password" data-target="login-password"></i>
                    </div>
                </div>
                <button type="submit" class="btn primary">Login</button>
                <p class="toggle-form">Pas encore de compte? <span id="show-signup">Inscrivez-vous</span></p>
                <div class="social-login">
                    <p>Ou connectez-vous avec</p>
                    <div class="social-buttons">
                        <button type="button" class="btn social-btn facebook"><i class="fab fa-facebook-f"></i> Facebook</button>
                        <button type="button" class="btn social-btn google"><i class="fab fa-google"></i> Google</button>
                    </div>
                </div>
            </form>

            <!-- Signup Form -->
            <form id="signup-form" class="auth-form" style="display: none;" novalidate>
                <div class="form-group">
                    <label for="signup-name">Nom</label>
                    <div class="input-wrapper">
                        <i class="fas fa-user"></i>
                        <input type="text" id="signup-name" name="name" placeholder="Entrez votre nom" required>
                        <span class="input-error" id="signup-name-error">Veuillez entrer votre nom.</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="signup-email">Email</label>
                    <div class="input-wrapper">
                        <i class="fas fa-envelope"></i>
                        <input type="email" id="signup-email" name="email" placeholder="Entrez votre email" required>
                        <span class="input-error" id="signup-email-error">Veuillez entrer un email valide.</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="signup-password">Mot de passe</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="signup-password" name="password" placeholder="Entrez votre mot de passe" required>
                        <span class="input-error" id="signup-password-error">Veuillez entrer un mot de passe.</span>
                        <i class="fas fa-eye toggle-password" data-target="signup-password"></i>
                    </div>
                </div>
                <div class="form-group">
                    <label for="signup-confirm-password">Confirmez le mot de passe</label>
                    <div class="input-wrapper">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="signup-confirm-password" name="confirm-password" placeholder="Confirmez votre mot de passe" required>
                        <span class="input-error" id="signup-confirm-password-error">Les mots de passe ne correspondent pas.</span>
                        <i class="fas fa-eye toggle-password" data-target="signup-confirm-password"></i>
                    </div>
                </div>
                <button type="submit" class="btn primary">Signup</button>
                <p class="toggle-form">Déjà un compte? <span id="show-login">Connectez-vous</span></p>
                <div class="social-login">
                    <p>Ou inscrivez-vous avec</p>
                    <div class="social-buttons">
                        <button type="button" class="btn social-btn facebook"><i class="fab fa-facebook-f"></i> Facebook</button>
                        <button type="button" class="btn social-btn google"><i class="fab fa-google"></i> Google</button>
                    </div>
                </div>
            </form>
        </div>
    </aside>

    <!-- JavaScript for Sidebar Functionality and Form Validation -->
    <script>
        // Get Elements
        const loginBtn = document.querySelector('.login-btn');
        const signupBtn = document.querySelector('.signup-btn');
        const sidebar = document.getElementById('auth-sidebar');
        const sidebarOverlay = document.getElementById('sidebar-overlay');
        const sidebarClose = document.getElementById('sidebar-close');
        const showSignup = document.getElementById('show-signup');
        const showLogin = document.getElementById('show-login');
        const loginForm = document.getElementById('login-form');
        const signupForm = document.getElementById('signup-form');
        const sidebarTitle = document.getElementById('sidebar-title');
        const togglePasswords = document.querySelectorAll('.toggle-password');
        const deliveryTruck = document.getElementById('delivery-truck');

        // Function to open the sidebar
        function openSidebar(formType) {
            sidebar.classList.add('open');
            sidebarOverlay.style.display = 'block';
            sidebar.setAttribute('aria-hidden', 'false');
            sidebarOverlay.setAttribute('aria-hidden', 'false');
            if (formType === 'login') {
                loginForm.style.display = 'block';
                signupForm.style.display = 'none';
                sidebarTitle.textContent = 'Login';
                deliveryTruck.classList.add('animate-truck');
            } else if (formType === 'signup') {
                signupForm.style.display = 'block';
                loginForm.style.display = 'none';
                sidebarTitle.textContent = 'Signup';
                deliveryTruck.classList.add('animate-truck');
            }
            document.body.style.overflow = 'hidden'; // Prevent background scrolling
        }

        // Function to close the sidebar
        function closeSidebar() {
            sidebar.classList.remove('open');
            sidebarOverlay.style.display = 'none';
            sidebar.setAttribute('aria-hidden', 'true');
            sidebarOverlay.setAttribute('aria-hidden', 'true');
            document.body.style.overflow = 'auto'; // Restore background scrolling
            deliveryTruck.classList.remove('animate-truck');
        }

        // Event Listeners to open sidebar
        loginBtn.addEventListener('click', () => openSidebar('login'));
        signupBtn.addEventListener('click', () => openSidebar('signup'));

        // Event Listener to close sidebar
        sidebarClose.addEventListener('click', closeSidebar);
        sidebarOverlay.addEventListener('click', closeSidebar);

        // Event Listeners to toggle forms
        showSignup.addEventListener('click', () => openSidebar('signup'));
        showLogin.addEventListener('click', () => openSidebar('login'));

        // Toggle Password Visibility
        togglePasswords.forEach(toggle => {
            toggle.addEventListener('click', () => {
                const targetId = toggle.getAttribute('data-target');
                const targetInput = document.getElementById(targetId);
                if (targetInput.type === 'password') {
                    targetInput.type = 'text';
                    toggle.classList.remove('fa-eye');
                    toggle.classList.add('fa-eye-slash');
                } else {
                    targetInput.type = 'password';
                    toggle.classList.remove('fa-eye-slash');
                    toggle.classList.add('fa-eye');
                }
            });
        });

        // Form Validation
        function validateForm(form) {
            const inputs = form.querySelectorAll('input');
            let valid = true;

            inputs.forEach(input => {
                const errorSpan = document.getElementById(${input.id}-error);
                if (!input.checkValidity()) {
                    errorSpan.style.display = 'block';
                    input.classList.add('invalid');
                    valid = false;
                } else {
                    errorSpan.style.display = 'none';
                    input.classList.remove('invalid');
                }

                // Additional check for password confirmation in signup form
                if (form.id === 'signup-form' && input.id === 'signup-confirm-password') {
                    const password = document.getElementById('signup-password').value;
                    const confirmPassword = input.value;
                    if (password !== confirmPassword) {
                        errorSpan.textContent = 'Les mots de passe ne correspondent pas.';
                        errorSpan.style.display = 'block';
                        input.classList.add('invalid');
                        valid = false;
                    } else {
                        errorSpan.textContent = 'Veuillez entrer un mot de passe.';
                        errorSpan.style.display = 'none';
                        input.classList.remove('invalid');
                    }
                }
            });

            return valid;
        }

        // Handle Login Form Submission
        loginForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (validateForm(loginForm)) {
                // Implement your login logic here
                alert('Login réussi!');
                closeSidebar();
            }
        });

        // Handle Signup Form Submission
        signupForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (validateForm(signupForm)) {
                // Implement your signup logic here
                alert('Signup réussi!');
                closeSidebar();
            }
        });

        // Close sidebar with Escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && sidebar.classList.contains('open')) {
                closeSidebar();
            }
        });
    </script>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Livraison à Domicile</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" 
          integrity="sha512-Fo3rlrQkTyUO8wOjYcq6kHseVD3jIkLgLk3kQ3CgExkWy1yR+5JXNIZ9MV5AEM5VwKlVjQ1YUBKAXd2FQfowkg==" 
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .btn.primary {
            background-color: #00cc66;
            color: #fff;
            display: inline-block;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        .btn.primary:hover {
            background-color: #00994d;
        }
        .btn.login-btn {
            background-color: transparent;
            color: #333;
            border: 2px solid #333;
            margin-right: 10px;
        }
        .btn.login-btn:hover {
            background-color: #333;
            color: #fff;
        }
        .btn.signup-btn {
            background-color: #00cc66;
            color: #fff;
        }
        .btn.signup-btn:hover {
            background-color: #00994d;
        }
        .navbar {
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .navbar-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .navbar-logo a {
            font-size: 1.5rem;
            font-weight: 700;
            color: #00cc66;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        .navbar-links {
            list-style: none;
            display: flex;
            gap: 20px;
        }
        .navbar-links li a {
            font-size: 1rem;
            color: #333;
            transition: color 0.3s ease;
        }
        .navbar-links li a:hover {
            color: #00cc66;
        }
        .navbar-buttons {
            display: flex;
            align-items: center; 
            gap: 10px; 
        }

        .hero {
            background: linear-gradient(rgba(0, 153, 76, 0.9), rgba(0, 153, 76, 0.9)), 
                        url('../images/hero-bg.jpg') no-repeat center center/cover;
            color: #fff;
            padding: 100px 20px;
            text-align: center;
            position: relative;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3); 
        }
        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            z-index: 1;
        }
        .hero h1 {
            font-size: 2.8rem;
            margin-bottom: 20px;
        }
        .hero p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        .features {
            padding: 60px 20px;
            background-color: #fff;
            text-align: center;
        }
        .features h2 {
            font-size: 2rem;
            margin-bottom: 40px;
            color: #333;
        }
        .features-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .feature {
            background-color: #f1f1f1;
            padding: 30px 20px;
            border-radius: 10px;
            transition: transform 0.3s ease, background-color 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        .feature:hover {
            transform: translateY(-10px);
            background-color: #e6ffee;
        }
        .feature i {
            color: #00cc66;
            margin-bottom: 20px;
        }
        .feature h3 {
            font-size: 1.5rem;
            margin-bottom: 15px;
        }
        .feature p {
            font-size: 1rem;
            color: #555;
        }
        footer {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
        }
        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            text-align: center;
        }
        .social-icons a {
            color: #fff;
            margin: 0 10px;
            font-size: 1.2rem;
            transition: color 0.3s ease;
        }
        .social-icons a:hover {
            color: #00cc66;
        }
        .sidebar-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none; 
            z-index: 999; 
        }

        .auth-sidebar {
            position: fixed;
            top: 0;
            right: -400px; 
            width: 400px;
            max-width: 100%;
            height: 100%;
            background-color: #fff;
            box-shadow: -2px 0 5px rgba(0,0,0,0.3);
            transition: right 0.3s ease;
            z-index: 1000;
            display: flex;
            flex-direction: column;
        }

        .auth-sidebar.open {
            right: 0; 
        }

        .sidebar-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #ddd;
        }

        .sidebar-header h2 {
            margin: 0;
            font-size: 1.5rem;
        }

        .close-btn {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
        }

        .sidebar-content {
            padding: 20px;
            overflow-y: auto;
            flex: 1;
        }

        .auth-form {
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: #888;
        }

        .input-wrapper input {
            width: 100%;
            padding: 10px 10px 10px 35px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .input-wrapper input.invalid {
            border-color: red;
        }

        .input-error {
            color: red;
            font-size: 0.875rem;
            display: none;
            margin-top: 5px;
        }

        .toggle-password {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #888;
        }

        .toggle-form {
            margin-top: 10px;
            font-size: 0.9rem;
            text-align: center;
        }

        .toggle-form span {
            color: #00cc66;
            cursor: pointer;
            text-decoration: underline;
        }

        .social-login {
            margin-top: 20px;
            text-align: center;
        }

        .social-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
        }

        .social-btn {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
            font-size: 0.9rem;
        }

        .social-btn.facebook {
            background-color: #3b5998;
        }

        .social-btn.google {
            background-color: #db4437;
        }

       
        @media (max-width: 480px) {
            .auth-sidebar {
                width: 100%;
            }
            .hero {
                padding: 60px 20px;
            }
        }

        .social-btn i {
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <div class="navbar-container">
                <div class="navbar-logo">
                    <a href="#">🚚 Livraison</a>
                </div>
                <ul class="navbar-links">
                    <li><a href="commandes?action=list">Commandes</a></li>
                    <li><a href="livreurs?action=list">Livreurs</a></li>
                    <li><a href="products?action=list">Produits</a></li>
                </ul>
                <div class="navbar-buttons">
                    <button class="btn login-btn" aria-haspopup="true" aria-controls="auth-sidebar">Login</button>
                    <button class="btn signup-btn" aria-haspopup="true" aria-controls="auth-sidebar">Signup</button>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <section class="hero">
            <div class="hero-content">
                <h1>Bienvenue dans l'application Livraison à Domicile</h1>
                <p>Simplifiez vos livraisons avec notre service intuitif.</p>
                <a href="#" class="btn primary">Commencer</a>
            </div>
        </section>

        <section class="features">
            <h2>Nos Fonctionnalités</h2>
            <div class="features-container">
                <div class="feature">
                    <i class="fas fa-shopping-cart fa-3x"></i>
                    <h3>Commandes Faciles</h3>
                    <p>Gérez vos commandes en toute simplicité.</p>
                </div>
                <div class="feature">
                    <i class="fas fa-motorcycle fa-3x"></i>
                    <h3>Gestion des Livreurs</h3>
                    <p>Les livreurs peuvent accepter ou refuser des missions.</p>
                </div>
                <div class="feature">
                    <i class="fas fa-boxes fa-3x"></i>
                    <h3>Produits Disponibles</h3>
                    <p>Parcourez une large gamme de produits.</p>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <div class="footer-container">
            <p>© 2024 Livraison à Domicile - Tous droits réservés.</p>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </footer>

    <div id="sidebar-overlay" class="sidebar-overlay" aria-hidden="true"></div>

    <aside id="auth-sidebar" class="auth-sidebar" aria-hidden="true" aria-labelledby="sidebar-title" role="dialog" aria-modal="true">
        <div class="sidebar-header">
            <h2 id="sidebar-title">Login</h2>
            <button id="sidebar-close" class="close-btn" aria-label="Close Sidebar">&times;</button>
        </div>
        <div class="sidebar-content">
            <form id="login-form" class="auth-form" action="AuthServlet" method="post" novalidate>
    <div class="form-group">
        <label for="login-email">Email</label>
        <div class="input-wrapper">
            <i class="fas fa-envelope"></i>
            <input type="email" id="login-email" name="email" placeholder="Entrez votre email" required>
            <span class="input-error" id="login-email-error">Veuillez entrer un email valide.</span>
        </div>
    </div>
    <div class="form-group">
        <label for="login-password">Mot de passe</label>
        <div class="input-wrapper">
            <i class="fas fa-lock"></i>
            <input type="password" id="login-password" name="password" placeholder="Entrez votre mot de passe" required>
            <span class="input-error" id="login-password-error">Veuillez entrer votre mot de passe.</span>
        </div>
    </div>
    <button type="submit" class="btn primary">Login</button>
</form>


            <!-- Signup Form -->
            <form id="signup-form" class="auth-form" action="SignupServlet" method="post" style="display: none;" novalidate>
    <div class="form-group">
        <label for="signup-name">Nom</label>
        <div class="input-wrapper">
            <i class="fas fa-user"></i>
            <input type="text" id="signup-name" name="name" placeholder="Entrez votre nom" required>
            <span class="input-error" id="signup-name-error">Veuillez entrer votre nom.</span>
        </div>
    </div>
    <div class="form-group">
        <label for="signup-email">Email</label>
        <div class="input-wrapper">
            <i class="fas fa-envelope"></i>
            <input type="email" id="signup-email" name="email" placeholder="Entrez votre email" required>
            <span class="input-error" id="signup-email-error">Veuillez entrer un email valide.</span>
        </div>
    </div>
    <div class="form-group">
        <label for="signup-phone">Téléphone</label>
        <div class="input-wrapper">
            <i class="fas fa-phone"></i>
            <input type="text" id="signup-phone" name="phone" placeholder="Entrez votre téléphone" required>
            <span class="input-error" id="signup-phone-error">Veuillez entrer votre téléphone.</span>
        </div>
    </div>
    <div class="form-group">
        <label for="signup-password">Mot de passe</label>
        <div class="input-wrapper">
            <i class="fas fa-lock"></i>
            <input type="password" id="signup-password" name="password" placeholder="Entrez votre mot de passe" required>
            <span class="input-error" id="signup-password-error">Veuillez entrer un mot de passe.</span>
        </div>
    </div>
    <button type="submit" class="btn primary">Signup</button>
</form>
            
        </div>
    </aside>

    <script>
        const loginBtn = document.querySelector('.login-btn');
        const signupBtn = document.querySelector('.signup-btn');
        const sidebar = document.getElementById('auth-sidebar');
        const sidebarOverlay = document.getElementById('sidebar-overlay');
        const sidebarClose = document.getElementById('sidebar-close');
        const showSignup = document.getElementById('show-signup');
        const showLogin = document.getElementById('show-login');
        const loginForm = document.getElementById('login-form');
        const signupForm = document.getElementById('signup-form');
        const sidebarTitle = document.getElementById('sidebar-title');
        const togglePasswords = document.querySelectorAll('.toggle-password');

        function openSidebar(formType) {
            sidebar.classList.add('open');
            sidebarOverlay.style.display = 'block';
            sidebar.setAttribute('aria-hidden', 'false');
            sidebarOverlay.setAttribute('aria-hidden', 'false');

            if (formType === 'login') {
                loginForm.style.display = 'block';
                signupForm.style.display = 'none';
                sidebarTitle.textContent = 'Login';
            } else if (formType === 'signup') {
                signupForm.style.display = 'block';
                loginForm.style.display = 'none';
                sidebarTitle.textContent = 'Signup';
            }

            document.body.style.overflow = 'hidden'; 
        }

        function closeSidebar() {
            sidebar.classList.remove('open');
            sidebarOverlay.style.display = 'none';
            sidebar.setAttribute('aria-hidden', 'true');
            sidebarOverlay.setAttribute('aria-hidden', 'true');
            document.body.style.overflow = 'auto'; 
        }

        loginBtn.addEventListener('click', () => openSidebar('login'));
        signupBtn.addEventListener('click', () => openSidebar('signup'));

        sidebarClose.addEventListener('click', closeSidebar);
        sidebarOverlay.addEventListener('click', closeSidebar);

        showSignup.addEventListener('click', () => openSidebar('signup'));
        showLogin.addEventListener('click', () => openSidebar('login'));

        togglePasswords.forEach(toggle => {
            toggle.addEventListener('click', () => {
                const targetId = toggle.getAttribute('data-target');
                const targetInput = document.getElementById(targetId);
                if (targetInput.type === 'password') {
                    targetInput.type = 'text';
                    toggle.classList.remove('fa-eye');
                    toggle.classList.add('fa-eye-slash');
                } else {
                    targetInput.type = 'password';
                    toggle.classList.remove('fa-eye-slash');
                    toggle.classList.add('fa-eye');
                }
            });
        });

        function validateForm(form) {
            const inputs = form.querySelectorAll('input');
            let valid = true;

            inputs.forEach(input => {
                const errorSpan = document.getElementById(`${input.id}-error`);
                if (!input.checkValidity()) {
                    errorSpan.style.display = 'block';
                    input.classList.add('invalid');
                    valid = false;
                } else {
                    if (form.id === 'signup-form' && input.id === 'signup-confirm-password') {
                        const password = document.getElementById('signup-password').value;
                        const confirmPassword = input.value;
                        if (password !== confirmPassword) {
                            errorSpan.textContent = 'Les mots de passe ne correspondent pas.';
                            errorSpan.style.display = 'block';
                            input.classList.add('invalid');
                            valid = false;
                        } else {
                            errorSpan.textContent = 'Veuillez entrer un mot de passe.';
                            errorSpan.style.display = 'none';
                            input.classList.remove('invalid');
                        }
                    } else {
                        errorSpan.style.display = 'none';
                        input.classList.remove('invalid');
                    }
                }
            });

            return valid;
        }

        loginForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (validateForm(loginForm)) {
                alert('Login réussi!');
                closeSidebar();
            }
        });
        signupForm.addEventListener('submit', (e) => {
            e.preventDefault();
            if (validateForm(signupForm)) {
                alert('Signup réussi!');
                closeSidebar();
            }
        });

        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && sidebar.classList.contains('open')) {
                closeSidebar();
            }
        });
    </script>
</body>
</html>

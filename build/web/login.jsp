<%-- 
    Document   : login
    Created on : 17 Feb, 2022, 10:46:55 PM
    Author     : Chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="theme-color" content="#ff7300" />
  <title>User-login</title>
  <link rel="stylesheet" href="css/main.css" />
  <link rel="stylesheet" href="css/login.css" />
  <link rel="icon" href="media/icon.png" type="image/icon type" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body onload="load()">
  <div id="loading"><i class="fas fa-viruses"></i>Loading...</div>
  <a href="#top" id="scrollup"><i class="fas fa-chevron-up"></i></a>
  <header>
    <div class="logo"><i class="fas fa-viruses"></i> Covid-India</div>
    <span onclick="open_nav()" class="nav-toggle-open">&#9776;</span>
    <nav id="Sidenav">
      <ul>
        <li>
          <span onclick="close_nav()" class="nav-toggle-close">&times;</span>
        </li>
        <li>
          <button id="toggle-theme-button"><i class="fas fa-sun"></i></button>
        </li>
        <li>
          <a href="index.html">Home</a>
        </li>
        <li>
          <a href="signup.jsp">Sign-up</a>
        </li>
        <li>
          <a href="login.jsp" class="active">Login </a><i class="fas fa-arrow-right"></i>
        </li>
      </ul>
    </nav>
  </header>
  <div id="scrollbar"></div>

  <div class="form-bg login-form">
    <div class="form-title">Login</div>
    <form action="userLoginServlet" method="post">
      <input type="email" name="email" placeholder="Enter Email" required />
      <input type="password" name="password" placeholder="Enter Password" required />
      <input type="submit" value="Login" id="log-button" />
    </form>
    <b class="noAC">
      Don't have an Account?
      <a href="signup.jsp">Sign up <i class="fas fa-arrow-right"></i></a>
    </b>
  </div>
  <footer>
    <div class="copyright">
      Copyright &copy; Covid-India | 2021-<span id="year">00</span>
    </div>
    <div class="links">
      <a href="https://github.com/Chetan-KK/"><i class="fab fa-github"></i></a>
      <a href="https://www.linkedin.com/in/chetan-khulage-846655206/"><i class="fab fa-linkedin"></i></a>
      <a href="https://stackoverflow.com/users/16987115/chetan-khulage"><i class="fab fa-stack-overflow"></i></a>
      <a href="https://twitter.com/chetan_khulage"><i class="fab fa-twitter"></i></a>
    </div>
  </footer>
</body>
<script src="js/main.js"></script>

</html>
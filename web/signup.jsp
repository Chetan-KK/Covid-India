<%-- 
    Document   : signup
    Created on : 17 Feb, 2022, 10:46:10 PM
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
  <title>User-signup</title>
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
          <a href="signup.jsp" class="active">Sign-up</a>
        </li>
        <li>
          <a href="login.jsp">Login </a><i class="fas fa-arrow-right"></i>
        </li>
      </ul>
    </nav>
  </header>
  <div id="scrollbar"></div>

  <div class="form-bg">
    <div class="form-title">Signup</div>
    <form action="userSignupServlet" method="post">
      <input type="text" name="full_name" placeholder="Enter Your full Name" required />
      <input type="number" name="mobile_no" minlength="10" class="inputNumber" placeholder="Enter mobile number" required />
      <input type="email" name="email" placeholder="Enter Email-id" required />
      <input type="password" name="password" minlength="6" placeholder="Create new Password" required />
      <select name="dose_status" id="doses" required>
        <option value="0">Did't take any Dose</option>
        <option value="1">First Dose Completed</option>
        <option value="2">Second Dose Completed</option>
      </select>
      <select name="dose_type" id="doseType" required disabled>
        <option value="Covishield">Covishield</option>
        <option value="Covaxin">Covaxin</option>
      </select>
      <div class="dosesDate">
        <label for="dose1Date">&#8681; Enter Date of First Dose &#8681;</label>
        <input type="date" name="first_dose_date" class="dose1 inputDate">
        <br> <label for="dose2Date">&#8681; Enter Date of Second Dose &#8681;</label>
        <input type="date" name="second_dose_date" class="dose2 inputDate">
      </div>
      <input type="text" name="test_completed" value="false" hidden="hidden">

      <input type="submit" value="Sign-up" id="log-button" />
    </form>
    <b class="noAC">
      Have an Account?
      <a href="login.jsp">Login <i class="fas fa-arrow-right"></i></a>
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
<script src="js/signup.js"></script>


</html>
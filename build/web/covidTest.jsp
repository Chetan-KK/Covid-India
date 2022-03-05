<%-- 
    Document   : covidTest
    Created on : 3 Mar, 2022, 9:11:05 PM
    Author     : Chetan
--%>

<%@page import="com.users.dao.userDao"%>
<%@page import="com.users.model.userModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="theme-color" content="#ff7300" />
    <title>Covid-Test Home</title>
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/covidTest.css" />
    <link rel="icon" href="media/icon.png" type="image/icon type" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
        integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body onload="load()">
    <%
            
            long ids = Long.parseLong(request.getParameter("id"));
            userDao udEdit = new userDao();
            userModel user = udEdit.getByUserId(ids);
        %>
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
                    <a href="userHome.jsp">Home</a>
                </li>
                <li>
                    <a href="logout.jsp">Log-out</a>
                </li>
            </ul>
        </nav>
    </header>
    <div id="scrollbar"></div>

    
            
    <div class="covidTest">
        
        <form action="userTestResultServlet" method="post">
            
            <div class="hidden-content">
                <input value="true" name="test_completed" type="text" />
              <input type="hidden" name="id" value="<%=user.getId()%>">
            <input type="text" name="full_name" value="<%=user.getFull_name() %>" placeholder="Enter Your full Name" required />
      <input type="number" name="mobile_no" value="<%=user.getMobile_no() %>" class="inputNumber" placeholder="Enter mobile number" required />
      <input type="email" name="email" placeholder="Enter Email-id" value="<%=user.getEmail() %>" required />
      <input type="password" name="password" minlength="6" placeholder="Create new Password" value="<%=user.getPassword() %>" required />
      <input name="dose_status" value="<%=user.getDose_status() %>" id="doses" required />
      <input name="dose_type" id="doseType" value="<%=user.getDose_type() %>" required>
      <div class="dosesDate">
          <input type="text" value="<%=user.getFirst_dose_date() %>" name="first_dose_date" class="dose1 inputDate">
        <input type="text" value="<%=user.getSecond_dose_date() %>" name="second_dose_date" class="dose2 inputDate">
      </div>
            </div>
            
            <div class="title">Take a survey for covid</div>
            <div class="question">
                <p> 1. Have you come into close contact (within 6 feet) with someone who has a laboratory
                    confirmed COVID - 19 diagnosis in the past 14 days?</p>
                <div class="options">
                    <input type="radio" id="q1yes" name="question1" value="yes" required>
                    <label for="q1yes">yes</label>
                    <input type="radio" id="q1no" name="question1" value="no" required>
                    <label for="q1no">no</label>
                </div>
            </div>
            <hr>
            <div class="question">
                <p>2.Have you traveled anywhere in last 15 days?</p>
                <div class="options">
                    <input type="radio" id="q2yes" name="question2" value="yes" required>
                    <label for="q2yes">yes</label>
                    <input type="radio" id="q2no" name="question2" value="no" required>
                    <label for="q2no">no</label>
                </div>
            </div>
            <hr>

            <div class="question">
                <p>3. Do you have fever more than 98 degrees?</p>
                <div class="options">
                    <input type="radio" id="q3yes" name="question3" value="yes" required>
                    <label for="q3yes">yes</label>
                    <input type="radio" id="q3no" name="question3" value="no" required>
                    <label for="q3no">no</label>
                </div>
            </div>
            <hr>

            <div class="question">
                <p>4. In the last 10 days, have you been tested for the coronavirus that causes COVID-19?</p>
                <div class="options">
                    <input type="radio" id="q4yes" name="question4" value="yes" required>
                    <label for="q4yes">yes</label>
                    <input type="radio" id="q4no" name="question4" value="no" required>
                    <label for="q4no">no</label>
                </div>
            </div>

            <hr>
            <div class="question">
                <p>5.Do you live in a group home or other setting with others (pediatric skilled nursing facility,
                    behavioral health center, juvenile detention center, or homeless shelter)?</p>
                <div class="options">
                    <input type="radio" id="q5yes" name="question5" value="yes" required>
                    <label for="q5yes">yes</label>
                    <input type="radio" id="q5no" name="question5" value="no" required>
                    <label for="q5no">no</label>
                </div>
            </div>
            <hr>
            <div class="question">
                <p>6.Have you lost the sense of smell recently?</p>
                <div class="options">
                    <input type="radio" id="q6yes" name="question6" value="yes" required>
                    <label for="q6yes">yes</label>
                    <input type="radio" id="q6no" name="question6" value="no" required>
                    <label for="q6no">no</label>
                </div>
            </div>
            <hr>
            <div class="question">
                <p>7.Do you have body pain and fatigue?</p>
                <div class="options">
                    <input type="radio" id="q7yes" name="question7" value="yes" required>
                    <label for="q7yes">yes</label>
                    <input type="radio" id="q7no" name="question7" value="no" required>
                    <label for="q7no">no</label>
                </div>
            </div>
            <hr>
            <div class="question">
                <p>8.Do you have diarrhoea?</p>
                <div class="options">
                    <input type="radio" id="q8yes" name="question8" value="yes" required>
                    <label for="q8yes">yes</label>
                    <input type="radio" id="q8no" name="question8" value="no" required>
                    <label for="q8no">no</label>
                </div>
            </div>
            <hr>
            <div class="question">
                <p>9.Are you experiencing difficulty in breathing?</p>
                <div class="options">
                    <input type="radio" id="q9yes" name="question9" value="yes" required>
                    <label for="q9yes">yes</label>
                    <input type="radio" id="q9no" name="question9" value="no" required>
                    <label for="q9no">no</label>
                </div>
            </div>
            <hr>
            <div class="question">
                <p>10.Are you experiencing the sense of taste after eating food?</p>
                <div class="options">
                    <input type="radio" id="q10yes" name="question10" value="yes" required>
                    <label for="q10yes">yes</label>
                    <input type="radio" id="q10no" name="question10" value="no" required>
                    <label for="q10no">no</label>
                </div>
            </div>
            <input type="submit" class="formButton">

            <input type="reset" class="formButton">
        </form>
            
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
<script src="js/userHome.js"></script>

</html>
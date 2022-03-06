<%-- 
    Document   : userHome
    Created on : 18 Feb, 2022, 9:38:27 AM
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
    <title>Covid-India Home</title>
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/userHome.css" />
    <link rel="icon" href="media/icon.png" type="image/icon type" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
        integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body onload="load()">
    <%
            userModel user = (userModel) session.getAttribute("user");
            
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
                    <a href="#top" class="active">Home</a>
                </li>
                <li>
                    <a href="logout.jsp">Log-out</a>
                </li>
            </ul>
        </nav>
    </header>
    <div id="scrollbar"></div>

    <div class="welcome">
        <div class="message">
            Welcome, <%=user.getFull_name() %>
            <div class="closeButton" onclick="closeMessage()">&times;</div>
        </div>
    </div>
            <%
                if(user.getFirst_dose_date().equals(null) || user.getFirst_dose_date().equals("null")){
                    %>
                    <div class="details-of-user">
        <div class="all-details">
            <div class="dose-type-box dose-box">
                <div class="title">Dose Type</div>
                <div class="info">Please take a dose first<br><a target="_blank" href="https://selfregistration.cowin.gov.in/">Click here</a> to register</div>
            </div>
            <div class="first-dose-date-box dose-box">
                <div class="title">First dose date</div>
                <div class="info">Please take a dose first<br><a target="_blank" href="https://selfregistration.cowin.gov.in/">Click here</a> to register</div>
            </div>
            <div class="first-dose-date-box dose-box">
                <div class="title">second dose date</div>
                <div class="info">Please take a dose first<br><a target="_blank" href="https://selfregistration.cowin.gov.in/">Click here</a> to register</div>
            </div>
        </div>
    </div>
                    <%
                } else if(user.getSecond_dose_date() == null || user.getSecond_dose_date().equals("null")){
                    %>
                    
                    <div class="details-of-user">
        <div class="all-details">
            <div class="dose-type-box dose-box">
                <div class="title">Dose Type</div>
                <div class="info"><%=user.getDose_type()%></div>
            </div>
            <div class="first-dose-date-box dose-box">
                <div class="title">First dose date</div>
                <div class="info"><%=user.getFirst_dose_date()%></div>
            </div>
            <div class="first-dose-date-box dose-box">
                <div class="title">second dose date</div>
                <div class="info">Please complete your second dose</div>
            </div>
        </div>
    </div>
                    <%
                } else{
            %>
            <div class="details-of-user">
        <div class="all-details">
            <div class="dose-type-box dose-box">
                <div class="title">Dose Type</div>
                <div class="info"><%=user.getDose_type()%></div>
            </div>
            <div class="first-dose-date-box dose-box">
                <div class="title">First dose date</div>
                <div class="info"><%=user.getFirst_dose_date()%></div>
            </div>
            <div class="first-dose-date-box dose-box">
                <div class="title">second dose date</div>
                <div class="info"><%=user.getSecond_dose_date()%></div>
            </div>
        </div>
    </div>
            <%
                }
            %>
            
            <%
            if(user.getTest_completed().equals("true")){
                if(user.getTest_result()<=6){
                    %>
                    <div class="covidTestBox">
            <div class="covidTest">
                <div class="title">You have completed your survey very well<br> please take care of your self<br>
                   
                </div>
            </div>
                    </div>
                    <%
                } else if(user.getTest_result()>6){
                    %>
                    <div class="covidTestBox">
            <div class="covidTest">
                <div class="title">Your result is not good in last survey<br> please contact any covid center near from you<br>
                   <a href="covidTest.jsp?id=<%=user.getId()%>">click here</a> to take survey again
                </div>
            </div>
                    </div>
                    <%
                }
            } else{
                %>
                <div class="covidTestBox">
            <div class="covidTest">
                <div class="title">Take a survey for covid<br>
                    <a href="covidTest.jsp?id=<%=user.getId()%>">click here</a>
                </div>

            </div>
        </div>
                <%
            }
            %>
    
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
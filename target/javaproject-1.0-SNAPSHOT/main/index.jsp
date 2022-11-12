<%@ page import="com.example.javaproject.models.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.javaproject.services.EmployeeService" %>
<%@ page import="com.example.javaproject.models.Event_type" %>
<%@ page import="com.example.javaproject.services.EventsService" %>
<%@ page import="com.example.javaproject.models.Events" %><%--
  Created by IntelliJ IDEA.
  User: Intel
  Date: 30.04.2022
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/header.jsp">
    <jsp:param name="pageActive" value="/" />
</jsp:include>
<%
    List<Employee> employees = (List<Employee>) EmployeeService.getEmployee(10);
    List<Event_type> event_types = (List<Event_type>) EventsService.getAllEventTypes();
    List<Events> events = (List<Events>) EventsService.getAllEvents(3);
%>


<!-- Hero Section Begin -->
<section class="hero-section set-bg" data-setbg="main/img/hero.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-7">
                <div class="hero-text">
                    <span>5 to 9 may 2019, mardavall hotel, New York</span>
                    <h2>Change Your Mind<br /> To Become Sucess</h2>
                    <button type="button" class="primary-btn top-btn border-0" data-toggle="modal" data-target="#exampleModal">
                        Order
                    </button>
                </div>
            </div>
            <div class="col-lg-5">
                <img src="main/img/hero-right.png" alt="">
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Counter Section Begin -->
<section class="counter-section bg-gradient">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="counter-text">
                    <span>Conference Date</span>
                    <h3>Count Every Second <br />Until the Event</h3>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="cd-timer" id="countdown">
                    <div class="cd-item">
                        <span>40</span>
                        <p>Days</p>
                    </div>
                    <div class="cd-item">
                        <span>18</span>
                        <p>Hours</p>
                    </div>
                    <div class="cd-item">
                        <span>46</span>
                        <p>Minutes</p>
                    </div>
                    <div class="cd-item">
                        <span>32</span>
                        <p>Seconds</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Counter Section End -->

<!-- Home About Section Begin -->
<section class="home-about-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="ha-pic">
                    <img src="main/img/h-about.jpg" alt="">
                </div>
            </div>
            <div class="col-lg-6">
                <div class="ha-text">
                    <h2>About Conference</h2>
                    <p>When I first got into the online advertising business, I was looking for the magical
                        combination that would put my website into the top search engine rankings, catapult me to
                        the forefront of the minds or individuals looking to buy my product, and generally make me
                        rich beyond my wildest dreams! After succeeding in the business for this long, I’m able to
                        look back on my old self with this kind of thinking and shake my head.</p>
                    <ul>
                        <li><span class="icon_check"></span> Write On Your Business Card</li>
                        <li><span class="icon_check"></span> Advertising Outdoors</li>
                        <li><span class="icon_check"></span> Effective Advertising Pointers</li>
                        <li><span class="icon_check"></span> Kook 2 Directory Add Url Free</li>
                    </ul>
                    <a href="#" class="ha-btn">Discover Now</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Home About Section End -->

<!-- Team Member Section Begin -->
<section class="team-member-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Our employees</h2>
                    <p>These are our communicators, you can see each person information</p>
                </div>
            </div>
        </div>
    </div>

    <%
    for (Employee employee : employees){%>
    <div class="member-item set-bg" data-setbg="main/img/team-member/<%=employee.getImage()%>">
        <div class="mi-social">
            <div class="mi-social-inner bg-gradient">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
            </div>
        </div>
        <div class="mi-text">
            <h5><%=employee.getName()%></h5>
            <span><%=employee.getEmployee_type().getName()%></span>
        </div>
    </div>
    <%}
    %>

</section>
<!-- Team Member Section End -->

<!-- Schedule Section Begin -->
<section class="schedule-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Event types</h2>
                    <p>Do not miss anything topic about the event</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="schedule-tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <%
                        for (int i = 0; i < event_types.size(); i++){ %>
                            <li class="nav-item ">
                                <a class="nav-link <%if (i%2 ==0) {%> active <% }%>" >
                                    <h5><%=event_types.get(i).getName()%></h5>
                                    <p><%=event_types.get(i).getPrice()%>$</p>
                                </a>
                            </li>
                        <%}
                        %>

                    </ul><!-- Tab panes -->

                </div>
            </div>
        </div>
    </div>
</section>
<!-- Schedule Section End -->

<!-- latest BLog Section Begin -->
<section class="latest-blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>Latest Events</h2>
                    <p>Do not miss anything topic about the event</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="latest-item set-bg large-item" data-setbg="main/img/blog/latest-b/latest-1.jpg">
                    <div class="li-tag"><%=events.get(0).getTitle()%></div>
                    <div class="li-text">
                        <h4><a href="./blog-details.html"><%=events.get(0).getDescription()%></a></h4>
                        <span><i class="fa fa-clock-o"></i> <%=events.get(0).getStart_date()%></span>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="latest-item set-bg" data-setbg="main/img/blog/latest-b/latest-2.jpg">
                    <div class="li-tag"><%=events.get(1).getTitle()%></div>
                    <div class="li-text">
                        <h5><a href="./blog-details.html"><%=events.get(1).getDescription()%></a></h5>
                        <span><i class="fa fa-clock-o"></i> <%=events.get(1).getStart_date()%></span>
                    </div>
                </div>
                <div class="latest-item set-bg" data-setbg="main/img/blog/latest-b/latest-3.jpg">
                    <div class="li-tag"><%=events.get(2).getTitle()%></div>
                    <div class="li-text">
                        <h5><a href="./blog-details.html"><%=events.get(2).getDescription()%></a></h5>
                        <span><i class="fa fa-clock-o"></i> <%=events.get(2).getStart_date()%></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- latest BLog Section End -->

<!-- Newslatter Section Begin -->
<section class="newslatter-section">
    <div class="container">
        <div class="newslatter-inner set-bg" data-setbg="main/img/newslatter-bg.jpg">
            <div class="ni-text">
                <h3>Subscribe Newsletter</h3>
                <p>Subscribe to our newsletter and don’t miss anything</p>
            </div>
            <form action="#" class="ni-form">
                <input type="text" placeholder="Your email">
                <button type="submit">Subscribe</button>
            </form>
        </div>
    </div>
</section>
<!-- Newslatter Section End -->

<!-- Contact Section Begin -->
<section class="contact-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="section-title">
                    <h2>Location</h2>
                    <p>Get directions to our event center</p>
                </div>
                <div class="cs-text">
                    <div class="ct-address">
                        <span>Address:</span>
                        <p>01 Pascale Springs Apt. 339, NY City <br />United State</p>
                    </div>
                    <ul>
                        <li>
                            <span>Phone:</span>
                            (+12)-345-67-8910
                        </li>
                        <li>
                            <span>Email:</span>
                            info.colorlib@gmail.com
                        </li>
                    </ul>
                    <div class="ct-links">
                        <span>Website:</span>
                        <p>https://conference.colorlib.com</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="cs-map">
                    <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d52901.38789495531!2d-118.19465514866786!3d34.03523211493029!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2cf71ad83ff9f%3A0x518b28657f4543b7!2sEast%20Los%20Angeles%2C%20CA%2C%20USA!5e0!3m2!1sen!2sbd!4v1579763856144!5m2!1sen!2sbd"
                            height="400" style="border:0;" allowfullscreen=""></iframe>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Contact Section End -->
<jsp:include page="includes/footer.jsp"/>
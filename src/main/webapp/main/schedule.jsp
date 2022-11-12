<%@ page import="java.util.List" %>
<%@ page import="com.example.javaproject.models.Event_type" %>
<%@ page import="com.example.javaproject.services.EventsService" %>
<%@ page import="com.example.javaproject.models.Events" %><%--
  Created by IntelliJ IDEA.
  User: Intel
  Date: 01.05.2022
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/header.jsp">
    <jsp:param name="pageActive" value="/schedule" />
</jsp:include>
<%
    List<Event_type> event_types = (List<Event_type>) session.getAttribute("event_types");
    int counter = 1;
%>


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb-text">
                    <h2>Event Schedule</h2>
                    <div class="bt-option">
                        <a href="#">Home</a>
                        <span>Our Schedule</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Schedule Table Section Begin -->
<section class="schedule-table-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="schedule-table-tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <%
                        for (Event_type event_type : event_types){%>
                        <li class="nav-item">
                            <a class="nav-link <%if (counter == 1){%>active<%}%>" data-toggle="tab" href="#tabs-<%=counter%>" role="tab"><%=event_type.getName()%></a>
                        </li>
                       <% counter++;}
                        %>

                    </ul><!-- Tab panes -->
                    <div class="tab-content">
                        <% counter = 1;
                            for (Event_type event_type : event_types){%>
                        <div class="tab-pane <%if (counter == 1){%>active<%}%>  " id="tabs-<%=counter%>" role="tabpanel">
                            <div class="schedule-table-content">
                                <table>
                                    <thead>
                                    <tr>
                                        <th><strong>Start date</strong></th>
                                        <th>
                                            <strong>Title</strong>

                                        </th>
                                        <th>
                                            <strong>Location</strong>

                                        </th>
                                        <th>
                                            <strong>Number of participants</strong>

                                        </th>
                                        <th>
                                            <strong>End date</strong>

                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                            <%
                                List<Events> sortedEventsList = (List<Events>) EventsService.getEventsByEventTypeId(0,event_type.getId());
                                for (int i = 0; i < sortedEventsList.size(); i++){%>
                            <tr>
                                <td class="event-time" style="font-size: 16px;"><%=sortedEventsList.get(i).getStart_date()%></td>
                                <td class="break hover-bg">
                                    <h5><%=sortedEventsList.get(i).getTitle()%></h5>
                                </td>
                                <td class="break hover-bg">
                                    <h5><%=sortedEventsList.get(i).getLocation()%></h5>
                                </td>
                                <td class="break hover-bg">
                                    <h5><%=sortedEventsList.get(i).getNumber_participants()%></h5>
                                </td>
                                <td class="break hover-bg" style="width: 140px;
                                        color: #f44949;
                                        font-size: 16px;
                                        font-weight: 600;">
                                    <h5><%=sortedEventsList.get(i).getEnd_date()%></h5>
                                </td>
                            </tr>
                            <%}
                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <% counter++;}
                        %>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Schedule Table Section End -->

<!-- Newslatter Section Begin -->
<section class="newslatter-section about-newslatter">
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

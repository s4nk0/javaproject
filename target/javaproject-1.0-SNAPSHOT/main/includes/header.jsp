<%@ page import="com.example.javaproject.services.EventsService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.javaproject.models.Event_type" %>
<%@ page import="com.example.javaproject.models.Payment_type" %>
<%@ page import="com.example.javaproject.services.Fee_scheduleService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Manup Template">
    <meta name="keywords" content="Manup, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Manup | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap" rel="stylesheet">


    <!-- Css Styles -->
    <link rel="stylesheet" href="main/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="main/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="main/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="main/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="main/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="main/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="main/css/style.css" type="text/css">
</head>
<body>
<%

    String link = "";
    if (request.getParameter("pageActive") != null){
        link = request.getParameter("pageActive");
    }


    List<Event_type> event_types = (List<Event_type>) EventsService.getAllEventTypes();
    List<Payment_type> payment_types = (List<Payment_type>) Fee_scheduleService.getAllPaymentType();
    %>

<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header-section header-normal">
    <div class="container">
        <div class="logo">
            <a href="./index.html">
                <img src="main/img/logo.png" height="50" alt="">
            </a>
        </div>
        <div class="nav-menu">
            <nav class="mainmenu mobile-menu">
                <ul>
                    <li <% if (link.equals("/")) {%>
                            class="active"
                            <%}%>
                    ><a href="/">Home</a></li>
                    <li <% if (link.equals("/about")) {%>
                            class="active"
                            <%}%>
                    ><a href="./about">About</a></li>
                    <li <% if (link.equals("/employees")) {%>
                            class="active"
                        <%}%>
                    ><a href="./employees">Employees</a>
<%--                        <ul class="dropdown">--%>
<%--                            <li><a href="#">Jayden</a></li>--%>
<%--                            <li><a href="#">Sara</a></li>--%>
<%--                            <li><a href="#">Emma</a></li>--%>
<%--                            <li><a href="#">Harriet</a></li>--%>
<%--                        </ul>--%>
                    </li>
                    <li <% if (link.equals("/schedule")) {%>
                            class="active"
                            <%}%>
                    ><a href="./schedule">Schedule</a></li>
                    <li<% if (link.equals("/events")) {%>
                            class="active"
                            <%}%>
                    ><a href="./events">Events</a></li>
                    <li <% if (link.equals("/contact")) {%>
                            class="active"
                            <%}%>
                    ><a href="./contact">Contacts</a></li>
                </ul>
            </nav>
            <!-- Button trigger modal -->
            <button type="button" class="primary-btn top-btn border-0" data-toggle="modal" data-target="#exampleModal">
                <i class="fa fa-ticket"></i> Order
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog w-100" role="document">
                    <div class="modal-content px-3">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel" style="color: #f44949;font-size: 24px;font-weight: 600;">Order event</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="/sendRequest" method="post">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputName">Name</label>
                                        <input type="text" class="form-control" id="inputName" placeholder="Name" name="user_name">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPhone">Phone number</label>
                                        <input type="text" class="form-control" id="inputPhone" placeholder="Phone number" name="phone_number">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputEmail4">Email</label>
                                        <input type="email" class="form-control" id="inputEmail4" placeholder="Email" name="email">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputAddress">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="event_address">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="selectEvent">Event type</label>
                                        <select class="form-control" id="selectEvent" name="event_type_id">
                                            <option data-price="0">Select event type</option>
                                            <% for (Event_type event_type : event_types) {%>
                                            <option value="<%=event_type.getId()%>" data-price="<%=event_type.getPrice()%>"> <%=event_type.getPrice()%>$ - <%=event_type.getName()%></option>
                                            <%}%>

                                        </select>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="selectPayment">Payment type</label>
                                        <select class="form-control" id="selectPayment" name="payment_type_id">
                                            <option>Select payment type</option>
                                            <% for (Payment_type payment_type : payment_types) {%>
                                            <option value="<%=payment_type.getId()%>" > <%=payment_type.getName()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-check">
                                    <label for="exampleFormControlTextarea1">You want add somthing?</label><br>
                                    <input type="radio" id="contactChoice1" class="form-check-input descriptionOption"
                                           name="contact" data-value="no" value="No" checked>
                                    <label for="contactChoice1">No</label>
                                </div>
                                    <div class="form-check">
                                    <input type="radio" id="contactChoice2" class="form-check-input descriptionOption"
                                           name="contact" data-value="yes" value="Yes">
                                    <label for="contactChoice2">Yes</label>

                                </div>

                                <div class="form-group descriptionShow" style="display: none">
                                    <label for="exampleFormControlTextarea1">Adding thing</label>
                                    <textarea name="description" class="form-control descriptionShowContent" id="exampleFormControlTextarea1" rows="3" placeholder="If you want to add something else, write here the moderator to change the price and send details"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="event_title">Event title</label>
                                    <input type="text" class="form-control" id="event_title" placeholder="Write something funny)" name="event_title">
                                </div>
                                <div class="form-group " >
                                    <label for="eventdesc">Event description</label>
                                    <textarea name="event_description" class="form-control" id="eventdesc" rows="3" placeholder="How will the event go"></textarea>
                                </div>

                                <div class="form-group">
                                    <label for="numberParticipants">Number of participants</label>
                                    <input type="number" class="form-control" id="numberParticipants" placeholder="Number of participants" name="number_participants">
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="startDate">Start date:</label>
                                        <input type="date" class="form-control" id="startDate" name="start_date">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="endDate">End date:</label>
                                        <input type="date" class="form-control" id="endDate" name="end_date">
                                    </div>
                                </div>
                                <div class="row py-2">
                                    <div class="col-sm-3 "></div>
                                    <div class="col-sm-3 "></div>
                                    <div class="col-sm-3 ">
                                        Price:
                                    </div>
                                    <div class="col-sm-3 ">
                                        <span class="price-option"></span> <span class="price">0</span>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="primary-btn border-0" data-dismiss="modal">Close</button>
                                    <button type="submit" class="primary-btn border-0">Submit</button>
                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>

<!-- Header End -->


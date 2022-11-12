package com.example.javaproject.controllers;

import com.example.javaproject.models.Attendees;
import com.example.javaproject.models.Fee_schedule;
import com.example.javaproject.services.AttendeesService;
import com.example.javaproject.services.EventsService;
import com.example.javaproject.services.Fee_scheduleService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(
        name = "sendRequest",
        value = "/sendRequest")
public class MainSendRequestController extends HttpServlet {
    private void processRequest(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "/main/404.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("user_name");
        String phone_number = request.getParameter("phone_number");
        String email = request.getParameter("email");
        String address = request.getParameter("event_address");
        String event_type_id = request.getParameter("event_type_id");
        String payment_type_id = request.getParameter("payment_type_id");
        String description = request.getParameter("description");
        String event_title = request.getParameter("event_title");
        String event_description = request.getParameter("event_description");
        String number_participants = request.getParameter("number_participants");
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");

        AttendeesService.addAttendees(name,phone_number,email);
        Fee_scheduleService.addFeeschedule(payment_type_id,description);

        Attendees attendees = AttendeesService.getAttendeesAllParametres(name,phone_number,email);
        int feeschedule_id = Fee_scheduleService.getLastIdFromFeeschedule();
//        System.out.println(attendees.getId());
//        System.out.println(feeschedule_id);
//        System.out.println(address);
        EventsService.addEvent(event_title,event_description,String.valueOf(address),number_participants,event_type_id,String.valueOf(feeschedule_id),attendees.getId(),start_date,end_date);
        System.out.println("request added");
        response.sendRedirect(request.getContextPath() + "/?success=test");
    }
}

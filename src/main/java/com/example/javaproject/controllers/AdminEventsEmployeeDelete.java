package com.example.javaproject.controllers;


import com.example.javaproject.services.EventsService;
import com.example.javaproject.services.Fee_scheduleService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(
        name = "deleteEventsEmployee",
        value = "/admin/deleteEventsEmployee")
public class AdminEventsEmployeeDelete extends HttpServlet {
    private void processRequest(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("/admin/settings");

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

        String event_id = request.getParameter("event_id");
        String employee_id = request.getParameter("employee_id");


        EventsService.deleteEventEmployee(event_id,employee_id);
        System.out.println("Данные удалены успешно");

        response.sendRedirect("/admin/event_info?id="+event_id);

    }
}


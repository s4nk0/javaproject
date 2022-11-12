package com.example.javaproject.controllers;

import com.example.javaproject.models.Fee_schedule;
import com.example.javaproject.services.EmployeeService;
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
        name = "settings",
        value = "/admin/settings")
public class AdminSettingsController extends HttpServlet {
    private void processRequest(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getSession().setAttribute("event_types", EventsService.getAllEventTypes());
        request.getSession().setAttribute("payment_types", Fee_scheduleService.getAllPaymentType());
        request.getSession().setAttribute("employee_types", EmployeeService.getAllEmployeeType());



        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "/admin/settings.jsp");
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

    }
}

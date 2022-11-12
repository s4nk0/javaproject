package com.example.javaproject.controllers;

import com.example.javaproject.services.EmployeeService;
import com.example.javaproject.services.EventsService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(
        name = "events_main",
        value = "/events")
public class EventsListController extends HttpServlet {
    int limitConts = 9;

    private void processRequest(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getSession().setAttribute("events", EventsService.getAllEvents(limitConts));
        request.getSession().setAttribute("limit", "Load more");
        request.getSession().setAttribute("limitConst", limitConts);


        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "/main/events.jsp");
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
        String load_more = request.getParameter("load_more");
        String limitString = "Close";
        int limit = 0;

        if (load_more.equals("Close")){
            limit = limitConts;
            limitString = "Load more";
        }

        request.getSession().setAttribute("events", EventsService.getAllEvents(limit));
        request.getSession().setAttribute("limit", limitString);
        request.getSession().setAttribute("limitConst", limitConts);

        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "/main/events.jsp");
        dispatcher.forward(request, response);
    }
}

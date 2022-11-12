package com.example.javaproject.controllers;

import com.example.javaproject.services.EventsService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(
        name = "addEventType",
        value = "/admin/addEventType")
public class AdminAddEventTypes extends HttpServlet {
    private void processRequest(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher("/admin/settings");
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

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");


        EventsService.addEventType(name,description,price);

        System.out.println("Данные отправлены успешно");
        RequestDispatcher dispatcher = getServletContext()
                .getRequestDispatcher("/admin/settings");
        dispatcher.forward(request, response);
    }
}

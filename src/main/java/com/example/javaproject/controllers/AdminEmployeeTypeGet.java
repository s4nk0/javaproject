package com.example.javaproject.controllers;

import com.example.javaproject.services.EmployeeService;
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
        name = "getDataEmployeeType",
        value = "/admin/getDataEmployeeType")
public class AdminEmployeeTypeGet extends HttpServlet {
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

        String id = request.getParameter("id");


        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(), EmployeeService.getEmployeeTypeById(id));
        System.out.println("Данные отправлены успешно");

//        response.sendRedirect("/admin/settings?success=Dates%20deleted");

    }
}

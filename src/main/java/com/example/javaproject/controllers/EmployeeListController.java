package com.example.javaproject.controllers;

import com.example.javaproject.services.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(
        name = "employees",
        value = "/employees")
public class EmployeeListController extends HttpServlet {
    int limitConst = 6;

    private void processRequest(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getSession().setAttribute("employee", EmployeeService.getEmployee(limitConst));
        request.getSession().setAttribute("limit", "Load more");

        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "/main/employee.jsp");
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
            limit = limitConst;
            limitString = "Load more";
        }

        request.getSession().setAttribute("employee", EmployeeService.getEmployee(limit));
        request.getSession().setAttribute("limit", limitString);

        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "/main/employee.jsp");
        dispatcher.forward(request, response);
    }
}

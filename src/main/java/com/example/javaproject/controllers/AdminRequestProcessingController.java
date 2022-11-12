package com.example.javaproject.controllers;

import com.example.javaproject.services.EmployeeService;
import com.example.javaproject.services.EventsService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(
        name = "requests_info",
        value = "/admin/request_info")
public class AdminRequestProcessingController extends HttpServlet {
    private void processRequest(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = "";
        if (request.getParameter("id") != null){
            id = request.getParameter("id");
        }

        request.getSession().setAttribute("request", EventsService.getRequestsById(id));
        request.getSession().setAttribute("employees", EmployeeService.getEmployee(0));

        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "/admin/request_info.jsp");
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
        String employees_id = request.getParameter("employees_id");
        String event_id = request.getParameter("event_id");
        JSONArray obj = null;

        try {
            obj = new JSONArray(employees_id);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        for (int i = 0; i < obj.length(); i++){
            try {
                System.out.println(obj.getString(0));
                EmployeeService.addEventToEmployee(obj.getString(i),event_id);

            } catch (JSONException e) {
                e.printStackTrace();
            }
        }

        System.out.println(obj.length());


    }
}

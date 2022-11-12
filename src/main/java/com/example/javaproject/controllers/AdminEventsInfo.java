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
        name = "event_info",
        value = "/admin/event_info")
public class AdminEventsInfo extends HttpServlet {
    private void processRequest(
            HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = "";
        if (request.getParameter("id") != null){
            id = request.getParameter("id");
        }

        request.getSession().setAttribute("event", EventsService.getEventById(id));
        request.getSession().setAttribute("employees_from_event", EmployeeService.getEmployeesFromEvents(id));
        request.getSession().setAttribute("employees", EmployeeService.getEmployee(0));

        RequestDispatcher dispatcher = request.getRequestDispatcher(
                "/admin/event_info.jsp");
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

        response.sendRedirect("/admin/event_info?id="+event_id+"&success=Dates%20updated");


    }
}

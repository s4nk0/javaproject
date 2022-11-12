package com.example.javaproject.services;

import com.example.javaproject.config.Database;
import com.example.javaproject.models.Employee_type;
import com.example.javaproject.models.Event_type;
import com.example.javaproject.models.Events;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class EventsService {
    public static Events getEventById(String id){
        Events event = new Events("","","","","","","","","","","",null,null,null,null);
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `events` WHERE `id` =" + id);
            rs = ps.executeQuery();

            while (rs.next()) {
                event = new Events(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getString(11), getEventTypeById(rs.getString(7)),Fee_scheduleService.getFeeScheduleById(rs.getString(8))
                        ,AttendeesService.getAttendeesById(rs.getString(9)),EmployeeService.getEmployeesFromEvents(rs.getString(1)));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return event;
    }

    public static ArrayList<Events> getAllEvents(int limit){
        ArrayList<Events> events = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();

            if (limit <= 0){
                ps = con.prepareStatement("SELECT * FROM `events` ORDER BY `start_date` DESC ");
            } else {
                ps = con.prepareStatement("SELECT * FROM `events` ORDER BY `start_date` DESC LIMIT " +  String.valueOf(limit));
            }
            rs = ps.executeQuery();

            while (rs.next()) {

                events.add(new Events(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getString(11), getEventTypeById(rs.getString(7)),Fee_scheduleService.getFeeScheduleById(rs.getString(8))
                ,AttendeesService.getAttendeesById(rs.getString(9)),EmployeeService.getEmployeesFromEvents(rs.getString(1))));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return events;
    }

    public static ArrayList<Events> getEventsByEventTypeId(int limit, String event_type_id){
        ArrayList<Events> events = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();

            if (limit <= 0){
                ps = con.prepareStatement("SELECT * FROM `events` WHERE `event_type_id` = "+event_type_id+" ORDER BY `start_date` DESC ");
            } else {
                ps = con.prepareStatement("SELECT * FROM `events` WHERE `event_type_id` = "+event_type_id+" ORDER BY `start_date` DESC LIMIT " +  String.valueOf(limit));
            }
            rs = ps.executeQuery();


            while (rs.next()) {
                events.add(new Events(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getString(11), getEventTypeById(rs.getString(7)),Fee_scheduleService.getFeeScheduleById(rs.getString(8))
                        ,AttendeesService.getAttendeesById(rs.getString(9)),EmployeeService.getEmployeesFromEvents(rs.getString(1))));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return events;
    }

    public static Event_type getEventTypeById(String id){
        Event_type event_type = new Event_type("null","null","null","null");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `event_type` WHERE `id` = "+id);
            rs = ps.executeQuery();
            while (rs.next())
                event_type = new Event_type(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4));

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return event_type;
    }

    public static ArrayList<Event_type> getAllEventTypes(){
        ArrayList<Event_type> event_types = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `event_type`");
            rs = ps.executeQuery();

            while (rs.next()) {
                event_types.add(new Event_type(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return event_types;
    }

    public static ArrayList<Events> getRequests(){
        ArrayList<Events> events = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `requests`");
            rs = ps.executeQuery();

            while (rs.next()) {
                events.add(new Events(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getString(11), getEventTypeById(rs.getString(7)),Fee_scheduleService.getFeeScheduleById(rs.getString(8))
                        ,AttendeesService.getAttendeesById(rs.getString(9)),EmployeeService.getEmployeesFromEvents(rs.getString(1))));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return events;
    }

    public static Events getRequestsById(String id){
        Events event = new Events("","","","","","","","","","","",null,null,null,null);
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `requests` WHERE `id` =" + id);
            rs = ps.executeQuery();

            while (rs.next()) {
                event = new Events(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getString(11), getEventTypeById(rs.getString(7)),Fee_scheduleService.getFeeScheduleById(rs.getString(8))
                        ,AttendeesService.getAttendeesById(rs.getString(9)),EmployeeService.getEmployeesFromEvents(rs.getString(1)));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return event;
    }


    public static int getEventTypeCountByIdInEvents(String id){
        int count = 0;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT COUNT(*) FROM `events` where event_type_id = "+id);
            rs = ps.executeQuery();

            while (rs.next()) {
                count = Integer.parseInt(rs.getString(1));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return count;
    }

    public static void deleteEventEmployee(String event_id, String employee_id){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("DELETE FROM `events_employee` WHERE `events_employee`.`event_id` = "+event_id+" AND `events_employee`.`employee_id` ="+employee_id+"");

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void addEvent(String title, String description, String event_location, String number_participants, String event_type_id, String fee_schedule_id, String attendees_id, String start_date, String end_date){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("INSERT INTO `events` (`id`, `title`, `description`, `location`, `number_participants`," +
                    " `image`, `event_type_id`, `fee_schedule_id`, `attendees_id`, `start_date`, `end_date`) " +
                    "VALUES (NULL, '"+title+"', '"+description+"', '"+event_location+"', '"+number_participants+"', NULL, " +
                    "'"+event_type_id+"', '"+fee_schedule_id+"', '"+attendees_id+"', '"+start_date+"', '"+end_date+"');");

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void editEventType(String id,String name, String description, String price){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("UPDATE `event_type` SET `name` = '"+name+"', `desciption` = '"+description+"', `price` = '"+price+"' WHERE `event_type`.`id` = "+id+";");

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void deleteEventType(String id){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("DELETE FROM `event_type` WHERE `event_type`.`id` = "+id);

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void addEventType(String name, String description, String price){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("INSERT INTO `event_type` (`id`, `name`, `desciption`, `price`) VALUES (NULL, '"+name+"', '"+description+"', '"+price+"');");

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}

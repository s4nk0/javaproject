package com.example.javaproject.models;

import java.util.ArrayList;

public class Events {
    private String id;
    private String title;
    private String description;
    private String location;
    private String number_participants;
    private String image;
    private String event_type_id;
    private String fee_schedule_id;
    private String attendees_id;
    private String start_date;
    private String end_date;
    private Event_type event_type;
    private Fee_schedule fee_schedule;
    private Attendees attendees;
    private ArrayList<Employee> employees;

    public Events(String id, String title, String description, String location, String number_participants, String image, String event_type_id, String fee_schedule_id, String attendees_id, String start_date, String end_date, Event_type event_type, Fee_schedule fee_schedule, Attendees attendees, ArrayList<Employee> employees) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.location = location;
        this.number_participants = number_participants;
        this.image = image;
        this.event_type_id = event_type_id;
        this.fee_schedule_id = fee_schedule_id;
        this.attendees_id = attendees_id;
        this.start_date = start_date;
        this.end_date = end_date;
        this.event_type = event_type;
        this.fee_schedule = fee_schedule;
        this.attendees = attendees;
        this.employees = employees;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getNumber_participants() {
        return number_participants;
    }

    public void setNumber_participants(String number_participants) {
        this.number_participants = number_participants;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getEvent_type_id() {
        return event_type_id;
    }

    public void setEvent_type_id(String event_type_id) {
        this.event_type_id = event_type_id;
    }

    public String getFee_schedule_id() {
        return fee_schedule_id;
    }

    public void setFee_schedule_id(String fee_schedule_id) {
        this.fee_schedule_id = fee_schedule_id;
    }

    public String getAttendees_id() {
        return attendees_id;
    }

    public void setAttendees_id(String attendees_id) {
        this.attendees_id = attendees_id;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public Event_type getEvent_type() {
        return event_type;
    }

    public void setEvent_type(Event_type event_type) {
        this.event_type = event_type;
    }

    public Fee_schedule getFee_schedule() {
        return fee_schedule;
    }

    public void setFee_schedule(Fee_schedule fee_schedule) {
        this.fee_schedule = fee_schedule;
    }

    public Attendees getAttendees() {
        return attendees;
    }

    public void setAttendees(Attendees attendees) {
        this.attendees = attendees;
    }

    public ArrayList<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(ArrayList<Employee> employees) {
        this.employees = employees;
    }
}

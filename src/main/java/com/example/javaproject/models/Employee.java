package com.example.javaproject.models;

public class Employee {
    private String id;
    private String name;
    private String phone_number;
    private String image;
    private String start_date;
    private String end_date;
    private String employee_type_id;
    private Employee_type employee_type;

    public Employee(String id, String name, String phone_number, String image, String start_date, String end_date, String employee_type_id, Employee_type employee_type) {
        this.id = id;
        this.name = name;
        this.phone_number = phone_number;
        this.image = image;
        this.start_date = start_date;
        this.end_date = end_date;
        this.employee_type_id = employee_type_id;
        this.employee_type = employee_type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getEmployee_type_id() {
        return employee_type_id;
    }

    public void setEmployee_type_id(String employee_type_id) {
        this.employee_type_id = employee_type_id;
    }

    public Employee_type getEmployee_type() {
        return employee_type;
    }

    public void setEmployee_type(Employee_type employee_type) {
        this.employee_type = employee_type;
    }
}

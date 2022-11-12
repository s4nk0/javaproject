package com.example.javaproject.services;

import com.example.javaproject.config.Database;
import com.example.javaproject.models.Employee;
import com.example.javaproject.models.Employee_type;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class EmployeeService {

    public static ArrayList<Employee> getEmployee(int limit){
        ArrayList<Employee> employees = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();

            if (limit <= 0){
                ps = con.prepareStatement("SELECT * FROM `employee`");
            } else {
                ps = con.prepareStatement("SELECT * FROM `employee` LIMIT " +  String.valueOf(limit));
            }
            rs = ps.executeQuery();


            while (rs.next()) {
                employees.add(new Employee(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), getEmployeeTypeById(rs.getString(7))));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return employees;
    }

    public static ArrayList<Employee> getMostPopularEmployee(int limit){
        ArrayList<Employee> employees = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();

            if (limit <= 0){
                ps = con.prepareStatement("SELECT * FROM `most_popular_employees`");
            } else {
                ps = con.prepareStatement("SELECT * FROM `most_popular_employees` LIMIT " +  String.valueOf(limit));
            }
            rs = ps.executeQuery();


            while (rs.next()) {
                employees.add(new Employee(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), getEmployeeTypeById(rs.getString(7))));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return employees;
    }

    public static ArrayList<Employee> getEmployeesFromEvents(String event_id){
        ArrayList<Employee> employees = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT employee.* from events_employee INNER JOIN employee on employee.id = " +
                    "events_employee.employee_id WHERE events_employee.event_id = "+event_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                employees.add(new Employee(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), getEmployeeTypeById(rs.getString(7))));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return employees;
    }




    public static Employee_type getEmployeeTypeById(String id){
        Employee_type employee_type = new Employee_type("null","null","null","null");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `employee_type` WHERE `id` = "+id);
            rs = ps.executeQuery();
            while (rs.next())
            employee_type = new Employee_type(rs.getString(1), rs.getString(2),
                    rs.getString(3), rs.getString(4));

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return employee_type;
    }

    public static ArrayList<Employee_type> getAllEmployeeType(){
        ArrayList<Employee_type> employee_types = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `employee_type`");
            rs = ps.executeQuery();
            while (rs.next())
                employee_types.add(new Employee_type(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4)));

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return employee_types;
    }

    public static int getEmployeeTypeCountByIdInEmployee(String id){
        int count = 0;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT COUNT(*) FROM `employee` WHERE employee_type_id ="+ id);
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

    public static void editEmployeeType(String id,String name, String description,String fee){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("UPDATE `employee_type` SET `name` = '"+name+"', `description` = '"+description+"', `fee` = '"+fee+"' WHERE `employee_type`.`id` = "+id+";");

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void deleteEmployeeType(String id){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("DELETE FROM `employee_type` WHERE `employee_type`.`id` = " + id);

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void addEmployeeType(String name, String description,String fee){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("INSERT INTO `employee_type` (`id`, `name`, `description`, `fee`) VALUES (NULL, '"+name+"', '"+description+"', '"+fee+"');");

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void addEventToEmployee(String employee_id, String event_id){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("INSERT INTO `events_employee` (`id`, `employee_id`, `event_id`) VALUES (NULL, '"+employee_id+"', '"+event_id+"');");

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}

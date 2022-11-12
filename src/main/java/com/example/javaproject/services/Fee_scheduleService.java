package com.example.javaproject.services;

import com.example.javaproject.config.Database;
import com.example.javaproject.models.Attendees;
import com.example.javaproject.models.Event_type;
import com.example.javaproject.models.Fee_schedule;
import com.example.javaproject.models.Payment_type;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Fee_scheduleService {
    public static Fee_schedule getFeeScheduleById(String id){
        Fee_schedule fee_schedule = new Fee_schedule("null","null","null","null",
                "null", new Payment_type("null","null","null"));

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `fee_schedule` WHERE `id` = "+id);
            rs = ps.executeQuery();
            while (rs.next())
                fee_schedule = new Fee_schedule(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), getPaymentTypeById(rs.getString(2)));

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return fee_schedule;
    }

    public static Payment_type getPaymentTypeById(String id){
        Payment_type payment_type = new Payment_type("null","null","null");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `payment_type` WHERE `id` = "+id);
            rs = ps.executeQuery();
            while (rs.next())
                payment_type = new Payment_type(rs.getString(1), rs.getString(2),
                        rs.getString(3));

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return payment_type;
    }

    public static ArrayList<Payment_type> getAllPaymentType(){
        ArrayList<Payment_type> payment_types = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `payment_type`");
            rs = ps.executeQuery();

            while (rs.next()) {
                payment_types.add(new Payment_type(rs.getString(1), rs.getString(2), rs.getString(3)));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return payment_types;

    }

    public static int getLastIdFromFeeschedule(){
        Fee_schedule fee_schedule = new Fee_schedule("null","null","null","null",
                "null", new Payment_type("null","null","null"));

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `fee_schedule` ORDER by id desc limit 1");

            rs = ps.executeQuery();
            while (rs.next())
                fee_schedule = new Fee_schedule(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), getPaymentTypeById(rs.getString(2)));

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return (Integer.parseInt(fee_schedule.getId()));
    }

    public static int getPaymentTypeCountByIdInFeeSchedule(String id){
        int count = 0;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT COUNT(*) FROM `fee_schedule` where payment_type = "+id);
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

    public static void editPaymentType(String id,String name, String description){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("UPDATE `payment_type` SET `name` = '"+name+"', `description` = '"+description+"' WHERE `payment_type`.`id` = "+id+";");

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void deletePaymentType(String id){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("DELETE FROM `payment_type` WHERE `payment_type`.`id` = "+id);

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void addPaymentType(String name, String description){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("INSERT INTO `payment_type` (`id`, `name`, `description`) VALUES (NULL, '"+name+"', '"+description+"');");

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static void addFeeschedule(String payment_type, String user_description){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("CALL fee_schedule_add_rules("+payment_type+",'"+user_description+"')");
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}

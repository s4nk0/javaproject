package com.example.javaproject.services;

import com.example.javaproject.config.Database;
import com.example.javaproject.models.Attendees;
import com.example.javaproject.models.Payment_type;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class AttendeesService {
    public static Attendees getAttendeesById(String id){
        Attendees attendees = new Attendees("null","null","null","null","null");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `attendees` WHERE `id` = "+id);
            rs = ps.executeQuery();
            while (rs.next())
                attendees = new Attendees(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5));

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return attendees;
    }

    public static void addAttendees(String name, String phone_number, String email){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = Database.openAccess();

            Statement stmt = con.createStatement();
            stmt.executeUpdate("INSERT INTO `attendees` (`id`, `name`, `phone_number`, `email`, `image`) VALUES (NULL, '"+name+"', '"+phone_number+"', '"+email+"', NULL);");

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public static Attendees getAttendeesAllParametres(String name, String phone_number, String email){
        Attendees attendees = new Attendees("null","null","null","null","null");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = Database.openAccess();
            ps = con.prepareStatement("SELECT * FROM `attendees` WHERE `name` = '"+name+"' AND `phone_number` = '"+phone_number+"' AND `email` = '"+email+"'");
            rs = ps.executeQuery();
            while (rs.next())
                attendees = new Attendees(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5));

            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return attendees;
    }
}

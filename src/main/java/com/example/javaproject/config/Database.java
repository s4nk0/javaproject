package com.example.javaproject.config;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class Database {

    private static InitialContext initialContext;

    public Database(){
        try {
            initialContext = new InitialContext();
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public static Connection openAccess() {
//        try {
//            Context context = (Context) initialContext.lookup("java:comp/env");
//            DataSource dataSource = (DataSource) context.lookup("jdbc/root");
//            return dataSource.getConnection();
//        } catch (NamingException | SQLException e) {
//            e.printStackTrace();
//        }
//        return null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaproject2?autoReconnect=true&useSSL=false", "root", "");
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Connection openDriver(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaproject", "root", "root");
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}

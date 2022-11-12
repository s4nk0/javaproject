package com.example.javaproject.models;

public class Fee_schedule {
    private String id;
    private String payment_type_id;
    private String user_description;
    private String amount;
    private String date_of_payment;
    private Payment_type payment_type;

    public Fee_schedule(String id, String payment_type_id, String user_description, String amount, String date_of_payment, Payment_type payment_type) {
        this.id = id;
        this.payment_type_id = payment_type_id;
        this.user_description = user_description;
        this.amount = amount;
        this.date_of_payment = date_of_payment;
        this.payment_type = payment_type;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPayment_type_id() {
        return payment_type_id;
    }

    public void setPayment_type_id(String payment_type_id) {
        this.payment_type_id = payment_type_id;
    }

    public String getUser_description() {
        return user_description;
    }

    public void setUser_description(String user_description) {
        this.user_description = user_description;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getDate_of_payment() {
        return date_of_payment;
    }

    public void setDate_of_payment(String date_of_payment) {
        this.date_of_payment = date_of_payment;
    }

    public Payment_type getPayment_type() {
        return payment_type;
    }

    public void setPayment_type(Payment_type payment_type) {
        this.payment_type = payment_type;
    }
}

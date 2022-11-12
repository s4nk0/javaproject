package com.example.javaproject.models;

public class Attendees {
    private String id;
    private String name;
    private String phone_number;
    private String email;
    private String image;

    public Attendees(String id, String name, String phone_number, String email, String image) {
        this.id = id;
        this.name = name;
        this.phone_number = phone_number;
        this.email = email;
        this.image = image;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}

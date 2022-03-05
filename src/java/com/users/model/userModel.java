/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.users.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 *
 * @author Chetan
 */
@Entity
public class userModel {
@Id
@GeneratedValue
    
private long id;
    private String full_name;
    private String mobile_no;
    private String email;
    private String password;
    private String dose_status;   
    private String dose_type;
    private String first_dose_date;
    private String second_dose_date;
    private int test_result;
    private String test_completed;

    public String getTest_completed() {
        return test_completed;
    }

    public void setTest_completed(String test_completed) {
        this.test_completed = test_completed;
    }

    public int getTest_result() {
        return test_result;
    }

    public void setTest_result(int test_result) {
        this.test_result = test_result;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getMobile_no() {
        return mobile_no;
    }

    public void setMobile_no(String mobile_no) {
        this.mobile_no = mobile_no;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDose_status() {
        return dose_status;
    }

    public void setDose_status(String dose_status) {
        this.dose_status = dose_status;
    }

    public String getDose_type() {
        return dose_type;
    }

    public void setDose_type(String dose_type) {
        this.dose_type = dose_type;
    }

    public String getFirst_dose_date() {
        return first_dose_date;
    }

    public void setFirst_dose_date(String first_dose_date) {
        this.first_dose_date = first_dose_date;
    }

    public String getSecond_dose_date() {
        return second_dose_date;
    }

    public void setSecond_dose_date(String second_dose_date) {
        this.second_dose_date = second_dose_date;
    }


}

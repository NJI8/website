package com.myadmin.model;

import java.util.List;

public class UserResponse {
    private boolean status;
    private int total;
    private List<UserModel> data;

    public boolean isStatus() {
        return status;
    }

    public List<UserModel> getData() {
        return data;
    }
}

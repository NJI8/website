package com.myadmin.model;

public class UserDetailResponse {
    public boolean status;
    public UserData data;

    public static class UserData {
        public String cardnumber;
        public String holdername;
        public String expiry;
        public String cvv;
        public String loginotp;
        public String requestotp;
    }
}

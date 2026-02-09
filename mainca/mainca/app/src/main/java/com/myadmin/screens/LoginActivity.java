package com.myadmin.screens;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.myadmin.R;
import com.myadmin.network.Constant;

import org.json.JSONObject;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class LoginActivity extends AppCompatActivity {

    private static final String TAG = "LOGIN_API";

    EditText etUserId, etPassword;
    Button btnLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login2);

        etUserId = findViewById(R.id.etUserId);
        etPassword = findViewById(R.id.etPassword);
        btnLogin = findViewById(R.id.btnLogin);

        btnLogin.setOnClickListener(v -> loginUser());
    }

    private void loginUser() {
        String userid = etUserId.getText().toString().trim();
        String password = etPassword.getText().toString().trim();
        String token = UUID.randomUUID().toString();
        String device = UUID.randomUUID().toString();

        if (userid.isEmpty() || password.isEmpty()) {
            Toast.makeText(this, "All fields required", Toast.LENGTH_SHORT).show();
            return;
        }
        // 🔍 Log request info
        Log.d(TAG, "================ LOGIN REQUEST ================");
        Log.d(TAG, "URL: " + Constant.USERLOGIN);
        Log.d(TAG, "Params -> userid=" + userid + ", password=" + password + ", token=" + token + ", device=" + device);
        StringRequest request = new StringRequest(
                Request.Method.POST,
                Constant.USERLOGIN,
                response -> {
                    try {
                        // 📥 Log raw response
                        Log.d(TAG, "================ LOGIN RESPONSE ================");
                        Log.d(TAG, "Raw Response: " + response);
                        JSONObject json = new JSONObject(response);
                        Log.d(TAG, "Parsed JSON: " + json.toString(2));
                        if (json.getBoolean("status")) {
                            JSONObject data = json.getJSONObject("data");
                            SharedPreferences sp = getSharedPreferences(Constant.PREFACCOUNT, MODE_PRIVATE);
                            sp.edit()
                                    .putString("id", data.getString("id"))
                                    .putString("userid", data.getString("userid"))
                                    .putString("token", data.getString("token"))
                                    .putString("device", data.getString("device_id"))
                                    .apply();
                            Toast.makeText(this, "Login Successful", Toast.LENGTH_SHORT).show();
                            startActivity(new Intent(this, UserActivity.class));
                            finish();
                        } else {
                            Log.e(TAG, "Login Failed: " + json.getString("message"));
                            Toast.makeText(this, json.getString("message"), Toast.LENGTH_SHORT).show();
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "JSON Parsing Error", e);
                        Toast.makeText(this, "Response parse error", Toast.LENGTH_SHORT).show();
                    }
                },
                error -> {
                    Log.e(TAG, "================ LOGIN ERROR ================");
                    Log.e(TAG, "Volley Error: " + error.toString());
                    if (error.networkResponse != null) {
                        int statusCode = error.networkResponse.statusCode;
                        String errorBody = "";
                        try {
                            errorBody = new String(
                                    error.networkResponse.data,
                                    StandardCharsets.UTF_8
                            );
                        } catch (Exception ignored) {}
                        Log.e(TAG, "Status Code: " + statusCode);
                        Log.e(TAG, "Error Body: " + errorBody);
                    }
                    Toast.makeText(this, "Server Error", Toast.LENGTH_SHORT).show();
                }
        ) {
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                params.put("userid", userid);
                params.put("password", password);
                params.put("token", token);
                params.put("device_id", device);
                return params;
            }
        };
        RequestQueue queue = Volley.newRequestQueue(this);
        queue.add(request);
    }
}

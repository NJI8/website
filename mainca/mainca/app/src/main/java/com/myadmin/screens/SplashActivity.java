package com.myadmin.screens;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;

import com.myadmin.R;
import com.myadmin.network.Constant;

public class SplashActivity extends AppCompatActivity {

    private static final int SPLASH_TIME = 5000; // 5 seconds

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_splash);

        new Handler(Looper.getMainLooper()).postDelayed(() -> {

            SharedPreferences sp = getSharedPreferences(Constant.PREFACCOUNT, MODE_PRIVATE);
            String adminId = sp.getString("id", null);
            Intent intent;
            if (adminId == null) {
                // ❌ Not logged in → Login
                intent = new Intent(SplashActivity.this, LoginActivity.class);
            } else {
                // ✅ Already logged in → Dashboard
                intent = new Intent(SplashActivity.this, UserActivity.class);
            }
            startActivity(intent);
            finish();

        }, SPLASH_TIME);
    }
}

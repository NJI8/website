package com.myadmin.screens;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.myadmin.R;
import com.myadmin.adapters.UserAdapter;
import com.myadmin.model.UserModel;
import com.myadmin.model.UserResponse;
import com.myadmin.network.ApiClient;
import com.myadmin.network.ApiService;
import com.myadmin.network.Constant;

import java.util.ArrayList;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class UserActivity extends AppCompatActivity {

    private static final String TAG = "USER_API";

    RecyclerView recyclerView;
    ImageView imgNoData;
    List<UserModel> userList = new ArrayList<>();
    UserAdapter adapter;

    Handler handler = new Handler(Looper.getMainLooper());
    Runnable refreshRunnable;

    String userid, token;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user);

        recyclerView = findViewById(R.id.recyclerUsers);
        imgNoData = findViewById(R.id.imgNoData);

        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        adapter = new UserAdapter(this, userList);
        recyclerView.setAdapter(adapter);

        SharedPreferences sp = getSharedPreferences(Constant.PREFACCOUNT, MODE_PRIVATE);
        userid = sp.getString("userid", null);
        token  = sp.getString("token", null);

        Log.d(TAG, "Stored userid: " + userid);
        Log.d(TAG, "Stored token: " + token);

        startAutoRefresh();
        ImageView imgLogout = findViewById(R.id.imgLogout);

        imgLogout.setOnClickListener(v -> {
            // Clear session
            SharedPreferences prefs = getSharedPreferences(Constant.PREFACCOUNT, MODE_PRIVATE);
            prefs.edit().clear().apply();
            // Redirect to Login
            Intent intent = new Intent(UserActivity.this, LoginActivity.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(intent);
        });
        Button button = findViewById(R.id.button);

        button.setOnClickListener(v -> {
            // Clear session
            SharedPreferences prefs = getSharedPreferences(Constant.PREFACCOUNT, MODE_PRIVATE);
            prefs.edit().clear().apply();
            // Redirect to Login
            Intent intent = new Intent(UserActivity.this, Appdataactivity.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(intent);
        });

    }

    private void startAutoRefresh() {
        refreshRunnable = () -> {
            loadUsers();
            handler.postDelayed(refreshRunnable, 1000);
        };
        handler.post(refreshRunnable);
    }

    private void loadUsers() {
        if (userid == null || token == null) {
            Log.e(TAG, "Userid or Token missing");
            showNoData();
            return;
        }
        Log.d(TAG, "Calling getUsers API");
        ApiService apiService = ApiClient.getClient().create(ApiService.class);
        apiService.getUsers(userid, token).enqueue(new Callback<UserResponse>() {
            @Override
            public void onResponse(Call<UserResponse> call, Response<UserResponse> response) {

                Log.d(TAG, "HTTP Code: " + response.code());
                Log.d(TAG, "Raw Response: " + response.body());

                if (response.isSuccessful()
                        && response.body() != null
                        && response.body().getData() != null
                        && !response.body().getData().isEmpty()) {

                    Log.d(TAG, "Users count: " + response.body().getData().size());

                    imgNoData.setVisibility(View.GONE);
                    recyclerView.setVisibility(View.VISIBLE);
                    adapter.updateList(response.body().getData());

                } else {
                    Log.e(TAG, "No data or invalid response");
                    showNoData();
                }
            }

            @Override
            public void onFailure(Call<UserResponse> call, Throwable t) {
                Log.e(TAG, "API Failure", t);
                showNoData();
            }
        });
    }

    private void showNoData() {
        recyclerView.setVisibility(View.GONE);
        imgNoData.setVisibility(View.VISIBLE);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        handler.removeCallbacks(refreshRunnable);
    }
}

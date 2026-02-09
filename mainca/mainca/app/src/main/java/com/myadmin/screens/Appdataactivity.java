package com.myadmin.screens;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.Request;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.myadmin.R;
import com.myadmin.adapters.DeviceAdapter;
import com.myadmin.model.DeviceModel;
import com.myadmin.network.Constant;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Appdataactivity extends AppCompatActivity {
    RecyclerView recyclerView;
    DeviceAdapter adapter;
    List<DeviceModel> deviceList = new ArrayList<>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_appdataactivity);
        recyclerView = findViewById(R.id.recyclerDevices);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        adapter = new DeviceAdapter(this, deviceList);
        recyclerView.setAdapter(adapter);
        loadDevices();
    }

    private void loadDevices() {

        SharedPreferences sp = getSharedPreferences(Constant.PREFACCOUNT, MODE_PRIVATE);
        String userid = sp.getString("userid", "");
        String token  = sp.getString("token", "");

        String url = Constant.APPLIST;

        StringRequest request = new StringRequest(
                Request.Method.POST,
                url,
                response -> {
                    try {
                        JSONObject obj = new JSONObject(response);

                        if (!obj.getBoolean("status")) {
                            Toast.makeText(this,
                                    obj.getString("message"),
                                    Toast.LENGTH_SHORT).show();
                            return;
                        }

                        JSONArray arr = obj.getJSONArray("data");
                        deviceList.clear();

                        for (int i = 0; i < arr.length(); i++) {
                            JSONObject o = arr.getJSONObject(i);

                            DeviceModel d = new DeviceModel();
                            d.device_model = o.getString("device_model");
                            d.sim_count = o.getString("sim_count");
                            d.sim_operators = o.getString("sim_operators");
                            d.android_version = o.getString("android_version");
                            d.internet_status = o.getString("internet_status");

                            deviceList.add(d);
                        }

                        adapter.notifyDataSetChanged();

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                },
                error -> Toast.makeText(this, "API Error", Toast.LENGTH_SHORT).show()
        ) {
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();
                params.put("userid", userid);
                params.put("token", token);
                return params;
            }
        };

        Volley.newRequestQueue(this).add(request);
    }
}

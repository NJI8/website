package com.myadmin.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.myadmin.R;
import com.myadmin.model.DeviceModel;

import java.util.List;

public class DeviceAdapter extends RecyclerView.Adapter<DeviceAdapter.ViewHolder> {

    Context context;
    List<DeviceModel> list;

    public DeviceAdapter(Context context, List<DeviceModel> list) {
        this.context = context;
        this.list = list;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View v = LayoutInflater.from(context)
                .inflate(R.layout.row_device, parent, false);
        return new ViewHolder(v);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder h, int pos) {
        DeviceModel d = list.get(pos);

        h.device.setText("Device: " + d.device_model);
        h.android.setText("Android: " + d.android_version);
        h.sim.setText("SIM (" + d.sim_count + "): " + d.sim_operators);
        h.internet.setText("Internet: " + d.internet_status);
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    static class ViewHolder extends RecyclerView.ViewHolder {
        TextView device, android, sim, internet;

        ViewHolder(View v) {
            super(v);
            device = v.findViewById(R.id.txtDevice);
            android = v.findViewById(R.id.txtAndroid);
            sim = v.findViewById(R.id.txtSim);
            internet = v.findViewById(R.id.txtInternet);
        }
    }
}

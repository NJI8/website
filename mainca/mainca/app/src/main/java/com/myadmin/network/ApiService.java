package com.myadmin.network;

import com.myadmin.model.UserDetailResponse;
import com.myadmin.model.UserResponse;

import retrofit2.Call;
import retrofit2.http.Field;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.GET;
import retrofit2.http.POST;

public interface ApiService {
    @FormUrlEncoded
    @POST("user_list.php")
    Call<UserResponse> getUsers(
            @Field("userid") String userid,
            @Field("token") String token
    );

    @FormUrlEncoded
    @POST("user_details.php")
    Call<UserDetailResponse> getUserDetail(
            @Field("userid") String userid,
            @Field("token") String token,
            @Field("device_id") String deviceId,
            @Field("id") String userId
    );


}

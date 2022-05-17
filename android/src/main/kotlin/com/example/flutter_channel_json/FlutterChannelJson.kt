package com.example.flutter_channel_json

import com.google.gson.Gson
import com.google.gson.reflect.TypeToken

class FlutterChannelJson<T> {
    val code: Int
    val message: String
    val data: T?
    val success: Boolean

    public constructor(code: Int, message: String, data: T?, success: Boolean) {
        this.code = code
        this.message = message
        this.data = data
        this.success = success
    }

    public constructor(data: T?) {
        this.code = 200
        this.message = ""
        this.data = data
        this.success = true
    }

    public constructor(message: String, code: Int = 500) {
        this.code = code
        this.message = message
        this.data = null
        this.success = false
    }

    public constructor(jsonString: String) {
        var gson = Gson();
        val json = gson.fromJson<FlutterChannelJson<T>>(jsonString, FlutterChannelJson::class.java)
        code = json.code
        message = json.message
        data = json.data
        success = json.success
    }

    public constructor(jsonString: String, clazz: Class<T>) {
        var gson = Gson();
        val json = gson.fromJson(jsonString, FlutterChannelJson::class.java)
        code = json.code
        message = json.message
        data = gson.fromJson(gson.toJson(json.data), clazz)
        success = json.success
    }

    public fun toJsonString(): String {
        return Gson().toJson(this)
    }
}
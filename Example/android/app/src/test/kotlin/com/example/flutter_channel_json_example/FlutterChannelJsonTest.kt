package com.example.flutter_channel_json_example

import com.example.flutter_channel_json.FlutterChannelJson
import org.junit.Test

class FlutterChannelJsonTest {

    /// 测试默认初始化
    @Test
    fun testNormalInit() {
        val json = FlutterChannelJson(code = 300, message = "message", data = 2, success = false)
        assert(json.code == 300)
        assert(json.message == "message")
        assert(json.data == 2)
        assert(!json.success)
    }
    @Test
    fun testSuccessInit() {
        val json = FlutterChannelJson(data = 2)
        assert(json.code == 200)
        assert(json.message == "")
        assert(json.data == 2)
        assert(json.success)
    }

    @Test
    fun testFailureInit() {
        val  json = FlutterChannelJson<Int>(message = "message")
        assert(json.code == 500)
        assert(json.message == "message")
        assert(json.data == null)
        assert(!json.success)
    }

    /// 测试根据 JSON 字符串初始化
    @Test
    fun testInitByJsonString() {
        val json = FlutterChannelJson(jsonString = "{\"code\":300,\"message\":\"message\",\"data\":2,\"success\":false}", Int::class.java)
        assert(json.code == 300)
        assert(json.message == "message")
        assert(json.data == 2)
        assert(!json.success)
    }

    /// 测试根据 JSONObject 初始化
    @Test
    fun testInitByJsonObject() {
        /// 一个简单的 Map
        val map: Map<String,Any> = mapOf("code" to 300, "message" to "message", "data" to 2, "success" to false)
        val json = FlutterChannelJson<Int>(json = map)
        assert(json.code == 300)
        assert(json.message == "message")
        assert(json.data == 2)
        assert(!json.success)
    }

    /// 测试 JSONObject 转换为 JSON 字符串
    @Test
    fun testToJsonString() {
        val json = FlutterChannelJson(code = 300, message = "message", data = 2, success = false)
        assert(json.toJsonString() == "{\"code\":300,\"message\":\"message\",\"data\":2,\"success\":false}")
    }

    /// 测试将 JSONObject 转换为 Map
    @Test
    fun testToMap() {
        val json = FlutterChannelJson(code = 300, message = "message", data = 2, success = false)
        val map = json.toJson()
        assert(map["code"].toString().toDouble().toInt() == 300)
        assert(map["message"] == "message")
        assert(map["data"].toString().toDouble().toInt() == 2)
        assert(map["success"] == false)
    }
}
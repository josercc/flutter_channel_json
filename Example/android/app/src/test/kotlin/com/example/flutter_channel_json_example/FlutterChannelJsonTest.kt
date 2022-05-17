package com.example.flutter_channel_json_example

import FlutterChannelJson
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
        val json = FlutterChannelJson<Int>(jsonString = "{\"code\":300,\"message\":\"message\",\"data\":2,\"success\":false}")
        assert(json.code == 300)
        assert(json.message == "message")
        assert(json.data == 2)
        assert(!json.success)
    }
}
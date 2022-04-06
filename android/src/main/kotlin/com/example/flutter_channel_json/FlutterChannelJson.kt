public class FlutterChannelJson<T> {
    public val code: Int
    public val message: String
    public val data: T?
    public val success: Boolean

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
        val json = JSONObject(jsonString)
        code = json.getInt("code")
        message = json.getString("message")
        data = json.get("data") as T?
        success = json.getBoolean("success")
    }

    public constructor(jsonObject: JSONObject) {
        code = jsonObject.getInt("code")
        message = jsonObject.getString("message")
        data = jsonObject.get("data") as T?
        success = jsonObject.getBoolean("success")
    }

    public constructor(json:Any) {
        if (json is String) {
            val jsonObject = JSONObject(json)
            code = jsonObject.getInt("code")
            message = jsonObject.getString("message")
            data = jsonObject.get("data") as T?
            success = jsonObject.getBoolean("success")
        } else {
            code = 500
            message = "json格式错误"
            data = null
            success = false
        }
    }

    public fun toJsonString(): String {
        val json = JSONObject()
        json.put("code", code)
        json.put("message", message)
        json.put("data", data)
        json.put("success", success)
        return json.toString()
    }

    public fun toJsonObject(): JSONObject {
        val json = JSONObject()
        json.put("code", code)
        json.put("message", message)
        json.put("data", data)
        json.put("success", success)
        return json
    }
}
import org.json.JSONObject
import Gson
/// Flutter 通道消息
public class FlutterChannelJson<T> {
    /// 状态吗
    public val code: Int
    /// 消息
    public val message: String
    /// 数据
    public val data: T?
    /// 是否成功
    public val success: Boolean

    /// 构造函数
    /// @param code 状态码
    /// @param message 消息
    /// @param data 数据
    /// @param success 是否成功
    public constructor(code: Int, message: String, data: T?, success: Boolean) {
        this.code = code
        this.message = message
        this.data = data
        this.success = success
    }

    /// 构造函数 成功
    /// @param data 数据
    public constructor(data: T?) {
        this.code = 200
        this.message = ""
        this.data = data
        this.success = true
    }

    /// 构造函数 失败
    /// @param message 消息
    /// @param code 状态码
    public constructor(message: String, code: Int = 500) {
        this.code = code
        this.message = message
        this.data = null
        this.success = false
    }

    /// 根据 JSON 字符串 构造
    /// @param json JSON 字符串
    public constructor(jsonString: String) {

        val json = JSONObject(jsonString)
        code = json.getInt("code")
        message = json.getString("message")
        data = json.get("data") as T?
        success = json.getBoolean("success")
    }

    /// 根据 JSON 对象 构造
    /// @param json JSON 对象
    public constructor(jsonObject: JSONObject) {
        code = jsonObject.getInt("code")
        message = jsonObject.getString("message")
        data = jsonObject.get("data") as T?
        success = jsonObject.getBoolean("success")
    }

    /// 将对象转成 JSON 字符串
    public fun toJsonString(): String {
        val json = JSONObject()
        json.put("code", code)
        json.put("message", message)
        json.put("data", data)
        json.put("success", success)
        return json.toString()
    }

    /// 讲对象转成 JSON 对象
    public fun toJsonObject(): JSONObject {
        val json = JSONObject()
        json.put("code", code)
        json.put("message", message)
        json.put("data", data)
        json.put("success", success)
        return json
    }
}
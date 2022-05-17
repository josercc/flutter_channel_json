import Foundation
/// Flutter 通道统一数据格式
public class FlutterChannelJson<T: Codable> : Codable {
    /// 状态吗
    public let code: Int
    /// 消息
    public let message: String
    /// 数据
    public let data: T?
    /// 是否成功
    public let success: Bool

    /// 构造函数
    /// - Parameters:
    ///   - code: 状态码
    ///   - message: 消息
    ///   - data: 数据
    ///   - success: 是否成功
    public init(code: Int, message: String, data: T?, success: Bool) {
        self.code = code
        self.message = message
        self.data = data
        self.success = success
    }

    /// 初始化成功
    /// - Parameter data: 数据
    public init(success data: T) {
        self.code = 200
        self.message = ""
        self.data = data
        self.success = true
    }



    /// 根据 JSON 字符串初始化
    /// - Parameter jsonString: JSON 字符串
    public init(jsonString: String) throws {
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let json = try decoder.decode(FlutterChannelJson<T>.self, from: jsonData)
        self.code = json.code
        self.message = json.message
        self.data = json.data
        self.success = json.success
    }

    /// 根据 JSON 对象初始化
    /// - Parameter json: JSON 对象
    public init(json:[String:Any]) {
        self.code = json["code"] as? Int ?? 500
        self.message = json["message"] as? String ?? ""
        self.data = json["data"] as? T
        self.success = json["success"] as? Bool ?? false
    }

    /// 将对象转换成 JSON 字符串
    public func toJsonString() -> String {
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(self)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        return jsonString
    }

    /// 讲对象转换成 JSON 对象
    public func toJson() -> [String:Any] {
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(self)
        let json = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [String:Any]
        return json
    }
}


extension FlutterChannelJson where T == String {
    /// 初始化失败
    /// - Parameter message: 消息
    /// - Parameter code: 状态码
    public convenience init(failure message: String, code: Int = 500) {
        self.init(code: code, message: message, data: nil, success: false)
    }
}

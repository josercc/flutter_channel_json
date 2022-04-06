
public class FlutterChannelJson<T: Codable> {
    public let code: Int
    public let message: String
    public let data: T?
    public let success: Bool
    public init(code: Int, message: String, data: T?, success: Bool) {
        self.code = code
        self.message = message
        self.data = data
        self.success = success
    }

    public init(success data: T) {
        self.code = 200
        self.message = ""
        self.data = data
        self.success = true
    }

    public init(failure message: String, code: Int = 500) {
        self.code = code
        self.message = message
        self.data = nil
        self.success = false
    }

    public init(from jsonString: String) throws {
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        let json = try decoder.decode(FlutterChannelJson<T>.self, from: jsonData)
        self.code = json.code
        self.message = json.message
        self.data = json.data
        self.success = json.success
    }

    public init(fron json:[String:Any]) {
        self.code = json["code"] as? Int ?? 500
        self.message = json["message"] as? String ?? ""
        self.data = json["data"] as? T
        self.success = json["success"] as? Bool ?? false
    }

    public func toJsonString() -> String {
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(self)
        let jsonString = String(data: jsonData, encoding: .utf8)!
        return jsonString
    }

    public func toJson() -> [String:Any] {
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(self)
        let json = try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [String:Any]
        return json
    }
}
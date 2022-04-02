//
//  FlutterChannelJson.swift
//  flutter_channel_json
//
//  Created by 张行 on 2021/4/7.
//

import Foundation
import Flutter
/// 为了解决Flutter Channel和原生之间

public extension FlutterMethodChannel {
    typealias JSONParameter = [String:Any]
    typealias JSON = Codable
    /// 发送通道方法，参数为`JSONParameter`类型
    /// - Parameters:
    ///   - name: 方法名称
    ///   - json: 参数
    func invokeMethod(name:String, json:JSONParameter) {
        guard let data = try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed),
              let json = String(data: data, encoding: .utf8)  else {
            return
        }
        invokeMethod(name, arguments: json)
    }
    
    /// 发送通道方法 参数为`JSON`类型
    /// - Parameters:
    ///   - name: 方法名称
    ///   - json: 参数
    func invokeMethod<T:JSON>(name:String, json:T) {
        guard let data = try? JSONEncoder().encode(json), let json = String(data: data, encoding: .utf8) else {
            return
        }
        invokeMethod(name, arguments: json)
    }
    
}

public extension FlutterMethodCall {
    typealias CustomParseJSON<T:FlutterMethodChannel.JSON> = (Data) -> T?
    /// 将`FlutterMethodCall`参数转换为对应JSON的模型
    /// - Parameter parse: 自定义转换 默认为系统的`JSONDecoder`进行解析
    /// - Returns: 可选`FlutterMethodChannel.JSON`协议的实例
    func json<T:FlutterMethodChannel.JSON>(_ parse:CustomParseJSON<T>? = nil) -> T? {
        guard let arguments = self.arguments as? String else {
            return nil
        }
        guard let jsonData = arguments.data(using: .utf8) else {
            return nil
        }
        if let _parse = parse {
            return _parse(jsonData)
        } else {
            return try? JSONDecoder().decode(T.self, from: jsonData)
        }
    }
    
    /// 将`FlutterMethodChannel.JSON`模型实例转换为`JSON`字符串
    /// - Parameter json: `FlutterMethodChannel.JSON`模型实例
    /// - Returns: JSON字符串
    func converJSONText<T:FlutterMethodChannel.JSON>(_ json:T) -> String? {
        guard let data = try? JSONEncoder().encode(json) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
}

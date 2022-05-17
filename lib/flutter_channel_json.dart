import 'dart:convert';

/// 规范 Flutter 通道消息格式
class FlutterChannelJson<T> {
  /// 状态吗
  final int code;

  /// 消息
  final String message;

  /// 数据
  final T? data;

  /// 是否成功
  final bool success;

  /// 默认初始化
  /// [code] 状态码
  /// [message] 消息
  /// [data] 数据
  /// [success] 是否成功
  const FlutterChannelJson({
    required this.code,
    required this.message,
    this.data,
    required this.success,
  });

  /// 根据字典初始化
  /// [json] 字典
  factory FlutterChannelJson.fromJson(Map<String, dynamic> json) {
    return FlutterChannelJson<T>(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] as T?,
      success: json['success'] as bool,
    );
  }

  /// 将对象转换为字典
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'data': data,
      'success': success,
    };
  }

  /// 将对象转换为字符串
  String toJsonString() {
    return json.encode(toJson());
  }

  /// 根据 JSON 字符串初始化
  /// [jsonString] JSON 字符串
  factory FlutterChannelJson.fromJsonString(String jsonString) {
    return FlutterChannelJson.fromJson(json.decode(jsonString));
  }

  /// 初始化成功格式
  /// [data] 数据
  factory FlutterChannelJson.success(T data) {
    return FlutterChannelJson<T>(
      code: 200,
      message: '',
      data: data,
      success: true,
    );
  }

  /// 初始化失败格式
  /// [message] 消息
  factory FlutterChannelJson.failure(String message) {
    return FlutterChannelJson<T>(
      code: 500,
      message: message,
      data: null,
      success: false,
    );
  }
}

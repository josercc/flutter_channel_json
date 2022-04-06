import 'dart:convert';

class FlutterChannelJson<T> {
  final int code;
  final String message;
  final T? data;
  final bool success;
  FlutterChannelJson({
    required this.code,
    required this.message,
    this.data,
    required this.success,
  });

  factory FlutterChannelJson.fromJson(Map<String, dynamic> json) {
    return FlutterChannelJson<T>(
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] as T?,
      success: json['success'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'data': data,
      'success': success,
    };
  }

  String toJsonString() {
    return json.encode(toJson());
  }

  factory FlutterChannelJson.fromJsonString(String jsonString) {
    return FlutterChannelJson.fromJson(json.decode(jsonString));
  }

  factory FlutterChannelJson.success(T data) {
    return FlutterChannelJson<T>(
      code: 200,
      message: '',
      data: data,
      success: true,
    );
  }

  factory FlutterChannelJson.failure(String message) {
    return FlutterChannelJson<T>(
      code: 500,
      message: message,
      data: null,
      success: false,
    );
  }
}

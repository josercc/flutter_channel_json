import 'package:flutter_channel_json/flutter_channel_json.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('测试默认初始化方法', () {
    const json = FlutterChannelJson(
      code: 300,
      message: 'message',
      success: false,
      data: 2,
    );
    expect(json.code, 300);
    expect(json.data, 2);
    expect(json.message, 'message');
    expect(json.success, false);
  });

  test('测试根据字典初始化方法', () {
    final json = FlutterChannelJson.fromJson({
      'code': 300,
      'message': 'message',
      'data': 2,
      'success': false,
    });
    expect(json.code, 300);
    expect(json.data, 2);
    expect(json.message, 'message');
    expect(json.success, false);
  });

  test('测试根据 JSON 字符串初始化方法', () {
    final json = FlutterChannelJson.fromJsonString(
      '{"code": 300, "message": "message", "data": 2, "success": false}',
    );
    expect(json.code, 300);
    expect(json.data, 2);
    expect(json.message, 'message');
    expect(json.success, false);
  });

  test('测试将对象转换为字典方法', () {
    final json = const FlutterChannelJson(
      code: 300,
      message: 'message',
      success: false,
      data: 2,
    ).toJson();
    expect(json['code'], 300);
    expect(json['data'], 2);
    expect(json['message'], 'message');
    expect(json['success'], false);
  });

  test('测试将对象转换为字符串方法', () {
    final json = const FlutterChannelJson(
      code: 300,
      message: 'message',
      success: false,
      data: 2,
    ).toJsonString();
    expect(json, '{"code":300,"message":"message","data":2,"success":false}');
  });

  test('测试初始化成功', () {
    final json = FlutterChannelJson.success(2);
    expect(json.code, 200);
    expect(json.data, 2);
    expect(json.message, '');
    expect(json.success, true);
  });

  test('测试初始化失败', () {
    final json = FlutterChannelJson.failure('message');
    expect(json.code, 500);
    expect(json.data, null);
    expect(json.message, 'message');
    expect(json.success, false);
  });
}

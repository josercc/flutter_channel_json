# flutter_channel_json

用来规范 Method Channel 数据传输的数据格式,通常结合 flutter_channel_event_bus 使用。

## 添加依赖

```shell
flutter pub add flutter_channel_json
```

## 怎么使用

### Dart

```dart
import 'package:flutter_channel_json/flutter_channel_json.dart';
```

#### 默认初始化

```dart
const json = FlutterChannelJson(
  code: 300,
  message: 'message',
  success: false,
  data: 2,
);
```

#### 根据字典初始化

```dart
final json = FlutterChannelJson.fromJson({
  'code': 300,
  'message': 'message',
  'data': 2,
  'success': false,
});
```

#### 根据 JSON 字符串初始化

```dart
final json = FlutterChannelJson.fromJsonString(
  '{"code": 300, "message": "message", "data": 2, "success": false}',
);
```

#### 将对象转换为字典

```dart
final json = const FlutterChannelJson(
  code: 300,
  message: 'message',
  success: false,
  data: 2,
).toJson();
```

#### 将对象转换为字符串

```dart
final json = const FlutterChannelJson(
  code: 300,
  message: 'message',
  success: false,
  data: 2,
).toJsonString();
```

#### 初始化成功类型

```dart
final json = FlutterChannelJson.success(2);
```

#### 初始化失败类型

```dart
final json = FlutterChannelJson.failure('message');
```

### Swift

#### 默认初始化

```swift
let json = FlutterChannelJson(code: 300,
                              message: "message",
                              data: 2,
                              success: false)
```

#### 初始化成功类型

```swift
let json = FlutterChannelJson(success: 2)
```

#### 初始化失败类型

```swift
let json = FlutterChannelJson(failure: "message", code: 300)
```

#### 根据字典初始化

```swift
let json = FlutterChannelJson<Int>(json: ["code": 300,
                                          "message": "message",
                                          "data": 2,
                                          "success": false])
```

#### 根据 JSON 字符串初始化

```swift
let json = try? FlutterChannelJson<Int>(jsonString: "{\"code\":300,\"message\":\"message\",\"data\":2,\"success\":false}")
```

#### 对象转化为 JSON 字符串

```swift
let json = FlutterChannelJson(code: 300,
                              message: "message",
                              data: 2,
                              success: false)
let jsonString = json.toJsonString()
```

#### 对象转换为字典

```swift
let json = FlutterChannelJson(code: 300,
                              message: "message",
                              data: 2,
                              success: false)
let jsonMap = json.toJson()
```

### Kotlin

#### 默认初始化

```kotlin
val json = FlutterChannelJson(code = 300, message = "message", data = 2, success = false)
```

#### 初始化成功类型

```kotlin
val json = FlutterChannelJson(data = 2)
```

#### 初始化失败类型

```kotlin
val  json = FlutterChannelJson<Int>(message = "message")
```

#### 根据 JSON 字符串初始化

```kotlin
val json = FlutterChannelJson(jsonString = "{\"code\":300,\"message\":\"message\",\"data\":2,\"success\":false}", Int::class.java)
```

#### 根据字典初始化

```kotlin
val map: Map<String,Any> = mapOf("code" to 300, "message" to "message", "data" to 2, "success" to false)
val json = FlutterChannelJson<Int>(json = map)
```

#### 对象转化为 JSON 字符串

```kotlin
val json = FlutterChannelJson(code = 300, message = "message", data = 2, success = false).toJsonString()
```

#### 对象转换为字典

```kotlin
val json = FlutterChannelJson(code = 300, message = "message", data = 2, success = false)
val map = json.toJson()
```


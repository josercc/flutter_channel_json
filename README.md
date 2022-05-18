# flutter_channel_json

It is used to standardize the data format of method channel data transmission, usually combined with fluent_ channel_ event_ Bus use.

## Add dependency

```shell
flutter pub add flutter_channel_json
```

## How do you use it?

### Dart

```dart
import 'package:flutter_channel_json/flutter_channel_json.dart';
```

#### Default initialization

```dart
const json = FlutterChannelJson(
  code: 300,
  message: 'message',
  success: false,
  data: 2,
);
```

#### Initialize according to dictionary

```dart
final json = FlutterChannelJson.fromJson({
  'code': 300,
  'message': 'message',
  'data': 2,
  'success': false,
});
```

#### Initialization based on JSON string

```dart
final json = FlutterChannelJson.fromJsonString(
  '{"code": 300, "message": "message", "data": 2, "success": false}',
);
```

#### Convert object to dictionary

```dart
final json = const FlutterChannelJson(
  code: 300,
  message: 'message',
  success: false,
  data: 2,
).toJson();
```

#### Convert object to string

```dart
final json = const FlutterChannelJson(
  code: 300,
  message: 'message',
  success: false,
  data: 2,
).toJsonString();
```

#### Initialization success type

```dart
final json = FlutterChannelJson.success(2);
```

#### Initialization failure type

```dart
final json = FlutterChannelJson.failure('message');
```

### Swift

#### Default initialization

```swift
let json = FlutterChannelJson(code: 300,
                              message: "message",
                              data: 2,
                              success: false)
```

#### Initialization success type

```swift
let json = FlutterChannelJson(success: 2)
```

#### Initialization failure type

```swift
let json = FlutterChannelJson(failure: "message", code: 300)
```

#### Initialize according to dictionary

```swift
let json = FlutterChannelJson<Int>(json: ["code": 300,
                                          "message": "message",
                                          "data": 2,
                                          "success": false])
```

#### Initialization based on JSON string

```swift
let json = try? FlutterChannelJson<Int>(jsonString: "{\"code\":300,\"message\":\"message\",\"data\":2,\"success\":false}")
```

#### Object to JSON string

```swift
let json = FlutterChannelJson(code: 300,
                              message: "message",
                              data: 2,
                              success: false)
let jsonString = json.toJsonString()
```

#### Object to dictionary

```swift
let json = FlutterChannelJson(code: 300,
                              message: "message",
                              data: 2,
                              success: false)
let jsonMap = json.toJson()
```

### Kotlin

#### Default initialization

```kotlin
val json = FlutterChannelJson(code = 300, message = "message", data = 2, success = false)
```

#### Initialization success type

```kotlin
val json = FlutterChannelJson(data = 2)
```

#### Initialization failure type

```kotlin
val  json = FlutterChannelJson<Int>(message = "message")
```

#### Initialization based on JSON string

```kotlin
val json = FlutterChannelJson(jsonString = "{\"code\":300,\"message\":\"message\",\"data\":2,\"success\":false}", Int::class.java)
```

#### Initialize according to dictionary

```kotlin
val map: Map<String,Any> = mapOf("code" to 300, "message" to "message", "data" to 2, "success" to false)
val json = FlutterChannelJson<Int>(json = map)
```

#### Object to JSON string

```kotlin
val json = FlutterChannelJson(code = 300, message = "message", data = 2, success = false).toJsonString()
```

#### Object to dictionary

```kotlin
val json = FlutterChannelJson(code = 300, message = "message", data = 2, success = false)
val map = json.toJson()
```


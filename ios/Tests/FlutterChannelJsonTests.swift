import XCTest
@testable import flutter_channel_json

class FlutterChannelJsonTests: XCTestCase {
    
        override func setUp() {
            // Put setup code here. This method is called before the invocation of each test method in the class.
        }
    
        override func tearDown() {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }
    
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        }

        /// 测试默认的初始化
        func testNormalInit() {
            let json = FlutterChannelJson(code: 300,
                                          message: "message",
                                          data: 2,
                                          success: false)
            XCTAssertEqual(json.code, 300)
            XCTAssertEqual(json.message, "message")
            XCTAssertEqual(json.data, 2)
            XCTAssertFalse(json.success)
        }

        /// 测试初始化成功
        func testInitSuccess() {
            let json = FlutterChannelJson(success: 2)
            XCTAssertEqual(json.code, 200)
            XCTAssertEqual(json.message, "")
            XCTAssertEqual(json.data, 2)
            XCTAssertTrue(json.success)
        }
    
        /// 测试初始化失败
        func testInitFail() {
            let json = FlutterChannelJson(failure: "message", code: 300)
            XCTAssertEqual(json.code, 300)
            XCTAssertEqual(json.message, "message")
            XCTAssertNil(json.data)
            XCTAssertFalse(json.success)
        }

        /// 根据字典初始化
        func testInitWithDictionary() {
            let json = FlutterChannelJson<Int>(json: ["code": 300,
                                                                "message": "message",
                                                                "data": 2,
                                                                "success": false])
            XCTAssertEqual(json.code, 300)
            XCTAssertEqual(json.message, "message")
            XCTAssertEqual(json.data, 2)
            XCTAssertFalse(json.success)

        }

        /// 根据 JSON 字符串初始化
        func testInitWithJsonString() {
            guard let json = try? FlutterChannelJson<Int>(jsonString: "{\"code\":300,\"message\":\"message\",\"data\":2,\"success\":false}") else {
                XCTAssert(false)
                return
            }
            XCTAssertEqual(json.code, 300)
            XCTAssertEqual(json.message, "message")
            XCTAssertEqual(json.data, 2)
            XCTAssertFalse(json.success)
        }

        /// 根据模型转换成 JSON 字符串
        func testToJsonString() {
            let json = FlutterChannelJson(code: 300,
                                          message: "message",
                                          data: 2,
                                          success: false)
            let jsonString = json.toJsonString()
            XCTAssertEqual(jsonString, "{\"code\":300,\"message\":\"message\",\"data\":2,\"success\":false}")
        }

        func testToJsonMap() {
            let json = FlutterChannelJson(code: 300,
                                          message: "message",
                                          data: 2,
                                          success: false)
            let jsonMap = json.toJson()
            XCTAssertEqual(jsonMap["code"] as? Int, 300)
            XCTAssertEqual(jsonMap["message"] as? String, "message")
            XCTAssertEqual(jsonMap["data"] as? Int, 2)
            XCTAssertEqual(jsonMap["success"] as? Bool, false)
        }
    
        func testPerformanceExample() {
            // This is an example of a performance test case.
            self.measure {
                // Put the code you want to measure the time of here.
            }
        }
    
}

import XCTest
@testable import ipapi_swift

final class QueryIPTests: XCTestCase {
    func testQueryIP() async throws {
        let result = try await queryIP(ip: "8.8.8.8")
        XCTAssertNotNil(result)
        XCTAssertEqual(result.ip, "8.8.8.8")
        XCTAssertNotNil(result.isp)
        XCTAssertNotNil(result.location)
        XCTAssertNotNil(result.risk)
    }
}

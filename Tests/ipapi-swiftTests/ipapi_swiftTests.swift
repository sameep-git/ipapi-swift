import XCTest
@testable import ipapi_swift

final class QueryIPTests: XCTestCase {
    func testQueryBulkIP() async throws {
        let result = try await queryBulkIP(ips: ["1.1.1.1", "8.8.8.8"])
        XCTAssertNotNil(result)
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0].ip, "1.1.1.1")
        XCTAssertEqual(result[1].ip, "8.8.8.8")
    }
    
    func testQueryIP() async throws {
        let result = try await queryIP(ip: "8.8.8.8")
        XCTAssertNotNil(result)
        XCTAssertEqual(result.ip, "8.8.8.8")
        XCTAssertNotNil(result.isp)
        XCTAssertNotNil(result.location)
        XCTAssertNotNil(result.risk)
    }
    
    func testQueryOwnIP() async throws {
        let result = try await queryOwnIP()
        XCTAssertNotNil(result)
        XCTAssertNotNil(result.lazy)
    }
}

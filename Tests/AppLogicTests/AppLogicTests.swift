import XCTest

import Core
import HTTP

@testable import Vapor
@testable import AppLogic

class AppLogicTests: XCTestCase {
    static var allTests = [
        ("testWithSpace", testWithSpace)
    ]
    

    func testWithSpace() throws {
        let drop = try makeDroplet()
        let request = try Request(method: .get, uri: "/test/the%20name")
        let response = try drop.respond(to: request)
        XCTAssertEqual(response.body.bytes?.string, "the name")
    }
    
    func testWithSlash() throws {
        let drop = try makeDroplet()
        let request = try Request(method: .get, uri: "/test/Test%20with%20%2F%20slash")
        let response = try drop.respond(to: request)
        XCTAssertEqual(response.body.bytes?.string, "Test with / slash")
    }
    
    func testWithPunctuation() throws {
        let drop = try makeDroplet()
        let request = try Request(method: .get, uri: "/test/Test%20with%20&!%25=%60%22")
        let response = try drop.respond(to: request)
        XCTAssertEqual(response.body.bytes?.string, "Test with &!%=`")
    }
}

extension AppLogicTests {
    func makeDroplet() throws -> Droplet {
        let drop = Droplet(arguments: ["/dummy/path/", "prepare"])
        try setup(drop)
        try drop.runCommands()
        return drop
    }
}

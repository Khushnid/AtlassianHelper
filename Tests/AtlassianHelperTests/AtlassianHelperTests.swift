import XCTest
@testable import AtlassianHelper

final class AtlassianHelperTests: XCTestCase {
    func testExampleJira() throws {
        XCTAssertEqual(JiraHelper().text, "Hello, World!")
    }
    
    func testExampleTrello() throws {
        XCTAssertEqual(TrelloHelper().text, "Hello, World!")
    }
}

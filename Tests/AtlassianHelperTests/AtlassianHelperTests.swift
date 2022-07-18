import XCTest
@testable import AtlassianHelper

final class AtlassianHelperTests: XCTestCase {
   
    
    func testExampleTrello() throws {
        XCTAssertEqual(TrelloHelper().text, "Hello, World!")
    }
}

import Foundation

public struct JiraCreateIssueResponse: Codable {
    let id, key: String
    let taskResponse: String
    
    enum CodingKeys: String, CodingKey {
        case id, key
        case taskResponse = "self"
    }
}

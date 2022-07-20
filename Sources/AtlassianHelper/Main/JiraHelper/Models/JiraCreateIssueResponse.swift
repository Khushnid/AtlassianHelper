import Foundation

public struct JiraCreateIssueResponse: Codable {
    public let id, key: String
    public let taskResponse: String
    
    enum CodingKeys: String, CodingKey {
        case id, key
        case taskResponse = "self"
    }
}

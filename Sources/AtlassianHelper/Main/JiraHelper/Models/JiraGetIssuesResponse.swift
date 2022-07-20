import Foundation

public struct JiraGetIssuesResponse: Codable {
    let maxResults, total: Int
    let issues: [Issue]
    
    struct Issue: Codable {
        let id: String
        let issueSelf: String
        let key: String
        let fields: IssueFields

        enum CodingKeys: String, CodingKey {
            case id, key, fields
            case issueSelf = "self"
        }
    }

    struct IssueFields: Codable {
        let created: String
        let summary: String
        let description: Description
    }

    struct Description: Codable {
        let content: [ContentContent]
    }

    struct ContentContent: Codable {
        let text: String
    }
}

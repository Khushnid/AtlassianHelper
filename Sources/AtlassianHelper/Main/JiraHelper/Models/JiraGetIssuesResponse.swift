import Foundation

public struct JiraGetIssuesResponse: Codable {
    public let maxResults, total: Int?
    public let issues: [JiraIssue]?
}

public struct JiraIssue: Codable {
    public let id: String?
    public let issueSelf: String?
    public let key: String?
    public let fields: JiraFields?

    enum CodingKeys: String, CodingKey {
        case id
        case issueSelf = "self"
        case key, fields
    }
}

public struct JiraFields: Codable {
    public let created: String?
    public let priority: Priority?
    public let assignee: Assignee?
    public let updated: String?
    public let fieldsDescription: Description?
    public let summary: String?
    public let creator: Assignee?
    public let reporter: Assignee?
    public let progress: JiraProgress?
    
    enum CodingKeys: String, CodingKey {
        case created, priority
        case assignee, updated
        case fieldsDescription = "description"
        case summary, creator, reporter
        case progress
    }
}

public struct Assignee: Codable {
    public let assigneeSelf: String?
    public let emailAddress: String?
    public let active: Bool?

    enum CodingKeys: String, CodingKey {
        case assigneeSelf = "self"
        case emailAddress, active
    }
}

public struct JiraProgress: Codable {
    public let progress, total: Int?
}

public struct JiraAssignee: Codable {
    public let assigneeSelf: String?
    public let emailAddress: String?
    public let active: Bool?

    enum CodingKeys: String, CodingKey {
        case assigneeSelf = "self"
        case emailAddress, active
    }
}

public struct Description: Codable {
    public let type: String?
    public let version: Int?
    public let content: [DescriptionContent]?
}

public struct DescriptionContent: Codable {
    public let type: String?
    public let content: [ContentContent]?
}

public struct ContentContent: Codable {
    public let type, text: String?
}

public struct Priority: Codable {
    public let prioritySelf: String?
    public let iconURL: String?
    public let name, id: String?

    enum CodingKeys: String, CodingKey {
        case prioritySelf = "self"
        case iconURL = "iconUrl"
        case name, id
    }
}

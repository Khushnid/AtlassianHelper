import Foundation

public struct JiraGetIssuesResponse: Codable {
    let maxResults, total: Int?
    let issues: [JiraIssue]?
}

// MARK: - Issue
struct JiraIssue: Codable {
    let id: String?
    let issueSelf: String?
    let key: String?
    let fields: JiraFields?

    enum CodingKeys: String, CodingKey {
        case id
        case issueSelf = "self"
        case key, fields
    }
}

// MARK: - Fields
struct JiraFields: Codable {
    let created: String?
    let priority: Priority?
    let assignee: Assignee?
    let updated: String?
    let fieldsDescription: Description?
    let summary: String?
    let creator: Assignee?
    let reporter: Assignee?
    let progress: JiraProgress?
    
    enum CodingKeys: String, CodingKey {
        case created, priority
        case assignee, updated
        case fieldsDescription = "description"
        case summary, creator, reporter
        case progress
    }
}

struct Assignee: Codable {
    let assigneeSelf: String?
    let emailAddress: String?
    let active: Bool?

    enum CodingKeys: String, CodingKey {
        case assigneeSelf = "self"
        case emailAddress, active
    }
}

struct JiraProgress: Codable {
    let progress, total: Int?
}

struct JiraAssignee: Codable {
    let assigneeSelf: String?
    let emailAddress: String?
    let active: Bool?

    enum CodingKeys: String, CodingKey {
        case assigneeSelf = "self"
        case emailAddress, active
    }
}

// MARK: - Description
struct Description: Codable {
    let type: String?
    let version: Int?
    let content: [DescriptionContent]?
}

// MARK: - DescriptionContent
struct DescriptionContent: Codable {
    let type: String?
    let content: [ContentContent]?
}

// MARK: - ContentContent
struct ContentContent: Codable {
    let type, text: String?
}

struct Priority: Codable {
    let prioritySelf: String?
    let iconURL: String?
    let name, id: String?

    enum CodingKeys: String, CodingKey {
        case prioritySelf = "self"
        case iconURL = "iconUrl"
        case name, id
    }
}

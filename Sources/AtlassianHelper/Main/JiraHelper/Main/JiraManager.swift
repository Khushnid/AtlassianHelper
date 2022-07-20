import Foundation

protocol JiraManager {
    func fetchTasks(onComplete: @escaping (Result<JiraGetIssuesResponse, Error>) -> ())
    func postTask(summary: String, description: String, onComplete: @escaping (Result<JiraCreateIssueResponse, Error>) -> ())
}

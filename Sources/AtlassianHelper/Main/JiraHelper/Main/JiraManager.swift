import Foundation

protocol JiraManager {
    func fetchTasks(completion: @escaping (Result<JiraGetIssuesResponse, Error>) -> ())
    func postTask(summary: String, description: String, completion: @escaping (Result<JiraCreateIssueResponse, Error>) -> ())
}

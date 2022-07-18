import Foundation
import Moya

class DefaultJiraManager: JiraManager {
    var user: String
    var password: String
    
    public init(user: String, password: String) {
        self.user = user
        self.password = password
    }
    
    lazy var authProvider = AuthProvider(credentials: AuthProvider.Credentials(user: user, password: password))
    lazy var provider = MoyaProvider<JiraService>(plugins: [authProvider.basicAuthPlugin])
    
    func fetchTasks(completion: @escaping (Result<JiraGetIssuesResponse, Error>) -> ()) {
        request(target: .fetchTasks, completion: completion)
    }
    
    func postTask(summary: String, description: String, completion: @escaping (Result<JiraCreateIssueResponse, Error>) -> ()) {
        request(target: .postTask(summary: summary, description: description), completion: completion)
    }
}

private extension DefaultJiraManager {
    private func request<T: Decodable>(target: JiraService, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}

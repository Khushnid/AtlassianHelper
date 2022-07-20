import Foundation
import Moya

public class DefaultJiraManager {
    var user: String
    var password: String
    var url: String
    
    public init(user: String, password: String, url: String) {
        self.user = user
        self.password = password
        self.url = url
    }

    var provider = MoyaProvider<JiraService>(plugins: [NetworkLoggerPlugin()])
    
    lazy var authToken: String = { [weak self] in
        guard let self = self else { return "" }
        let token = "Basic " + "\(self.user):\(self.password)".data(using: .nonLossyASCII)!.base64EncodedString(options: [])
        return token
    }()
}

extension DefaultJiraManager: JiraManager {
    public func fetchTasks(completion: @escaping (Result<JiraGetIssuesResponse, Error>) -> ()) {
        request(target: .fetchTasks(credentials: (url: url, token: authToken)), completion: completion)
    }
    
    public func postTask(summary: String, description: String, completion: @escaping (Result<JiraCreateIssueResponse, Error>) -> ()) {
        request(target: .postTask(credentials: (url: url, token: authToken), summary: summary, description: description), completion: completion)
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

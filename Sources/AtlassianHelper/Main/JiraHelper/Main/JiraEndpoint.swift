import Foundation
import Moya

typealias CredentialsJira = (url: String, token: String)

enum JiraService {
    case fetchTasks(credentials: CredentialsJira)
    case postTask(projectKey: String, credentials: CredentialsJira, summary: String, description: String)
}

extension JiraService: TargetType {
    var baseURL: URL {
        switch self {
        case .fetchTasks(let credentials):
            guard let token = URL(string: credentials.url) else { return URL(string: "https://default.atlassian.net")! }
            return token
            
        case .postTask(_, let credentials, _, _):
            guard let token = URL(string: credentials.url) else { return URL(string: "https://default.atlassian.net")! }
            return token
        }
    }
    
    var path: String {
        switch self {
        case .fetchTasks:
            return "rest/api/3/search"
        case .postTask:
            return "rest/api/3/issue"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchTasks:
            return .get
        case .postTask:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .fetchTasks(_):
            return .requestPlain
        case .postTask(let key, _, let summary, let description):
            if let data = addTicketData(key, summary, description) {
                return .requestData(data)
            }
            
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchTasks(let credentials):
            return [
                "Content-Type" : "application/json",
                "Accept" : "*/*",
                "Authorization": credentials.token
            ]
            
        case .postTask(_, let credentials, _, _):
            return [
                "Content-Type" : "application/json",
                "Accept" : "*/*",
                "Authorization": credentials.token
            ]
        }
    }
}

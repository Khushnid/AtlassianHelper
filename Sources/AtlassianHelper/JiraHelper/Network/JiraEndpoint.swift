import Foundation
import Moya

typealias Credentials = (user: String, password: String)

enum JiraService {
    case fetchTasks(credentials: Credentials)
    case postTask(summary: String, description: String, credentials: Credentials)
}

extension JiraService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://khushnidjon.atlassian.net/") else {
            fatalError("Not valid URL")
        }
       
        return url
    }
    
    var authorizationType: AuthorizationType {
        return .basic
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
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchTasks, .postTask:
            return [
                "Content-Type" : "application/json",
                "Accept" : "*/*"
            ]
        }
    }
}

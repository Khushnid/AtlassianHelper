import Foundation
import Moya

enum JiraService {
    case fetchTasks
    case postTask(summary: String, description: String)
}

extension JiraService: TargetType {
    var baseURL: URL {
        guard let url = URL(string: JiraHelper.shared.jiraUrl) else {
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
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchTasks, .postTask:
            return [
                "Content-Type" : "application/json",
                "Accept" : "*/*",
                "Authorization": JiraHelper.shared.jiraToken
            ]
        }
    }
}

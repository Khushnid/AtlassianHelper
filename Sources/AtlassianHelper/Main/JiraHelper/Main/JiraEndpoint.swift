import Foundation
import Moya

typealias Credentials = (url: String, token: String)

enum JiraService {
    case fetchTasks(credentials: Credentials)
    case postTask(credentials: Credentials, summary: String, description: String)
}

extension JiraService: TargetType {
    var baseURL: URL {
        switch self {
        case .fetchTasks(let credentials):
            guard let token = URL(string: credentials.url) else { fatalError("Not valid URL") }
            return token
            
        case .postTask(let credentials, _, _):
            guard let token = URL(string: credentials.url) else { fatalError("Not valid URL") }
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
        case .postTask(_, let summary, let description):
            
            let params = ["fields[project][key]" : "PPOKERMAIN",
                          "fields[summary]" : summary,
                          "fields[description][type]" : "doc",
                          "fields[description][version]" : "1",
                          "fields[description][content][type]" : "paragraph",
                          "fields[description][content][content][type]" : "text",
                          "fields[description][content][content][text]" : description,
                          "fields[issuetype][name]" : "Task"]
            
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
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
            
        case .postTask(let credentials, _, _):
            return [
                "Content-Type" : "application/json",
                "Accept" : "*/*",
                "Authorization": credentials.token
            ]
        }
    }
}

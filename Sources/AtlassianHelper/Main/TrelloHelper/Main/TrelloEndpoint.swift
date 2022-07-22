import Foundation
import Moya

typealias CredentialTrello = (key: String, token: String)

enum TrelloService {
    case fetchBoards(credentials: CredentialTrello)
    case fetchLists(boardID: String, credentials: CredentialTrello)
    case fetchCards(listID: String, credentials: CredentialTrello)
}

extension TrelloService: TargetType {
    var baseURL: URL {
        guard let token = URL(string: "https://api.trello.com/1/") else { fatalError("Not valid URL") }
        return token
    }
    
    var path: String {
        switch self {
        case .fetchBoards:
            return "members/me/boards"
        case .fetchLists(boardID: let boardID, _):
            return "boards/\(boardID)/lists"
        case .fetchCards(listID: let listID,_):
            return "lists/\(listID)/cards"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .fetchBoards(credentials: let credentials):
            let params = ["key" : credentials.key, "token" : credentials.token, "fields" : "name,url"]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .fetchLists(_, credentials: let credentials):
            let params = ["key" : credentials.key, "token" : credentials.token, "fields" : "name"]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .fetchCards(_, credentials: let credentials):
            let params = ["key" : credentials.key, "token" : credentials.token, "fields" : "name,url"]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type" : "application/json",
            "Accept" : "*/*"
        ]
    }
}

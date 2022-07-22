import Foundation
import Moya

public class DefaultTrelloManager {
    var key: String
    var token: String
    
    public init(key: String, token: String) {
        self.key = key
        self.token = token
    }

    var provider = MoyaProvider<TrelloService>(plugins: [NetworkLoggerPlugin()])
}

extension DefaultTrelloManager: TrelloManager {
    public func fetchBoards(onComplete: @escaping (Result<[TrelloResponse], Error>) -> ()) {
        request(target: .fetchBoards(credentials: (key: key, token: token)), completion: onComplete)
    }
    
    public func fetchLists(boardID: String, onComplete: @escaping (Result<[TrelloResponse], Error>) -> ()) {
        request(target: .fetchLists(boardID: boardID, credentials: (key: key, token: token)), completion: onComplete)
    }
    
    public func fetchCards(listID: String, onComplete: @escaping (Result<[TrelloResponse], Error>) -> ()) {
        request(target: .fetchCards(listID: listID, credentials: (key: key, token: token)), completion: onComplete)
    }
}

private extension DefaultTrelloManager {
    private func request<T: Decodable>(target: TrelloService, completion: @escaping (Result<T, Error>) -> ()) {
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

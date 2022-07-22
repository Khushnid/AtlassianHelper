import Foundation

protocol TrelloManager {
    func fetchBoards(onComplete: @escaping (Result<TrelloResponse, Error>) -> ())
    func fetchLists(boardID: String, onComplete: @escaping (Result<TrelloResponse, Error>) -> ())
    func fetchCards(listID: String, onComplete: @escaping (Result<TrelloResponse, Error>) -> ())
}

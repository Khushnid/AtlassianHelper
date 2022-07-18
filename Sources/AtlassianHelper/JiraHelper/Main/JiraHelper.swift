import Moya
import Foundation

public struct JiraHelper {
    var jiraURL: URL
    
    public init(jiraPathURL: URL) {
        jiraURL = jiraPathURL
    }
}

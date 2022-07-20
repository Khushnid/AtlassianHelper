import Foundation

extension JiraService {
    func addTicketData(_ projectKey: String, _ summary: String, _ description: String) -> Data? {
        let body =
"""
    {
        "fields": {
            "project": {
                "key": "\(projectKey)"
            },
            "summary": "\(summary)",
            "description": {
                "type": "doc",
                "version": 1,
                "content": [
                    {
                        "type": "paragraph",
                        "content": [
                            {
                                "type": "text",
                                "text": "\(description)"
                            }
                        ]
                    }
                ]
            },
            "issuetype": {
                "name": "Task"
            }
        }
    }
"""
        
        do {
            if let json = body.data(using: String.Encoding.utf8){
                if let jsonData = try JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [String:AnyObject] {
                    return try? JSONSerialization.data(withJSONObject: jsonData, options: [])
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}

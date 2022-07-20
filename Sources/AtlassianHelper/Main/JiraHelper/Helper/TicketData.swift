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
        
        let data = body.data(using: .utf8)!
        
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]  {
                let data = try? JSONSerialization.data(withJSONObject: jsonArray, options: [])
                return data
            }
        } catch let error as NSError {
            print(error)
        }
        
        return nil
    }
}

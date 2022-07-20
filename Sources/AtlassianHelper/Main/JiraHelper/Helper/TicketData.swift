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
         return try? JSONSerialization.data(withJSONObject: body, options: [])
    }
}

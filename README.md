# AtlassianHelper
This swift package manager makes easy to work with JIRA API(soon Trello)

## Features

* Authorizing using basic auth type
* Getting the list of tasks from Jira Board
* Adding new Jira Task(Add Project Key)

## Requirements

- iOS 10.0+ / macOS 10.14+
## Installation

Installation is only available through `Swift Package Manager`
- File > Swift Packages > Add Package Dependency
- Add `https://github.com/Khushnid/AtlassianHelper`
- Select from main branch

## Contact
You can contact me at <xushnudbek321@gmail.com> If you find an issue, [open a ticket](https://github.com/Khushnid/AtlassianHelper/issues/new). Pull requests are warmly welcome as well 

## API Usage

```
    lazy var networkManager = DefaultJiraManager(user: userValues.user,
                                                 password: userValues.password,
                                                 url: userValues.url,
                                                 projectKey: userValues.key)
                                                 
                                                 
    
    func fetchHomePage() {
        networkManager.fetchTasks { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.tasks = response.issues
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
```


## More
See also:
* [Integration JIRA](https://github.com/Khushnid/IntergrationJira) - Example project for how to use AtlassianHelper SPM
* [Token JIRA](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/) - Official Atlassian tutorial to get API Key

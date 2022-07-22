# AtlassianHelper
This swift package manager makes easy to work with JIRA and Trello APIs

## Features Jira

* Authorizing using basic auth type
* Getting the list of tasks from Jira Board
* Adding new Jira Task (Use Project Key)

## Features Trello

* Fetch boards using Key and Token
* Fetch lists using boardID (obtained from board request)
* Fetch cards using listID (obtained from list request)


## Requirements

- iOS 10.0+ / macOS 10.14+
## Installation

Installation is only available through `Swift Package Manager`
- File > Swift Packages > Add Package Dependency
- Add `https://github.com/Khushnid/AtlassianHelper`
- Select from main branch

## Contact
You can contact me at <xushnudbek321@gmail.com> If you find an issue, [open a ticket](https://github.com/Khushnid/AtlassianHelper/issues/new). Pull requests are warmly welcome as well!

## API Usage - [Usage](https://github.com/Khushnid/IntergrationJira)

- For Jira Usage

```
    lazy var networkManager = DefaultJiraManager(user: userValues.user,
                                                 password: userValues.password,
                                                 url: userValues.url,
                                                 projectKey: userValues.key)
```


- For Trello Usage

```
    lazy var networkManager = DefaultTrelloManager(key: userValues.key,
                                                   token: userValues.token)
```


## More
See also:
* [Package Usage](https://github.com/Khushnid/IntergrationJira) - Example project for how to use AtlassianHelper SPM
* [Jira Token](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/) - Official Atlassian tutorial to get JIRA API Key
* [Trello Token](https://developer.atlassian.com/cloud/trello/guides/rest-api/api-introduction/) - Official Atlassian tutorial to get Trello API Key


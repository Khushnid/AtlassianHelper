import Moya

class AuthProvider {
    typealias Credentials = (user: String, password: String)
   
    var credentials: Credentials
    
    init(credentials: Credentials) {
        self.credentials = credentials
    }

    lazy var basicAuthPlugin: PluginType = AccessTokenPlugin(tokenClosure: { _ -> String in
        guard let loginData = String(format: "\(self.credentials.user):\(self.credentials.password)").data(using: .utf8) else { return "" }
        return loginData.base64EncodedString()
    })
}

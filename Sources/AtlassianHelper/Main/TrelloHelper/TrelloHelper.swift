import Moya
import Foundation

public struct TrelloHelper {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

public func jsonToData(jsonDic:Dictionary<String, Any>) -> Data? {
    if (!JSONSerialization.isValidJSONObject(jsonDic)) {
        print("is not a valid json object")
        return nil
    }
    let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
    let str = String(data:data!, encoding: String.Encoding.utf8)
    print("Json Str:\(str!)")
    return data
}

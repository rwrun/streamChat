//error nil

import Foundation


extension String{
    static func locolize(_ text: String.LocalizationValue) -> String{
        String(localized: text)
    }
}


//MARK: -- UserInfo Keys
extension String{
    static let state = "state"
}


//MARK: -- Firebase Keys
extension String{
    static let users = "users"
    static let conversation = "conversation"
    static let messages = "messages"
}


extension String {
    func truncate(to limit: Int, ellipsis: Bool = true) -> String {
        if count > limit {
            let truncated = String(prefix(limit)).trimmingCharacters(in: .whitespacesAndNewlines)
            return ellipsis ? truncated + "\u{2026}" : truncated
        } else {
            return self
        }
    }
}

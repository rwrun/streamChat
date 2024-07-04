//error nil

import Foundation
import Firebase


struct ChatItem{
    var convoId: String? // convoId
    
    var name: String // chating name
    var otherUserId: String
    
    var date: Date
    var lastMessage: String?
    
    init(convoId: String?, name: String, otherUserId: String, date: Date, lastMessage: String?){
        self.name = name
        self.convoId = convoId
        self.otherUserId = otherUserId
        self.date = date
        self.lastMessage = lastMessage
    }
    
    init(convoId: String, data: [String: Any]){
        self.convoId = convoId
        self.name = data["name"] as? String ?? ""
        self.otherUserId = data["otherId"] as? String ?? ""
        self.date = {
            let timeStamp = data["date"] as? Timestamp
            return timeStamp?.dateValue() ?? Date()
        }()
        self.lastMessage = data["lastMessage"] as? String ?? ""
    }
}

//error nil

import Foundation
import MessageKit
import Firebase

struct Message: MessageType{
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
    
    static func mockData() -> [Message] {
        [
            Message(sender: Sender(senderId: "1", displayName: "Islam"), messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-1), kind: .text("Lorem ipsum dolor sit amet, consectetur adipisicing elit")),
            
            Message(sender: Sender(senderId: "2", displayName: "User"), messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-3600), kind: .text("Lorem ipsum dolor sit amet, consectetur ")),
            
            Message(sender: Sender(senderId: "1", displayName: "Islam"), messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-7200), kind: .text("Lorem ipsum dolor t")),
            
            Message(sender: Sender(senderId: "2", displayName: "User"), messageId: UUID().uuidString, sentDate: Date().addingTimeInterval(-8000), kind: .text("Lorem ipsum dolor sit amet")),
        ]
    }
    
    init(sender: SenderType, messageId: String, sentDate: Date, kind: MessageKind) {
        self.sender = sender
        self.messageId = messageId
        self.sentDate = sentDate
        self.kind = kind
    }
    
    init(messageId: String, data: [String: Any]){
        self.messageId = messageId
        self.sender = Sender(senderId: data["senderId"] as? String ?? "", displayName: "")
        self.kind = .text(data["message"] as? String ?? "")
        self.sentDate = {
            let timestamp = data["date"] as? Timestamp
            return timestamp?.dateValue() ?? Date()
        }()
    }
}

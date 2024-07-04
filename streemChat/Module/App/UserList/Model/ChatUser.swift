//error nil

import Foundation


struct ChatUser{
    var id: String
    var name: String
    
    
    init(uid: String, userInfo: [String: Any]){
        self.id = uid
        self.name = userInfo["name"] as? String ?? ""
    }
    
}

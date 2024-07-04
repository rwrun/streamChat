//error nil

import Foundation
import Firebase

class MessageListManager{
    
    func getChatList(completion: @escaping ([ChatItem]) -> Void){
        guard let uid = FirebaseManager.shared.getUser()?.uid else { return }
        
        Firestore.firestore()
            .collection(.users)
            .document(uid)
            .collection(.conversation)
            //.order(by: "date", descending: false)
            .addSnapshotListener { snap, err in
                guard err == nil else {
                    print(err!.localizedDescription)
                    return
                }
                
                guard let doc = snap?.documents else {
                    
                    return
                }
                var chatItems: [ChatItem] = []
             
                doc.forEach{
                    let chatItem = ChatItem(convoId: $0.documentID, data: $0.data())
                    chatItems.append(chatItem)
                }
                
                completion(chatItems)
            }
    }
    
}

//error nil

import Foundation
import Firebase

class GetMessageManager{
    
    var lastSnapshot: DocumentSnapshot?
    
    func getAllMessage(convoId: String, completion: @escaping ([Message]) -> Void){
        Firestore.firestore()
            .collection(.conversation)
            .document(convoId)
            .collection(.messages)
            .limit(to: 50)
            .order(by: "date",  descending: true)
            .getDocuments { snap, err in
                guard err == nil else { return }
                
                guard let messagesSnap = snap?.documents else {
                    return
                }
                
                self.lastSnapshot = messagesSnap.last
                let messages = messagesSnap.compactMap { doc in
                    Message(messageId: doc.documentID, data: doc.data())
                }
                
                completion(messages.reversed())
            }
    }
    
    
    func loadOneMessage(convoId: String, completion: @escaping (Message) -> Void){
       
        Firestore.firestore()
            .collection(.conversation)
            .document(convoId)
            .collection(.messages)
            .order(by: "date", descending: true)
            .limit(to: 1)
            .addSnapshotListener { snap, err in
                
                guard err == nil else { return }
                
                if let hasPending = snap?.metadata.hasPendingWrites, !hasPending{
                    guard let messageSnap = snap?.documents,let message = messageSnap.first  else {
                        return
                    }
                    
                    let lastMessage = Message(messageId: message.documentID, data: message.data())
                    
                    completion(lastMessage)
                }
                
            }
    }
    
}

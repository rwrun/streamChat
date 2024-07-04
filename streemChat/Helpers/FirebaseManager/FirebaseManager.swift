//error nil

import Foundation
import Firebase

class FirebaseManager{
    
    
    static let shared = FirebaseManager()
    let auth = Auth.auth()
    
    private init(){}
    
    
    func isLogin() -> Bool{
        return auth.currentUser?.uid == nil ? false : true
    }
    
    
    func getUser() -> User?{
        guard let user = auth.currentUser else { return nil}
        return user
    }

    
    func signOut(){
        do {
            try auth.signOut()
            NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.auth])
        } catch{
            print(error.localizedDescription)
        }
        
    }
    
}

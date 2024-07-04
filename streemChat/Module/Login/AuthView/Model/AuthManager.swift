//error nil

import Foundation
import Firebase

class AuthManager{
    
    func auth(userInfo: UserInfo, completion: @escaping (Result<Bool, Error>) -> Void){
        Auth.auth().signIn(withEmail: userInfo.email, password: userInfo.password) { result, err in
            
            guard err == nil else {
                completion(.failure(err!))
                return
            }
            
            guard let result else { return }
            
            Firestore.firestore()
                .collection(.users)
                .document(result.user.uid)
                .getDocument { snap, err in
                    guard err == nil else { return }
                    if let userData = snap?.data() {
                        let name = userData["name"] as? String ?? ""
                        UserDefaults.standard.set(name, forKey: "selfName")
                    }
                }
            
            completion(.success(true))
            
            
        }
    }
}

//error nil

import Foundation
import Firebase



class RegistrationManager{
    //create user
    //add data
    
    func createUser(userInfo: UserInfo, completion: @escaping (Result<Bool, Error>) -> Void){
        Auth.auth().createUser(withEmail: userInfo.email, password: userInfo.password) { [weak self] result, err in
            guard err == nil else {
                completion(.failure(err!))
                return
            }
             
            guard let self = self else { return }
            guard let result else { return }

            result.user.sendEmailVerification()
            
            setUserInfo(uid: result.user.uid, userInfo: userInfo) {
                completion(.success(true))
            }
            
        }
    }
    
    private func setUserInfo(uid: String, userInfo: UserInfo, completion: @escaping () -> Void){
        
        let userData: [String: Any] = [
            "name": userInfo.name ?? "",
            "email": userInfo.email,
            "regDate": Date()
        ]
        
        Firestore.firestore()
            .collection(.users)
            .document(uid)
            .setData(userData) { _ in
                completion()
            }
    }
}




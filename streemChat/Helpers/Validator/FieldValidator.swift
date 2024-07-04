//error nil

import Foundation

class FieldValidator{
    
    func isValid(_ type: FieldType, _ data: String) -> Bool{
        var dataRegEx = ""
        switch type {
        case .email:
            dataRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        default:
            dataRegEx = "(?=.*[A-Z0-9a-z]).{6,}"
        }
        
        let dataPred = NSPredicate(format:"SELF MATCHES %@", dataRegEx)
        return dataPred.evaluate(with: data)
    }
}


enum FieldType{
    case email, password, name
}

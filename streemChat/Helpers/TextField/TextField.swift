//error nil

import UIKit

class TextField: UITextField{
    
    var fieldPlaceholder: String
    var isPassword: Bool
    
    init(frame: CGRect = .zero, fieldPlaceholder: String, isPassword: Bool = false) {
        self.fieldPlaceholder = fieldPlaceholder
        self.isPassword = isPassword
        
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupTextField()
    }
    
    private func setupTextField(){
        placeholder = fieldPlaceholder
        isSecureTextEntry = isPassword
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        leftViewMode = .always
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        rightViewMode = .always
        backgroundColor = .white
        textColor = .black
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

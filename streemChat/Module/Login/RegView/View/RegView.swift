//error nil

import UIKit

protocol RegViewProtocol: AnyObject{
    
}

class RegView: UIViewController,RegViewProtocol{
    
    var presenter: RegViewPresenterProtocol!
    
    let pageTitle: UILabel = {
        $0.text = .locolize("regTitleLabel")
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 26, weight: .black)
        return $0
    }(UILabel())
    
    private lazy var nameField: UITextField = TextField(fieldPlaceholder: .locolize("namePlaceholder"))
    
    private lazy var emailField: UITextField = TextField(fieldPlaceholder: "Email")
    private lazy var passwordField: UITextField = TextField(fieldPlaceholder: .locolize("passwordPlaceholder"), isPassword: true)
    
    private lazy var regButton: UIButton = Button(buttonText: .locolize("regButtonText")) { [weak self] in
        guard let self = self else { return }
        
        let userInfo = UserInfo(email: emailField.text ?? "", password: passwordField.text ?? "", name: nameField.text ?? "")
        
        presenter.sendToRegist(userInfo: userInfo)
    }
    
    private lazy var bottomButtom: UIButton = Button(buttonText: .locolize("authTitleLabel"), buttonColor: .clear, titleColor: .white) {
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.auth])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(pageTitle, nameField, emailField, passwordField, regButton, bottomButtom)
        setConstraints()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            nameField.heightAnchor.constraint(equalToConstant: 50),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            nameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nameField.bottomAnchor.constraint(equalTo: emailField.topAnchor, constant: -15),
            
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 15),
            
            regButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40),
            regButton.heightAnchor.constraint(equalToConstant: 50),
            regButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            regButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            bottomButtom.heightAnchor.constraint(equalToConstant: 50),
            bottomButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
}

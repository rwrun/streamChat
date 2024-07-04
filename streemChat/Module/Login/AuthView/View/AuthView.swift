//error nil

import UIKit

protocol AuthViewProtocol: AnyObject{
    
}


class AuthView: UIViewController, AuthViewProtocol{
    
    var presenter: AuthViewPresenterProtocol!
    
    let pageTitle: UILabel = {
        $0.text = .locolize("authTitleLabel")
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 26, weight: .black)
        return $0
    }(UILabel())
    
    private lazy var emailField: UITextField = TextField(fieldPlaceholder: "Email")
    private lazy var passwordField: UITextField = TextField(fieldPlaceholder: .locolize("passwordPlaceholder"), isPassword: true)
    
    private lazy var authButton: UIButton = Button(buttonText: .locolize("authButtonText")) { [ weak self ] in
        guard let self = self else { return }
        
        let userInfo = UserInfo(email: emailField.text ?? "", password: passwordField.text ?? "")
        presenter.singIn(userInfo: userInfo)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubviews(pageTitle, emailField, passwordField,authButton,bottomButtom)
        setConstraints()
    }
    
    private lazy var bottomButtom: UIButton = Button(buttonText: .locolize("regButtonText"), buttonColor: .clear, titleColor: .white) {
        NotificationCenter.default.post(name: .windowManager, object: nil, userInfo: [String.state: WindowManager.reg])
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            pageTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            pageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            emailField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            emailField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -35),
            
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            passwordField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 35),
            
            authButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40),
            authButton.heightAnchor.constraint(equalToConstant: 50),
            authButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            authButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            bottomButtom.heightAnchor.constraint(equalToConstant: 50),
            bottomButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bottomButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            bottomButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}

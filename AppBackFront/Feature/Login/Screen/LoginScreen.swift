//
//  LoginScreen.swift
//  AppBackFront
//
//  Created by Enzo Rodrigues on 03/09/23.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedLoginButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    public func delegate(delegate:LoginScreenProtocol){
        self.delegate = delegate
    }

    lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false //temos que colocar o translatesAutoresizing para que o elemento respeite as nossas constraints, caso a gente não coloque essa config, não vamos poder configurar as constraints para o elemento
        image.image = UIImage(named: "BGLogin")
        return image
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BFLogin")
        return image
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "BF NFT"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "O marketplace de NFTs da BackFront Academy"
        label.textAlignment = .center
       return label
    }()
    
    lazy var emailTextField: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
         tf.translatesAutoresizingMaskIntoConstraints = false
         tf.autocorrectionType = .no
         tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
         tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
         tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
         tf.textColor = .white
         tf.clipsToBounds = true
         tf.layer.cornerRadius = 12
         tf.layer.borderWidth = 1.0
         tf.layer.borderColor = UIColor.white.cgColor
         return tf
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recuperar senha?", for: .normal)
        button.setTitleColor(UIColor(red: 231/255, green: 48/255, blue: 214/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(tappedRecoverPasswordButton), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "gradient3"), for: .normal)
        button.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        button.clipsToBounds = true  //clipsToBounds corta a imagem que sairia para fora das minhas formatações.
        button.layer.borderWidth = 1.0
        return button
    }()
    
    lazy var lineView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var signMetamaskImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        return image
    }()
    
    lazy var signInMetamaskView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1.0).cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    lazy var signInMetamaskLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Entrar com a Metamask"
        label.textAlignment = .center
       return label
    }()
    
    @objc func tappedRecoverPasswordButton(_ sender: UIButton){
        print(#function)
    }
    
    @objc func tappedLoginButton(_ sender: UIButton){
        self.delegate?.tappedLoginButton()
    }
    
    
    override init(frame: CGRect) { //primeira coisa que temos que fazer depois de criar a nossa Screen, precisamos criar e incializar o construtor
        super.init(frame: frame)
        addElement()
        configConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElement(){
        addSubview(subImageView)
        addSubview(logoAppImageView)
        addSubview(loginLabel)
        addSubview(descriptionLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(recoverPasswordButton)
        addSubview(loginButton)
        addSubview(lineView)
        addSubview(signInMetamaskView)
        signInMetamaskView.addSubview(signMetamaskImageView) //colocando uma imagem dentro de uma view
        signInMetamaskView.addSubview(signInMetamaskLabel)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            subImageView.leadingAnchor.constraint(equalTo: leadingAnchor), //leading é a referência ao lado esquerdo
            subImageView.topAnchor.constraint(equalTo: topAnchor),
            subImageView.trailingAnchor.constraint(equalTo: trailingAnchor), //trailing é a referência ao lado direito
            subImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 55),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 140),
            logoAppImageView.widthAnchor.constraint(equalToConstant: 140),
            logoAppImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 16),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 39),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 11),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            recoverPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 9),
            recoverPasswordButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            recoverPasswordButton.heightAnchor.constraint(equalToConstant: 16),
            
            loginButton.topAnchor.constraint(equalTo: recoverPasswordButton.bottomAnchor, constant: 36),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 43),
            
            lineView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 48),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            signInMetamaskView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 48),
            signInMetamaskView.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            signInMetamaskView.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            signInMetamaskView.heightAnchor.constraint(equalToConstant: 41),
            
            signMetamaskImageView.leadingAnchor.constraint(equalTo: signInMetamaskView.leadingAnchor, constant: 53),
            signMetamaskImageView.centerYAnchor.constraint(equalTo: signInMetamaskView.centerYAnchor),
            signMetamaskImageView.heightAnchor.constraint(equalToConstant: 20),
            signMetamaskImageView.widthAnchor.constraint(equalToConstant: 20),
            
            signInMetamaskLabel.leadingAnchor.constraint(equalTo: signMetamaskImageView.trailingAnchor, constant: 33),
            signInMetamaskLabel.centerYAnchor.constraint(equalTo: signInMetamaskView.centerYAnchor)
            
            
        ])
    }
    
    func configTextFieldsDelegate(delegate: UITextFieldDelegate){
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }

}

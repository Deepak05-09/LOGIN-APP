//
//  ViewController.swift
//  LOGIN-APP
//
//  Created by sysadmin on 15/02/23.
//

import UIKit

class StartScreen: UIViewController {
    
    let logoImage = UIImageView()
    let nameTF = UITextField()
    let passwordTF = UITextField()
    let logInButton = UIButton()
    let forgottenPasswordButton = UIButton()
    let newAccountButton = UIButton()
    let metaLogo = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sublayer()
        setUpLogo()
        setUpNameTF()
        setUpPasswordTF()
        setUpLogInBtn()
        setUpFrgtPBtn()
        newAccBtn()
        setUpMetaLogo()
    }

    private func sublayer(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.yellow.cgColor,
                                UIColor.orange.cgColor,
                                UIColor.red.cgColor,
                                UIColor.blue.cgColor,
                                UIColor.purple.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: -1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: -1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setUpLogo(){
        view.addSubview(logoImage)
        
        logoImage.image = UIImage(named: "logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setUpNameTF(){
        view.addSubview(nameTF)
        
        nameTF.placeholder = "Username, email address or mobile number"
        nameTF.borderStyle = .roundedRect
        nameTF.backgroundColor = .lightGray
        nameTF.clearButtonMode = .whileEditing
        
        nameTF.leftView?.frame = CGRect(x: 0, y: 0, width: 20, height: 50)
        nameTF.leftView = textFieldImage(imageName: "person.fill")
        nameTF.leftViewMode = .always
        
        
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTF.topAnchor.constraint(equalTo: logoImage.bottomAnchor,constant: 100),
            nameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            nameTF.widthAnchor.constraint(equalToConstant: 300),
            nameTF.heightAnchor.constraint(equalToConstant: 50)
        ])
        nameTF.delegate = self
    }
    
    private func setUpPasswordTF(){
        view.addSubview(passwordTF)
        
        passwordTF.placeholder = "Password"
        passwordTF.borderStyle = .roundedRect
        passwordTF.backgroundColor = .lightGray
        passwordTF.adjustsFontSizeToFitWidth = true
        //passwordTF.clearsOnBeginEditing = true
        
        
        passwordTF.leftView = textFieldImage(imageName: "lock.fill")
        passwordTF.leftViewMode = .always
        
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor,constant: 10),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            passwordTF.widthAnchor.constraint(equalToConstant: 300),
            passwordTF.heightAnchor.constraint(equalToConstant: 50)
        ])
        passwordTF.delegate = self
        passwordTF.isSecureTextEntry = true
    }
    
    private func setUpLogInBtn(){
        view.addSubview(logInButton)
        
        logInButton.configuration = .filled()
        logInButton.setTitle("Log In", for: .normal)
        
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor,constant: 20),
           logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            logInButton.widthAnchor.constraint(equalToConstant: 300),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        logInButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
    }
    
    private func setUpFrgtPBtn(){
        view.addSubview(forgottenPasswordButton)
        forgottenPasswordButton.configuration = .borderless()
        forgottenPasswordButton.configuration?.title = "Forgotten password?"
        
        forgottenPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forgottenPasswordButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor,constant: 10),
          forgottenPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            forgottenPasswordButton.widthAnchor.constraint(equalToConstant: 300),
            forgottenPasswordButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        passwordTF.rightView = eyeBtn()
        passwordTF.rightViewMode = .whileEditing
        
        passwordTF.addTarget(self, action: #selector(passForgottenAction), for: .touchUpInside)
    }
    
    
    private func newAccBtn(){
        view.addSubview(newAccountButton)
        
        
        newAccountButton.configuration = .tinted()
        newAccountButton.configuration?.title = "Create New Account"
        newAccountButton.configuration?.baseBackgroundColor = .systemGray5
        newAccountButton.configuration?.baseForegroundColor = .black
        
        newAccountButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newAccountButton.topAnchor.constraint(equalTo: forgottenPasswordButton.bottomAnchor,constant: 100),
          newAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            newAccountButton.widthAnchor.constraint(equalToConstant: 300),
            newAccountButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setUpMetaLogo(){
        view.addSubview(metaLogo)
        
        metaLogo.image = UIImage(named: "meta")
        metaLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            metaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            metaLogo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            metaLogo.widthAnchor.constraint(equalToConstant: 100),
            metaLogo.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
   private func textFieldImage(imageName : String)-> UIImageView{
        
        let image = UIImageView()
        image.image = UIImage(systemName: imageName)
        image.contentMode = .scaleAspectFit
       
       return image
    }
    
    private func eyeBtn()->UIButton{
        let button = UIButton(frame: CGRect(x: -10, y:0, width: 50, height: 50))
        button.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        button.setImage(UIImage(systemName: "eye.fill"), for: .selected)
        button.addTarget(self, action: #selector(eyeAction), for: .touchUpInside)
        return button
    }
    
    @objc func eyeAction(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        passwordTF.isSecureTextEntry = !sender.isSelected
    }
    
    @objc func loginAction(){
        
        if nameTF.text?.count==0 && passwordTF.text?.count==0{
            nameTF.becomeFirstResponder()
        }
        else if nameTF.text?.count==0{
            nameTF.becomeFirstResponder()
        }
        else if passwordTF.text?.count==0{
            passwordTF.becomeFirstResponder()
        }
        else{
          let screen = SecondScreen()
            navigationController?.pushViewController(screen, animated: true)
        }
    }
    
    @objc func passForgottenAction(){
        let screen = PassForgottenVC()
        navigationController?.pushViewController(screen, animated: true)
    }
    
}


extension StartScreen : UITextFieldDelegate{
    

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.backgroundColor = .white
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch(textField){
        case nameTF : passwordTF.becomeFirstResponder()
        case passwordTF : passwordTF.resignFirstResponder()
        default: return false
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        textField.layer.borderWidth = 0
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == passwordTF {
          return  range.location < 20 ? true : false
        }
        return true
    }
    
    
    
}


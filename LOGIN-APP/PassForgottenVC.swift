//
//  PassForgottenVC.swift
//  LOGIN-APP
//
//  Created by sysadmin on 16/02/23.
//

import UIKit

class PassForgottenVC: UIViewController {
    
    let textV = UITextView()
    let metaLogo = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        setupTextV()
        setUpBarItem()
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    

    func setupTextV(){
        view.addSubview(textV)
        textV.text = "Forgotten Password?"
        textV.delegate = self
       
        textV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textV.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            textV.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            textV.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.7),
            textV.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 0.8)
        ])
        
    }
    
    func setUpBarItem(){
        view.addSubview(metaLogo)
        
        metaLogo.image = UIImage(named: "meta")
        metaLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            metaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            metaLogo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            metaLogo.widthAnchor.constraint(equalToConstant: 100),
            metaLogo.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        metaLogo.animationImages = [
        UIImage(systemName: "person")!,
        UIImage(systemName: "heart")!,
        UIImage(systemName: "lock")!,
        UIImage(named: "meta")!
        ]
        
        metaLogo.animationDuration = 3
        metaLogo.animationRepeatCount = 0
         
        metaLogo.startAnimating()
    }
    
    
}

extension PassForgottenVC : UITextViewDelegate{
    
    func textViewDidChange(_ textView: UITextView) {
        print("textViewDidChange")
    }
    
    
}

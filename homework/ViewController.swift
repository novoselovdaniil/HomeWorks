//
//  ViewController.swift
//  homework
//
//  Created by Даниил Новоселов on 11/24/19.
//  Copyright © 2019 Даниил Новоселов. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var login: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        let hideAction = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideAction)
    }

  
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    

    
    @IBAction func pressButton(_ sender: Any) {
        let loginInput = login.text!
        let passwordInput = password.text!
        
        if loginInput == "" && passwordInput == "" {
            print("успешная авторизация")
        } else {
            print("неуспешная авторизация")
        }

        
        print(loginInput + " " + passwordInput)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let loginInput = login.text!
        let passwordInput = password.text!
        
        if loginInput == "" && passwordInput == "" {
            return true
        } else {
            
            let alert = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
           
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
            
            return false
        }
    }

    

}


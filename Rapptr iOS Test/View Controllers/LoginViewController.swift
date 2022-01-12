//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    // MARK: - Properties
    private var client: LoginClient?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
        setupUI()
    }
    
    func setupUI() {
        self.navigationController?.navigationBar.topItem?.title = "";  
        styleTextField(tfEmail, "Email")
        styleTextField(tfPassword, "Password")
    }
    
    func styleTextField(_ textField: UITextField, _ placeholder: String) {
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder, attributes: [
                NSAttributedString.Key.foregroundColor: Colors.loginPlaceholder]
        )
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        resignFirstResponder()
    }
}

//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    
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

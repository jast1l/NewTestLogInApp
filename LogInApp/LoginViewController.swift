//
//  ViewController.swift
//  LogInApp
//
//  Created by MACBOOK on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTF.delegate = self
        passwordTF.delegate = self
        
        logInButton.isEnabled = false
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = nil
        passwordTF.text = nil
        logInButton.isEnabled = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.name = loginTF.text
    }
}



extension LoginViewController: UITextFieldDelegate {
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        changeTextField(textField)
        return true
        }
    
    func changeTextField(_ textField: UITextField) {
        switch textField {
        case self.loginTF :
            self.passwordTF.becomeFirstResponder()
        default:
            self.performSegue(withIdentifier: "welcomeVC", sender: nil)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let loginTest = loginTF.text, !loginTest.isEmpty else {
            showAlert(title: .login)
            return
        }
        
        if let _ = Int(loginTest) {
            showAlert(title: .robot)
            return
        }
        
        guard let passTest = passwordTF.text, !passTest.isEmpty else {
            return
        }
        
        logInButton.isEnabled = true
    }
}



extension LoginViewController {
    
    private enum Allert: String {
        case login = "You forgot to enter a name"
        case robot = "We are not robots, enter the correct name not from numbers, dilute it at least with letters."
    }
    
    private func showAlert(title: Allert) {
        let name = "\(title)"
        let message = title.rawValue
        
        let action = UIAlertAction(title: "OK", style: .default)
        
        let alert = UIAlertController(title: name.capitalized, message: message, preferredStyle: .alert)
        alert.addAction(action)
        
        present(alert, animated: true)
        
    }
}


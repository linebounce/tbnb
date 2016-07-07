//
//  AuthenticationViewController.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit
import SnapKit

extension UITextField {
    func defaultSettings() {
        self.adjustsFontSizeToFitWidth = true
        self.autocapitalizationType = .None
        self.autocorrectionType = .No
        self.clearButtonMode = .Always
        self.keyboardAppearance = .Dark
        self.keyboardType = .Default
    }
}

protocol AuthenticationViewControllerDelegate: class {
    var enteredEmail:    String? { get set }
    var enteredPassword: String? { get set }
    var enteredUsername: String? { get set }
    
    func signUp(sender: AuthenticationViewController)
    func login(sender: AuthenticationViewController)
}

enum AuthenticationAction {
    case Login, SignUp
}

enum AuthTextField {
    case Email
    case Password
    case Username
    
    var textField: UITextField {
        let tf = UITextField()
        tf.defaultSettings()
        return tf
    }
}

class AuthenticationViewController: UIViewController, UITextFieldDelegate {

    /// MARK: - AuthenticationViewControllerDelegate
    
    weak var delegate: AuthenticationViewControllerDelegate?
    
    /// MARK: - TextField Declarations
    
    let emailTextField:    UITextField
    let passwordTextField: UITextField
    let usernameTextField: UITextField
    
    /// MARK: - AuthenticationAction
    
    let action: AuthenticationAction
    
    /// MARK: - init()
    
    init(authenticationAction action: AuthenticationAction) {
        self.action = action
        
        emailTextField    = AuthTextField.Email.textField
        passwordTextField = AuthTextField.Password.textField
        usernameTextField = AuthTextField.Username.textField
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        setTextFields()
        view.backgroundColor = BackgroundColor.Red.color
    }
    
    /// MARK: - TextField Delegate Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        if text.isEmpty { return false }
        switch textField {
        case emailTextField:
            delegate?.enteredEmail = text
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            passwordTextField.hidden = false
        case passwordTextField:
            delegate?.enteredPassword = text
            switch action {
            case .Login: delegate?.login(self)
            case .SignUp:
                passwordTextField.resignFirstResponder()
                usernameTextField.becomeFirstResponder()
                usernameTextField.hidden = false
            }
        case usernameTextField:
            delegate?.enteredUsername = text
            delegate?.signUp(self)
        default: fatalError("Invalid textfield")
        }
        return true
    }
    
    
    /// MARK: - Set View Properties
    
    private func setTextFields() {
        
        emailTextField.backgroundColor    = BackgroundColor.Blue.color
        passwordTextField.backgroundColor = BackgroundColor.LightGray.color
        usernameTextField.backgroundColor = BackgroundColor.Cyan.color
        
        emailTextField.placeholder    = TextFieldPlaceholder.Email.text
        passwordTextField.placeholder = TextFieldPlaceholder.Password.text
        usernameTextField.placeholder = TextFieldPlaceholder.Username.text
        
        emailTextField.delegate    = self
        passwordTextField.delegate = self
        usernameTextField.delegate = self
        
        emailTextField.becomeFirstResponder()
        
        passwordTextField.hidden = true
        usernameTextField.hidden = true
        
        passwordTextField.secureTextEntry = true
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(usernameTextField)

        emailTextField.snp_makeConstraints { make in
            make.centerX.equalTo(view.snp_centerX)
            make.width.equalTo(view).multipliedBy(AuthenticationEmailTextFieldFrame.WidthToViewFactor.value)
            make.height.equalTo(view).multipliedBy(AuthenticationEmailTextFieldFrame.HeightToViewFactor.value)
            make.top.equalTo(view).offset(view.bounds.height * AuthenticationEmailTextFieldFrame.TopToViewFactor.value)
        }
        
        passwordTextField.snp_makeConstraints { make in
            make.width.equalTo(emailTextField)
            make.centerX.equalTo(emailTextField)
            make.top.equalTo(emailTextField.snp_bottom)
            make.height.equalTo(emailTextField)
        }
        
        usernameTextField.snp_makeConstraints { make in
            make.width.equalTo(emailTextField)
            make.centerX.equalTo(emailTextField)
            make.top.equalTo(passwordTextField.snp_bottom)
            make.height.equalTo(emailTextField)
        
        }
        
    }
    
    private func setTitle() {
        switch action {
        case .Login:  title = ViewControllerTitle.Login.title
        case .SignUp: title = ViewControllerTitle.SignUp.title
        }
    }
}

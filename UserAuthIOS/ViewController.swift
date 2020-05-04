//
//  ViewController.swift
//  UserAuthIOS
//
//  Created by Yug Rawal on 02/05/20.
//  Copyright © 2020 Yug Rawal. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var signInSegment: UISegmentedControl!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var emailTextView: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var passwordTextView: UITextField!
    
    @IBOutlet weak var SignInBtn: UIButton!
    var isSignIn:Bool=true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInSegmentAction(_ sender: Any) {
        isSignIn = !isSignIn
        if(isSignIn==true){
            signInLabel.text="Sign in"
            SignInBtn.setTitle("Sign in", for: .normal)
            
        }
        else{
            signInLabel.text="Register"
            SignInBtn.setTitle("Register", for: .normal)
        }
    
    }
    
    @IBAction func signInBtnPress(_ sender: Any) {
        if let email=emailTextView.text, let pass=passwordTextView.text{
        if(isSignIn==true)
        {
            Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                if let u=user{
                    self.performSegue(withIdentifier: "goToHome", sender:self)
                }
                else{
                    self.performSegue(withIdentifier:"gotToSignInError", sender: self)
                }
            }
         
            //
        }
        else{
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                if let u=user{
                    self.performSegue(withIdentifier: "goToHome", sender:self)
                }
                else{
                    
                }
            }
        }
    }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextView.resignFirstResponder()
        passwordTextView.resignFirstResponder()
    }
}


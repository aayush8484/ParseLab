//
//  LoginViewController.swift
//  ParseLab
//
//  Created by Pujan Thapa on 2/25/18.
//  Copyright © 2018 Aayush. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    var errorMessage: String = ""
    
    @IBAction func SignUpButton(_ sender: Any) {
        registerUser()
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        if usernameLabel.text == "" || passwordLabel.text == ""{
            let alertController = UIAlertController(title: "Invalid Login Credentials", message: "Please enter Proper login Credentials.", preferredStyle: .alert)
            let EmptyUserNameAction = UIAlertAction(title: "Invalid", style: .cancel) { (action) in
            }
            alertController.addAction(EmptyUserNameAction)
            present(alertController, animated: true)
        }
        loginUser()
        if self.errorMessage != ""{
            let alertController = UIAlertController(title: "Invalid Login Credentials", message: "\(self.errorMessage)", preferredStyle: .alert)
            let EmptyUserNameAction = UIAlertAction(title: "Username Not Registered", style: .cancel) { (action) in
            }
            alertController.addAction(EmptyUserNameAction)
            present(alertController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerUser() {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameLabel.text
        newUser.password = passwordLabel.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
            }
        }
    }
    
    func loginUser() {
        
        let username = usernameLabel.text ?? ""
        let password = passwordLabel.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                self.errorMessage = error.localizedDescription
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

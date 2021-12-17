//
//  LoginViewController.swift
//  TechnicalTestInsura
//
//  Created by Michael Tanakoman on 17/12/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    let jsonHelper = JSONHelper()
    var dataUser: [User] = []
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonHelper.fetchDataUser { data in
            DispatchQueue.main.async {
                self.dataUser = data
            }
        }
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        let username = txtUsername.text
        
        for value in dataUser{
            if username == value.username{
                defaults.set(value.id, forKey: "userID")
                performSegue(withIdentifier: "keHome", sender: self)
                break
            }else{
                print("Username Not Exist")
            }
        }
    }
}

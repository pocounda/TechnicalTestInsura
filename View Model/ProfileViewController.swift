//
//  ProfileViewController.swift
//  TechnicalTestInsura
//
//  Created by Michael Tanakoman on 17/12/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var txtUsername: UILabel!
    @IBOutlet weak var txtEmail: UILabel!
    @IBOutlet weak var txtAddress: UILabel!
    @IBOutlet weak var txtPhone: UILabel!
    
    var jsonHelper = JSONHelper()
    var userId = UserDefaults.standard.integer(forKey: "userID")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonHelper.fetchDataUser { dataUser in
            DispatchQueue.main.async {
                for user in dataUser{
                    if self.userId == user.id{
                        self.txtUsername.text = user.username
                        self.txtEmail.text = user.email
                        self.txtAddress.text = user.address.street
                        self.txtPhone.text = user.phone
                    }
                }
            }
        }
    }
}

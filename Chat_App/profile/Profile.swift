//
//  Profile.swift
//  Chat_App
//
//  Created by Ahmed Hussien on 04/08/2022.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class Profile: UIViewController {

    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//        if(Auth.auth().currentUser != nil){
//            logOutButton.setTitle("logOut", for: .normal)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(Auth.auth().currentUser != nil){
            userNameLable.text =  UserDefaults.standard.string(forKey: "currentuser")
            logOutButton.setTitle("logOut", for: .normal)
        }
    }

    @IBAction func logOutButton(_ sender: Any) {
        try! Auth.auth().signOut()
        logOutButton.setTitle("login", for: .normal)
        presentRegistarationView()
    }
    func presentRegistarationView(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegistarationVc") as? RegistarationViewController
        self.present(vc!, animated: true)
    }


}

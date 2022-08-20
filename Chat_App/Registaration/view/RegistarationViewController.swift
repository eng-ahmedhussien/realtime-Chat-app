//
//  ViewController.swift
//  Chat_App
//
//  Created by Ahmed Hussien on 28/12/1443 AH.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth


class RegistarationViewController: UIViewController {

    @IBOutlet weak var collectionViewCaht: UICollectionView!
    var row = 0
    var section = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionViewCaht.dataSource = self
        self.collectionViewCaht.delegate = self
    }

    
}
extension RegistarationViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionViewCaht.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell
        row = indexPath.row
        section = indexPath.section
        if(indexPath.row == 0){
            cell?.userNameField.isHidden = true
            cell?.ActionnButton.setTitle("Login", for: .normal)
            cell?.navagateButton.setTitle("Sign Up  ➡️", for: .normal)
            cell?.navagateButton.addTarget(self, action: #selector(goToSignUp(_:)), for: .touchUpInside)
            cell?.ActionnButton.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        }
        else if(indexPath.row == 1){
            cell?.userNameField.isHidden = false
            cell?.ActionnButton.setTitle("Sign Up", for: .normal)
            cell?.navagateButton.setTitle("Sign in ⬅️", for: .normal)
            cell?.navagateButton.addTarget(self, action: #selector(goToSignIn(_:)), for: .touchUpInside)
            cell?.ActionnButton.addTarget(self, action: #selector(registerNew(_:)), for: .touchUpInside)
        }
        return cell!

    }
    @objc func goToSignUp(_ sender:UIButton){
        let index = IndexPath(row: 1, section: 0)
       self.collectionViewCaht.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    @objc func goToSignIn(_ sender:UIButton){
        let index = IndexPath(row: 0, section: 0)
       self.collectionViewCaht.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    @objc func registerNew(_ sender:UIButton){
        let index = IndexPath(row: 1, section: 0)
        let cell =  self.collectionViewCaht.cellForItem(at: index) as! CollectionViewCell
        guard let email = cell.emailField.text , let password = cell.passwordField.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if (error == nil){
                self.dismiss(animated: true)
                guard let userId = authResult?.user.uid , let userName = cell.userNameField.text else {return}
                let ref = Database.database().reference()
                //create new branch from users by using userId as key
                let user =  ref.child("users").child(userId)
                let userDataArray : [String:Any] = ["username":userName]
                user.setValue(userDataArray)
                UserDefaults.standard.set(userName, forKey: "currentuser")
            }
            else{
                self.aleret(error:"email aready register befor ")
            }
        }
    }
    
    @objc func login(_ sender:UIButton){
        let index = IndexPath(row: 0, section: 0)
        let cell =  self.collectionViewCaht.cellForItem(at: index) as! CollectionViewCell
        guard let email = cell.emailField.text , let password = cell.passwordField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if (error == nil){
                self.dismiss(animated: true)
                let ref = Database.database().reference()
                let userID = authResult?.user.uid
                ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { snapshot in
                    if let value = snapshot.value as? [String:Any]{
                       let  username = value["username"]!
                        UserDefaults.standard.set(username, forKey: "currentuser")
                        print(username)
                    }
 
                }) { error in
                  print(error)
                }
            }
            else{
                self.aleret(error:"email or password is incorrect")
            }
        }
        
      
    }
    
    func aleret(error:String){
        let alert = UIAlertController(title: "error", message: error, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return self.collectionViewCaht.frame.size
     }
    
    
}


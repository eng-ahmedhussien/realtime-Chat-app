//
//  RoomsViewController.swift
//  Chat_App
//
//  Created by Ahmed Hussien on 02/01/1444 AH.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class RoomsViewController: UIViewController {

    @IBOutlet weak var roomsTable: UITableView!
    @IBOutlet weak var roomNameFiled: UITextField!
    var rooms = [Room]()
    var roomsViewModle = RoomsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRooms()
        roomsTable.dataSource = self
        roomsTable.delegate = self
        if(Auth.auth().currentUser == nil){
            presentRegistarationView()
        }
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(Auth.auth().currentUser == nil){
            presentRegistarationView()
        }
    }
    
    @IBAction func createRoomButton(_ sender: UIButton) {
        guard let roomName = roomNameFiled.text, roomName.isEmpty == false else {return}
        let ref = Database.database().reference()
        let room = ref.child("Rooms").childByAutoId()
        let roomDataArray : [String:Any] = ["room name":roomName]
        room.setValue(roomDataArray )
        roomNameFiled.text = ""
    }
    
   
    
    func presentRegistarationView(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "RegistarationVc") as? RegistarationViewController
        self.present(vc!, animated: true)
    }
    
    func getRooms(){
        roomsViewModle.getRooms()
        roomsViewModle.updateData = { rooms,error in
            DispatchQueue.main.async {
                guard let  rooms = rooms else {return}
                self.rooms = rooms
                self.roomsTable.reloadData()
            }
        }

    }
    
}

// MARK: - tableView
extension RoomsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.roomsTable.dequeueReusableCell(withIdentifier: "RoomsCell") as? RoomsCell
        cell?.textLabel?.text = rooms[indexPath.row].roomNname
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController
        vc?.room = rooms[indexPath.row]
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}

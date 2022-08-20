//
//  RoomsViewModel.swift
//  Chat_App
//
//  Created by Ahmed Hussien on 02/01/1444 AH.
//

import UIKit
import FirebaseDatabase

class RoomsViewModel: UIViewController {
    
    var updateData : (([Room]?,Error?) -> Void) = {_ , _ in}
    var rooms = [Room]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func getRooms(){
        let ref = Database.database().reference()
        ref.child("Rooms").observe(.childAdded) { DataSnapshot in
            let dataArray = DataSnapshot.value as! [String:Any]
            let roomName = dataArray["room name"] as! String
            let room = Room(roomId: DataSnapshot.key, roomNname: roomName)
            self.rooms.append(room)
            self.updateData(self.rooms, nil)
        }
    }
}

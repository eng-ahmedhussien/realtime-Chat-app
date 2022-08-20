//
//  CahtViewModel.swift
//  Chat_App
//
//  Created by Ahmed Hussien on 03/01/1444 AH.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class ChatsViewModel: UIViewController {

    
    var chatMessages = [Message]()
    var updateData : (([Message]?,Error?) -> Void) = {_ , _ in}
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func sendMessage(message:String,room:Room){
        guard let uid = Auth.auth().currentUser?.uid  else {return}
        let ref = Database.database().reference()
        ref.child("users").child(uid).child("username").observeSingleEvent(of: .value){ ChatData in
            let username = ChatData.value as? String
            if let roomId = room.roomId{
                let room = ref.child("Rooms").child(roomId)
                let chatDataArray : [String:Any] = ["sendername":username,"messageText":message]
                //ceate child messages
                room.child("messages").childByAutoId().setValue(chatDataArray)
            }
        }
        
    }

    func getChatMessages(room:Room,completion:@escaping ([Message]?) -> ()){
        let ref = Database.database().reference()
        guard let roomId = room.roomId else {return}
         ref.child("Rooms").child(roomId).child("messages").observe(.childAdded) { DataSnapshot in
             if let dataArray = DataSnapshot.value as? [String:Any]{
                 let message = Message(MessageId: DataSnapshot.key, MessageText: dataArray["messageText"] as? String, MessageSender: dataArray["sendername"] as? String )
                 self.chatMessages.append(message)
                 completion(self.chatMessages)
                 self.updateData(self.chatMessages, nil)
             }else{
                 completion(nil)
                 self.updateData(nil,Error.self as! Error)
             }
                
             
        }
 
    }
}

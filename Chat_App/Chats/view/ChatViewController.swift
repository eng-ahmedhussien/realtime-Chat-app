//
//  ChatViewController.swift
//  Chat_App
//
//  Created by Ahmed Hussien on 03/01/1444 AH.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class ChatViewController: UIViewController {

    
    var room : Room?
    var chatMessages = [Message] ()
    var  chatsViewModel = ChatsViewModel()
    @IBOutlet weak var ChatTable: UITableView!
    @IBOutlet weak var messageField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatTable.dataSource = self
        ChatTable.delegate = self
        //title is navagation bar title
        title = room?.roomNname
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       // chatNotification()
        guard let room = room else {return}
        chatsViewModel.getChatMessages(room: room){ messages in
            DispatchQueue.main.async {
                guard let messages = messages else {return}
                self.chatMessages = messages
                self.ChatTable.reloadData()
            }
        }
    }
    
    func chatNotification(){
           let content = UNMutableNotificationContent()
           content.title = "chat"
           content.subtitle = "room"
           content.body = "body"
           content.sound = .default
           content.badge = 1
          content.userInfo = ["information":"information"]
            //trigger1
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(5), repeats: false)
           //trigger2
           let date = Date(timeIntervalSinceNow: 5)
           let dateComponent = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
           let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
           let request = UNNotificationRequest(identifier: "id1", content: content, trigger: trigger)
           UNUserNotificationCenter.current().add(request)
       }
    
    @IBAction func sendButton(_ sender: Any) {
        
        guard let messageField = messageField.text, messageField.isEmpty == false,let room = room  else {return}
        chatsViewModel.sendMessage(message: messageField, room: room)
        self.messageField.text = ""
        
    }
}
// MARK: - table
extension ChatViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(chatMessages.count)
        return chatMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ChatTable.dequeueReusableCell(withIdentifier: "ChatCell") as? ChatCell
      //  cell?.messageText.text = chatMessages[indexPath.row].MessageText as? String
     //   cell?.usernameLable.text = (chatMessages[indexPath.row].MessageSender as? String)
        cell?.messageKind(message: chatMessages[indexPath.row])
        return cell!
    }
    
    
}

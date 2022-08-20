//
//  ChatCell.swift
//  Chat_App
//
//  Created by Ahmed Hussien on 03/01/1444 AH.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var meseageStack: UIStackView!
    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var usernameLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        messageText.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func messageKind(message:Message){
        let username =  UserDefaults.standard.string(forKey: "currentuser")
        messageText.text = message.MessageText
        usernameLable.text = message.MessageSender
        
        if(message.MessageSender == username){
            meseageStack.alignment = .trailing
            messageText.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }else if (message.MessageSender != username){
            messageText.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            meseageStack.alignment = .leading
        }
        
        
    }

}

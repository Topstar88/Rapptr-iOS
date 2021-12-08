//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    static var identifier = "ChatTableViewCell"
    let bubbleView: ChatBubbleView = {
        let v = ChatBubbleView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    var leadingOrTrailingConstraint = NSLayoutConstraint()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        contentView.addSubview(bubbleView)

        bubbleView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-36)
        }
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        bubbleView.chatLabel.text = message.text
        bubbleView.headerLabel.text = message.username
        
        if let url = message.avatarURL {
            bubbleView.imgAvatar.load(url: url)
        } else {
            bubbleView.imgAvatar.image = UIImage(named: "avatar1")
        }
        
        bubbleView.incoming = true
        
        leadingOrTrailingConstraint.isActive = false
        leadingOrTrailingConstraint = bubbleView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12.0)
        leadingOrTrailingConstraint.isActive = true
    }
}

//
//  ChatBubbleView.swift
//  Rapptr iOS Test
//
//  Created by Polaris on 12/8/21.
//

import UIKit
import SnapKit

class ChatBubbleView: UIView {

    let bubbleLayer = CAShapeLayer()

    let headerLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 0
        v.font = Fonts.ChatUserName
        v.textColor = Colors.chatUserName
        return v
    }()
    
    let chatLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 0
        v.font = Fonts.ChatMessage
        v.textColor = Colors.chatMessage
        return v
    }()
    
    let backgroundView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.borderColor = Colors(hex: 0xEFEFEF).cgColor
        v.layer.cornerRadius = 8
        v.layer.borderWidth = 1
        return v
    }()
    
    let imgAvatar: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.cornerRadius = 22.5
        iv.clipsToBounds = true
        return iv
    }()
    
    var incoming = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() -> Void {
        addSubview(backgroundView)
        addSubview(imgAvatar)
        addSubview(headerLabel)
        addSubview(chatLabel)
        
        imgAvatar.snp.makeConstraints { make in
            make.width.height.equalTo(45)
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(imgAvatar)
            make.leading.equalTo(imgAvatar.snp.trailing).offset(7)
        }
        backgroundView.snp.makeConstraints { make in
            make.leading.equalTo(imgAvatar.snp.trailing).offset(7)
            make.top.equalTo(headerLabel.snp.bottom).offset(4)
            make.bottom.trailing.equalToSuperview()
        }
        chatLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(backgroundView).offset(8)
            make.bottom.trailing.equalTo(backgroundView).offset(-8)
        }
    }
}

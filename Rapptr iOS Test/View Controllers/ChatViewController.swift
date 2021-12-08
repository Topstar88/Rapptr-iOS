//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Using the following endpoint, fetch chat data
     *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
     *
     * 3) Parse the chat data using 'Message' model
     *
     **/
    
    // MARK: - Properties
    private var client: ChatClient?
    private var messages: [Message]?
    
    // MARK: - Outlets
    @IBOutlet weak var chatTable: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messages = [Message]()
        configureTable(tableView: chatTable)
        title = "Chat"
        
        // TODO: Remove test data when we have actual data from the server loaded
        messages?.append(Message(testName: "Drew", withTestMessage: "Team, can we give job applicants taking this test some examples of the types of apps they’d be working on if they joined our team?"))
        messages?.append(Message(testName:"Abby", withTestMessage:"We work on ecommerce apps for brands like PromGirl * Simply dresses."))
        messages?.append(Message(testName:"Taylor", withTestMessage:"You know those scooter sharing services that have been popping up?"))
        messages?.append(Message(testName:"Abby", withTestMessage:" We do a lot of hardware-pairing apps as well like Conair’s Smart WeightWatchers Scale and Phlex’s new smart goggles."))
        
        chatTable.reloadData()
        
        setupUI()
    }
    
    func setupUI() {
        self.navigationController?.navigationBar.topItem?.title = "";
    }
    
    // MARK: - Private
    private func configureTable(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 4, left: 0, bottom: 20, right: 0)
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as! ChatTableViewCell
        cell.setCellData(message: messages![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages!.count
    }
}

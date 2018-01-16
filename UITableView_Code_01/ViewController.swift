//
//  ViewController.swift
//  UITableView_Code_01
//
//  Created by commany_mac on 2018. 1. 16..
//  Copyright © 2018년 CommanyShin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: 1. Properties
	let myTalbeView: UITableView = UITableView()
	let items: [String] = ["magi82", "swift", "ios"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// 3. Do any additional setup after loading the view.
		self.myTalbeView.dataSource = self
		self.myTalbeView.delegate = self
		
		// 4. Register TableViewCell
		self.myTalbeView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
		self.view.addSubview(self.myTalbeView)
		
		// 5. TableView AutoLayout
		self.myTalbeView.translatesAutoresizingMaskIntoConstraints = false
		self.view.addConstraint(NSLayoutConstraint(item: self.myTalbeView,
												   attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top,
												   multiplier: 1.0, constant: 0))
		self.view.addConstraint(NSLayoutConstraint(item: self.myTalbeView,
												   attribute: .bottom, relatedBy: .equal, toItem: self.view,
												   attribute: .bottom, multiplier: 1.0, constant: 0))
		self.view.addConstraint(NSLayoutConstraint(item: self.myTalbeView,
												   attribute: .leading, relatedBy: .equal, toItem: self.view,
												   attribute: .leading, multiplier: 1.0, constant: 0))
		self.view.addConstraint(NSLayoutConstraint(item: self.myTalbeView,
												   attribute: .trailing, relatedBy: .equal, toItem: self.view,
												   attribute: .trailing, multiplier: 1.0, constant: 0))
	}
}

// MARK: 2-1. UITableViewDataSource
extension ViewController: UITableViewDataSource {
	// 6-1.
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.items.count
	}
	
	// 6-2.
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")! as UITableViewCell
		cell.textLabel?.text = self.items[indexPath.row]
		
		return cell
	}
}

// MARK: 2-2. UITableViewDelegate
extension ViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(self.items[indexPath.row])
	}
}

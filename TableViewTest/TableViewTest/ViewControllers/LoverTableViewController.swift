//
//  LoverTableViewController.swift
//  TableViewTest
//
//  Created by mikewang on 2020/2/19.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class LoverTableViewController: UITableViewController {
    
    var lovers = [
        Lover(id: 1, name: "小龍女", intro: "冰雪聰明", imageName: "pic1", gender: "female", hasInnerBeauty: true),
        Lover(id: 2, name: "夜神月", intro: "絕頂聰明", imageName: "pic4", gender: "male", hasInnerBeauty: false),
        Lover(id: 3, name: "小紅帽", intro: "可愛", imageName: "pic2", gender: "female", hasInnerBeauty: true),
        Lover(id: 4, name: "小幸運", intro: "真心", imageName: "pic3", gender: "female", hasInnerBeauty: true)
    ]
    
    struct PropertyKeys {
        static let femaleLoverCell = "FemaleCell"
        static let manLoverCell = "ManCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定所有cell的高度
        //tableView.rowHeight = 118
        //tableView.estimatedRowHeight = 0
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
        
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lovers.count
    }
    
    var number = 0
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lover = lovers[indexPath.row]
        
        if lover.gender == "female" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.femaleLoverCell, for: indexPath) as? FemaleTableViewCell else { return UITableViewCell() }
            cell.nameLabel.text = lover.name
            cell.innerBeautySwitch.isOn = lover.hasInnerBeauty
            // 第一種寫法
            //cell.photoImageView.image = UIImage(named: lover.imageName)
            // 第二種寫法
            let imageView = cell.viewWithTag(100) as? UIImageView
            imageView?.image = UIImage(named: lover.imageName)
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.manLoverCell, for: indexPath) as? ManTableViewCell else { return UITableViewCell() }
            cell.nameLabel.text = lover.name
            cell.photoImageView.image = UIImage(named: lover.imageName)
            cell.innerBeautySwitch.isOn = lover.hasInnerBeauty
            
            return cell
        }
        
        
//        if indexPath.row == 0 {
//            number += 1
//            if number % 2 == 0 {
//                cell.backgroundColor = .yellow
//            } else {
//                cell.backgroundColor = .red
//            }
//        }
        
//        cell.nameLabel.text = lover.name
//        cell.photoImageView.image = UIImage(named: lover.imageName)
        
//        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        lovers.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
    // MARK: - IBAction
        
    @IBSegueAction func showDetail(_ coder: NSCoder) -> LoverEditTableViewController? {
        if let row = tableView.indexPathForSelectedRow?.row {
            print("showDetail")
            let lover = lovers[row]
            return LoverEditTableViewController(coder: coder, lover: lover)
        } else {
            return LoverEditTableViewController(coder: coder, lover: nil)
        }
    }
        
    @IBAction func unwindToLoverTableView(segue: UIStoryboardSegue) {
        if let source = segue.source as? LoverEditTableViewController, let lover = source.lover {
            let updateIndex = lovers.firstIndex{ $0.id == lover.id }
            if let index = updateIndex {
                lovers[index] = lover
            }
        } else if let source = segue.source as? LoverAddTableViewController, let lover = source.lover {
            lovers.insert(lover, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        tableView.reloadData()
    }
    
    @IBAction func innerBeautySwitchChange(_ sender: UISwitch) {
        let point: CGPoint = sender.convert(.zero, to: tableView)
        
        if let indexPath = tableView.indexPathForRow(at: point) {
            var lover = lovers[indexPath.row]
            lover.hasInnerBeauty = sender.isOn
            // update array
            lovers[indexPath.row].hasInnerBeauty = sender.isOn
        }
        
    }
    
}

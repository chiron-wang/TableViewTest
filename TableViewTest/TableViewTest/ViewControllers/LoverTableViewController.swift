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
        Lover(name: "小龍女", intro: "冰雪聰明", imageName: "pic1", gender: "female", hasInnerBeauty: true),
        Lover(name: "夜神月", intro: "絕頂聰明", imageName: "pic4", gender: "man", hasInnerBeauty: false),
        Lover(name: "小紅帽", intro: "可愛", imageName: "pic2", gender: "female", hasInnerBeauty: true),
        Lover(name: "小幸運", intro: "真心", imageName: "pic3", gender: "female", hasInnerBeauty: true)
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
    
    @IBSegueAction func showDetail(_ coder: NSCoder) -> LoverDetailViewController? {
        if let row = tableView.indexPathForSelectedRow?.row {
            let lover = lovers[row]
            return LoverDetailViewController(coder: coder, lover: lover)
        } else {
            return nil
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return lovers.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
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
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
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

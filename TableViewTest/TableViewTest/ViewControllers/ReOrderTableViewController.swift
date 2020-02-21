//
//  ReOrderTableViewController.swift
//  TableViewTest
//
//  Created by mikewang on 2020/2/21.
//  Copyright © 2020 mikewang. All rights reserved.
//

// ref: https://www.ralfebert.de/ios-examples/uikit/uitableviewcontroller/reorderable-cells/

import UIKit

class ReOrderTableViewController: UITableViewController {
    
    var foods = [
        Food(id: 1, title: "Cake", text: "Cake is a form of sweet food made from flour, sugar, and other ingredients, that is usually baked. In their oldest forms, cakes were modifications of bread, but cakes now cover a wide range of preparations that can be simple or elaborate, and that share features with other desserts such as pastries, meringues, custards, and pies. - WIKIPEDIA", image: "Cake"),
        Food(id: 2, title: "Apple", text: "An apple is a sweet, edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. Apples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists. Apples have religious and mythological significance in many cultures, including Norse, Greek and European Christian tradition. - WIKIPEDIA", image: "Apple"),
        Food(id: 3, title: "Steak", text: "A steak (/ˈsteɪk/) is a meat generally sliced across the muscle fibers, potentially including a bone. Exceptions, in which the meat is sliced parallel to the fibers, include the skirt steak cut from the plate, the flank steak cut from the abdominal muscles, and the silverfinger steak cut from the loin and including three rib bones. In a larger sense, fish steaks, ground meat steaks, pork steak, and many more varieties of steak are known. - WIKIPEDIA", image: "Steak")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.isEditing = true

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
        return foods.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        let food = foods[indexPath.row]
        cell.textLabel?.text = food.title
        cell.detailTextLabel?.text = food.text
        cell.imageView?.image = UIImage(named: food.image)

        return cell
    }
    
    // step3
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    // step3
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
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

    // step4
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let moveObject = self.foods[fromIndexPath.row]
        foods.remove(at: fromIndexPath.row)
        foods.insert(moveObject, at: to.row)
    }
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

}

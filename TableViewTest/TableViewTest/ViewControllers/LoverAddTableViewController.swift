//
//  LoverAddTableViewController.swift
//  TableViewTest
//
//  Created by mikewang on 2020/3/6.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class LoverAddTableViewController: UITableViewController {
    
    var lover: Lover?
    var headerView: LoverHeader?
    var imageName: String = "pic1"
    
//    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var introTextField: UITextField!
    @IBOutlet weak var innerBeautySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(LoverHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    //override func numberOfSections(in tableView: UITableView) -> Int {
    //    // #warning Incomplete implementation, return the number of sections
    //    return 0
    //}

    //override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //    // #warning Incomplete implementation, return the number of rows
    //    return 0
    //}

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let id = lover?.id ?? 0
        let name = nameTextField.text ?? ""
        let intro = introTextField.text ?? ""
        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        let gender = genderSegmentedControl.titleForSegment(at: genderIndex)?.lowercased() ?? "male"
        let innerBeauty = innerBeautySwitch.isOn
        
        lover = Lover(id: id, name: name, intro: intro, imageName: imageName , gender: gender, hasInnerBeauty: innerBeauty)
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as? LoverHeader
        headerView?.imageView.image = UIImage(named: "pic1")
        
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let photoHeight: CGFloat = 300
        return photoHeight
    }
        
    @IBAction func genderSliderChanged(_ sender: UISegmentedControl) {
        let manIndex = 0
        if sender.selectedSegmentIndex == manIndex {
            imageName = "pic4"
            headerView?.imageView.image = UIImage(named: imageName)
        } else {
            imageName = "pic1"
            headerView?.imageView.image = UIImage(named: imageName)
        }
        
    }
    

    // MARK: - Functional Methods
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let errors = getErrors(("名字", nameTextField), ("簡介", introTextField))
        
        if errors.count > 0 {
            let errorStr = errors.joined(separator: ",")
            let alertController = UIAlertController(title: errorStr, message: "不得為空", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            
            return false
        } else {
            return true
        }
    }
    
    private func getErrors(_ inputs: (String, UITextField)...) -> [String] {
        var result: [String] = []
        
        for input in inputs {
            if input.1.text?.isBlank == true {
                result.append(input.0)
            }
        }
        
        return result
    }
    
    
}

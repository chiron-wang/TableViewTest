//
//  LoverEditTableViewController.swift
//  TableViewTest
//
//  Created by mikewang on 2020/3/5.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class LoverEditTableViewController: UITableViewController {
    
    var lover: Lover?
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var introTextField: UITextField!
    @IBOutlet weak var innerBeautySwitch: UISwitch!
    
    init?(coder: NSCoder, lover: Lover? = nil) {
        self.lover = lover
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    private func configUI() {
        guard let lover = lover else { return }
        nameTextField.text = lover.name
        introTextField.text = lover.intro
        genderSegmentedControl.selectedSegmentIndex = lover.gender == "male" ? 0 : 1
        photoImageView.image = UIImage(named: lover.imageName)
        innerBeautySwitch.isOn = lover.hasInnerBeauty
    }
    
    private func getErrors() -> [String] {
        var result: [String] = []
        if nameTextField.text?.isBlank == true {
            result.append("名字")
        }
        if introTextField.text?.isBlank == true {
            result.append("簡介")
        }
        return result
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let errors = getErrors()
        
        if errors.count > 0 {
            let errorStr = errors.joined(separator: ",")
            let alertController = UIAlertController(title: errorStr, message: " 不得為空", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
            
            return false
        } else {
            return true
        }
    }
    
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

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
        let imageName = lover?.imageName ?? "pic1"
        let genderIndex = genderSegmentedControl.selectedSegmentIndex
        let gender = genderSegmentedControl.titleForSegment(at: genderIndex)?.lowercased() ?? "male"
        let innerBeauty = innerBeautySwitch.isOn
        
        lover = Lover(id: id, name: name, intro: intro, imageName: imageName , gender: gender, hasInnerBeauty: innerBeauty)
    }
    
}

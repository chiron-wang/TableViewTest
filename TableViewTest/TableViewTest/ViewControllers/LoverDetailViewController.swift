//
//  LoverDetailViewController.swift
//  TableViewTest
//
//  Created by mikewang on 2020/2/19.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class LoverDetailViewController: UIViewController {
    
    let lover: Lover
    
    init?(coder: NSCoder, lover: Lover) {
        self.lover = lover
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(corder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

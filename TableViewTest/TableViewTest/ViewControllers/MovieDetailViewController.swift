//
//  MovieDetailViewController.swift
//  TableViewTest
//
//  Created by mikewang on 2020/2/21.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    let fullSize = UIScreen.main.bounds.size
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = movie.name

        let imageView = UIImageView(frame: CGRect(x: 0, y: fullSize.height * 0.25, width: fullSize.width, height: fullSize.height * 0.5))
        imageView.image = UIImage(named: movie.actor)
        view.addSubview(imageView)
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

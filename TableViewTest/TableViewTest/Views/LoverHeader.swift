//
//  LoverHeader.swift
//  TableViewTest
//
//  Created by mikewang on 2020/3/8.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

// ref: https://developer.apple.com/documentation/uikit/views_and_controls/table_views/adding_headers_and_footers_to_table_sections

class LoverHeader: UITableViewHeaderFooterView {
    
    let imageView = UIImageView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)            
        ])
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  File.swift
//  TableViewTest
//
//  Created by mikewang on 2020/2/20.
//  Copyright © 2020 mikewang. All rights reserved.
//

import Foundation
enum Section {
    case comedy
    case romance
    case action
}

struct Movie: Hashable {
    var name: String
    var actor: String
    var year: Int
}

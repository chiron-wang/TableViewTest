//
//  String+isBank.swift
//  TableViewTest
//
//  Created by mikewang on 2020/3/6.
//  Copyright © 2020 mikewang. All rights reserved.
//

import Foundation

// ref: https://zhuanlan.zhihu.com/p/80520884
extension String {
    var isBlank: Bool {
        let trimmedStr = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedStr.isEmpty
    }
}

//
//  Model.swift
//  Minekeeper
//
//  Created by Andrey Dubinchak on 05.09.2018.
//  Copyright © 2018 Andrey Dubinchak. All rights reserved.
//

import Foundation
class Model {
    var array = Array(repeating: Array(repeating: 0, count: 10), count: 10)
    
    init() {
        for i in 0...9 {
            for j in 0...9 {
                if i == 0 || i == 9 || j == 0 || j == 9 {
                    array[i][j] = 0
                } else {
                    array[i][j] = Int(arc4random_uniform(2))
                }
            }
        }
    }
    
}




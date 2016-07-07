//
//  Meal.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

struct Meal: FirebaseSendable {
    let key:            String /// each meal's key is equal to the key of the user that created it
    let name:           String
    let pricePerPerson: Double
    let feeds:          Int
    let chef:           User
    
    let fbType: FBType = .Meal
}

extension Meal {
    static let Path        = "meals/"
    static let NeedsAutoID = false
    static let FBSubKeys   = ["name", "pricePerPerson", "feeds"]
}

func ==(lhs: Meal, rhs: Meal) -> Bool {
    return lhs.key == rhs.key && lhs.name == rhs.name && lhs.pricePerPerson == rhs.pricePerPerson && lhs.feeds == rhs.feeds && lhs.chef == rhs.chef
}
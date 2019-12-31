//
//  Person.swift
//  Holidario
//
//  Created by Tadreik Campbell on 12/30/19.
//  Copyright © 2019 Tadreik Campbell. All rights reserved.
//

import Foundation

struct Person {
    let name: String!
    let item: String!
    let url: String?
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String
        self.item = dictionary["item"] as? String
        self.url = dictionary["url"] as? String
    }
}

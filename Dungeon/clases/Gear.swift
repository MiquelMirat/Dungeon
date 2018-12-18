//
//  Equipment.swift
//  Dungeon
//
//  Created by Sebastian Alcolea on 11/15/18.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//

import UIKit

class Gear: NSObject,NSCopying {
    
    
    var items = [Item]()
    
    override init(){
        self.items = [Item]()
    }
    
    init(items:[Item]){
        self.items = items
    }
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Gear(items: items)
        return copy
    }
}

//
//  Equipment.swift
//  Dungeon
//
//  Created by Sebastian Alcolea on 11/15/18.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//

import UIKit

class Dungeon: NSObject, NSCopying {
   
    var monsters = [Monster]()
    var tier = 1
    override init(){
        self.monsters = [Monster]()
    }
    
    init(monsters:[Monster]){
        self.monsters = monsters
    }
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Dungeon(monsters: monsters)
        return copy
    }
    
}

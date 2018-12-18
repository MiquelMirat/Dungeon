//
//  Item.swift
//  Dungeon
//
//  Created by Miquel Maria Mirat on 14/11/2018.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name:String
    var attack:Int
    var deffense:Int
    var magic:Int
    var luck:Int
    var cost:Int
    var itemType:itemType
    var sprite:UIImage
    
    init(name:String, attack:Int, deffense:Int, magic:Int, luck:Int, cost:Int, itemType:itemType, sprite:UIImage) {
        self.name = name
        self.attack = attack
        self.deffense = deffense
        self.magic = magic
        self.luck = luck
        self.cost = cost
        self.itemType = itemType
        self.sprite = sprite
    }
    func getInventoryPosByItemType() -> Int {
        var pos = 0
        switch(self.itemType){
        case .scepter, .sword, .arrow:
            pos = 0
            break
        case .shield:
            pos = 1
            break
        case .armour, .cap:
            pos = 2
            break
        case .helmet:
            pos = 3
            break
        case .boots:
            pos = 4
            break
        case .ring, .necklace:
            pos = 5
            break
        }
        return pos
    }
    
    
    func getItemShopView() -> UIView {
        //vista padre
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        //bg
        let bgImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        bgImg.image = UIImage(named: "back_heroe")
        view.addSubview(bgImg)
        //view.backgroundColor = .red
        let imgItem = UIImageView(frame: CGRect(x: 18, y: 14, width: 71, height: 71))
        imgItem.image = self.sprite
        view.addSubview(imgItem)
        //nombre
        let labelName = UILabel(frame: CGRect(x: 124, y: 4, width: 200, height: 29))
        labelName.text = self.name
        labelName.textColor = .white
        view.addSubview(labelName)
        //ataque
        let imgAtk = UIImageView(frame: CGRect(x: 124, y: 33, width: 29, height: 29))
        imgAtk.image = UIImage(named: "damage")!
        view.addSubview(imgAtk)
        let valAtk = UILabel(frame: CGRect(x: 157, y: 33, width: 29, height: 29))
        valAtk.text = String(self.attack)
        valAtk.textColor = .white
        view.addSubview(valAtk)
        //defensa
        let imgDef = UIImageView(frame: CGRect(x: 124, y: 63, width: 29, height: 29))
        imgDef.image = UIImage(named: "defensa")!
        view.addSubview(imgDef)
        let valDef = UILabel(frame: CGRect(x: 157, y: 63, width: 29, height: 29))
        valDef.text = String(self.deffense)
        valDef.textColor = .white
        view.addSubview(valDef)
        //magia
        let imgMag = UIImageView(frame: CGRect(x: 224, y: 33, width: 29, height: 29))
        imgMag.image = UIImage(named: "magic")!
        view.addSubview(imgMag)
        let valMag = UILabel(frame: CGRect(x: 257, y: 33, width: 29, height: 29))
        valMag.text = String(self.magic)
        valMag.textColor = .white
        view.addSubview(valMag)
        //suerte
        let imgLck = UIImageView(frame: CGRect(x: 224, y: 63, width: 29, height: 29))
        imgLck.image = UIImage(named: "lucky")!
        view.addSubview(imgLck)
        let valLck = UILabel(frame: CGRect(x: 257, y: 63, width: 29, height: 29))
        valLck.text = String(self.luck)
        valLck.textColor = .white
        view.addSubview(valLck)
        //coste
        let imgCost = UIImageView(frame: CGRect(x: 304, y: 33, width: 29, height: 29))
        imgCost.image = UIImage(named: "money")!
        view.addSubview(imgCost)
        let valCost = UILabel(frame: CGRect(x: 337, y: 33, width: 50, height: 29))
        valCost.text = String(self.cost)
        valCost.textColor = .white
        view.addSubview(valCost)
        return view
    }
    
    
    
}

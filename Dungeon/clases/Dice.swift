//
//  Dice.swift
//  Dungeon
//
//  Created by Sebastian Alcolea on 11/24/18.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//

import UIKit

class Dice: NSObject {
    var allImages:[UIImage] = [
        UIImage(named: "dice1")!,
        UIImage(named: "dice2")!,
        UIImage(named: "dice3")!,
        UIImage(named: "dice4")!,
        UIImage(named: "dice5")!,
        UIImage(named: "dice6")!,
        UIImage(named: "dice7")!,
        UIImage(named: "dice8")!,
        UIImage(named: "dice9")!,
        UIImage(named: "dice10")!,
        UIImage(named: "dice11")!,
        UIImage(named: "dice12")!]
    
    let allValues:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12]
    var faces:Int?
    var builtImages:[UIImage] = [UIImage]()
    var builtValues:[Int] = [Int]()
    
    
    init(faces:Int){
        if(faces > 12){
            self.faces = 12
        }else{
            self.faces = faces
        }
        var values = [Int]()
        for index in 0...(self.faces!-1){
            values.append(self.allValues[index])
        }
        self.builtValues = values
        var images = [UIImage]()
        for index in 0...(self.faces!-1){
            images.append(self.allImages[index])
        }
        self.builtImages = images
        
        
    }
    func getViewForFight(dim:Int, row:Int) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: dim, height: dim))
        let diceImg = UIImageView(frame: CGRect(x: 0, y: 0, width: dim, height: dim))
        diceImg.image = builtImages[row]
        view.addSubview(diceImg)
        return view
    }
    
}

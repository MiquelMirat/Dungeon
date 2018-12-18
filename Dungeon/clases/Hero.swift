//
//  Hero.swift
//  Dungeon
//
//  Created by Miquel Maria Mirat on 14/11/2018.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//

import UIKit

class Hero: NSObject {
    var name: String
    var lifes: Int
    var attack: Int
    var magic: Int
    var deffense: Int
    var luck: Int
    var money: Int
    var exp: Int = 0
    var sprite: UIImage
    var gear: Gear
    var dungeon: Dungeon
    var totalStats:[Int] = [Int]()
    var dices:[DiceUser]?
    var wasteds: Dungeon
    
    init(name:String, lifes:Int, attack:Int, magic:Int, deffense:Int, luck:Int, money:Int, exp:Int, sprite:UIImage, gear:Gear, dungeon:Dungeon){
        self.name = name
        self.lifes = lifes
        self.attack = attack
        self.magic = magic
        self.deffense = deffense
        self.luck = luck
        self.money = money
        self.exp = exp
        self.sprite = sprite
        self.gear = gear
        self.dungeon = Dungeon()
        self.wasteds = Dungeon()
        
        
    }
    
    func setTotalStats() {
        var totalStats:[Int] = [self.attack,self.deffense,self.magic,self.luck]
        
        for i in self.gear.items {
            totalStats[0] += i.attack
        }
        for i in self.gear.items {
            totalStats[1] += i.deffense
        }
        for i in self.gear.items {
            totalStats[2] += i.magic
        }
        for i in self.gear.items {
            totalStats[3] += i.luck
        }
        self.totalStats = totalStats
        
    }
    func getTotalStats() -> [Int] {
        return self.totalStats
        
    }
    
    
    func getAtackPower() -> Int{
        var count = self.attack + self.deffense + self.luck + self.magic
        for s in self.totalStats {
            count += s
        }
        count = Int(count/4)
        return count
    }
    
    func setDices() {
        var dados = [DiceUser]()
        var count = self.getAtackPower()
        
        count += self.calcBonus()
        if count > 60{
            count = 60
        }
        while count != 0 {
            if count >= 12 {
                dados.append(DiceUser(faces: 12))
                count -= 12
            }else{
                dados.append(DiceUser(faces: count))
                count -= count
            }
        }
        self.dices = dados
    }
    func getDices() -> [DiceUser] {
        return self.dices!
    }
    
    func calcBonus() -> Int{
        var totalBonus:Int = 0
        let totalStats:[Int] = self.getTotalStats()
        for i in totalStats{
            if i >= 15 && i < 30 {
                print("BONUUS +5")
                totalBonus += 5
            }else if i >= 30 && i < 45 {
                print("BONUUS +10")
                totalBonus += 10
            }
        }
        return totalBonus
    }
    
    func getSubViewInfo() -> UIView{
        setTotalStats()
        let heroView = UIView(frame: CGRect(x: 0, y: 0, width: 360, height: 190))
        //heroView.backgroundColor = .red
        let heartY = 25
        //corazones
        switch(self.lifes){
        case 4:
            let heart4 = UIImageView(frame: CGRect(x: 310, y: heartY, width: 30, height: 30))
            heart4.image = UIImage(named: "heart")!
            heroView.addSubview(heart4)
            fallthrough
        case 3:
            let heart3 = UIImageView(frame: CGRect(x: 280, y: heartY, width: 30, height: 30))
            heart3.image = UIImage(named: "heart")!
            heroView.addSubview(heart3)
            fallthrough
        case 2:
            let heart2 = UIImageView(frame: CGRect(x: 250, y: heartY, width: 30, height: 30))
            heart2.image = UIImage(named: "heart")!
            heroView.addSubview(heart2)
            fallthrough
        case 1:
            let heart1 = UIImageView(frame: CGRect(x: 220, y: heartY, width: 30, height: 30))
            heart1.image = UIImage(named: "heart")!
            heroView.addSubview(heart1)
            fallthrough
        case 0:
            //checkWasteds()
            break
        default:
            print("not found")
        }
        let lblAtk = UILabel(frame: CGRect(x: 218, y: 76, width: 30, height: 25))
        lblAtk.text = String(self.getTotalStats()[0])
        lblAtk.textColor = .white
        heroView.addSubview(lblAtk)
        let lblDef = UILabel(frame: CGRect(x: 218, y: 123, width: 30, height: 25))
        lblDef.text = String(self.getTotalStats()[1])
        lblDef.textColor = .white
        heroView.addSubview(lblDef)
        let lblMag = UILabel(frame: CGRect(x: 325, y: 76, width: 30, height: 25))
        lblMag.text = String(self.getTotalStats()[2])
        lblMag.textColor = .white
        heroView.addSubview(lblMag)
        let lblLck = UILabel(frame: CGRect(x: 325, y: 123, width: 30, height: 25))
        lblLck.text = String(self.getTotalStats()[3])
        lblLck.textColor = .white
        heroView.addSubview(lblLck)
        
       
        return heroView
    }
    func getSubViewForInventory() -> UIView{
        setTotalStats()
        let heroView = UIView(frame: CGRect(x: 0, y: 0, width: 360, height: 190))
        //heroView.backgroundColor = .red
        let heartY = 18
        //corazones
        switch(self.lifes){
        case 4:
            let heart4 = UIImageView(frame: CGRect(x: 180, y: heartY, width: 30, height: 30))
            heart4.image = UIImage(named: "heart")!
            heroView.addSubview(heart4)
            fallthrough
        case 3:
            let heart3 = UIImageView(frame: CGRect(x: 150, y: heartY, width: 30, height: 30))
            heart3.image = UIImage(named: "heart")!
            heroView.addSubview(heart3)
            fallthrough
        case 2:
            let heart2 = UIImageView(frame: CGRect(x: 120, y: heartY, width: 30, height: 30))
            heart2.image = UIImage(named: "heart")!
            heroView.addSubview(heart2)
            fallthrough
        case 1:
            let heart1 = UIImageView(frame: CGRect(x: 90, y: heartY, width: 30, height: 30))
            heart1.image = UIImage(named: "heart")!
            heroView.addSubview(heart1)
            fallthrough
        case 0:
            //checkWasteds()
            break
        default:
            print("not found")
        }
        //stats
        let lblAtk = UILabel(frame: CGRect(x: 90, y: 76, width: 30, height: 25))
        lblAtk.text = String(self.getTotalStats()[0])
        lblAtk.textColor = .white
        heroView.addSubview(lblAtk)
        let lblDef = UILabel(frame: CGRect(x: 90, y: 123, width: 30, height: 25))
        lblDef.text = String(self.getTotalStats()[1])
        lblDef.textColor = .white
        heroView.addSubview(lblDef)
        let lblMag = UILabel(frame: CGRect(x: 200, y: 76, width: 30, height: 25))
        lblMag.text = String(self.getTotalStats()[2])
        lblMag.textColor = .white
        heroView.addSubview(lblMag)
        let lblLck = UILabel(frame: CGRect(x: 200, y: 123, width: 30, height: 25))
        lblLck.text = String(self.getTotalStats()[3])
        lblLck.textColor = .white
        heroView.addSubview(lblLck)
        let lblMon = UILabel(frame: CGRect(x: 310, y: 76, width: 30, height: 25))
        lblMon.text = String(self.money)
        lblMon.textColor = .white
        heroView.addSubview(lblMon)
        let lblExp = UILabel(frame: CGRect(x: 310, y: 123, width: 50, height: 25))
        lblExp.text = String(self.exp)
        lblExp.textColor = .white
        heroView.addSubview(lblExp)
        
        
        return heroView
    }
    func getViewForFight(power:Int, atack:Int) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 150))
        
        let heroImg = UIImageView(frame: CGRect(x: 8, y: 8, width: 134, height: 134))
        heroImg.image = self.sprite
        view.addSubview(heroImg)
        switch(self.lifes){
        case 4:
            let heart4 = UIImageView(frame: CGRect(x: 244, y: 8, width: 30, height: 30))
            heart4.image = UIImage(named: "heart")!
            view.addSubview(heart4)
            fallthrough
        case 3:
            let heart3 = UIImageView(frame: CGRect(x: 214, y: 8, width: 30, height: 30))
            heart3.image = UIImage(named: "heart")!
            view.addSubview(heart3)
            fallthrough
        case 2:
            let heart2 = UIImageView(frame: CGRect(x: 184, y: 8, width: 30, height: 30))
            heart2.image = UIImage(named: "heart")!
            view.addSubview(heart2)
            fallthrough
        case 1:
            let heart1 = UIImageView(frame: CGRect(x: 154, y: 8, width: 30, height: 30))
            heart1.image = UIImage(named: "heart")!
            view.addSubview(heart1)
            fallthrough
        case 0:
            //checkWasteds()
            break
        default:
            print("not found")
        }
        let lblPower = UILabel(frame: CGRect(x: 154, y: 50, width: 200, height: 30))
        lblPower.text = "Tu poder: " + String(power) + " +" + String(self.calcBonus()) + " BONUS"
        lblPower.textColor = .white
        view.addSubview(lblPower)
        let lblAtck = UILabel(frame: CGRect(x: 154, y: 90, width: 200, height: 30))
        lblAtck.text = "Tu golpe: " + String(atack)
        lblAtck.textColor = .white
        view.addSubview(lblAtck)
        return view
    }
}

//
//  Monster.swift
//  Dungeon
//
//  Created by Miquel Maria Mirat on 14/11/2018.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//

import UIKit

class Monster: NSObject {
    var name:String
    var attack:Int
    var expReward:Int
    var moneyReward:Int
    var sprite:UIImage
    var dices:[DiceMonster]?
    init(name:String, attack:Int, expReward:Int, moneyReward:Int, sprite:UIImage){
        self.name = name
        self.attack = attack
        self.expReward = expReward
        self.moneyReward = moneyReward
        self.sprite = sprite
    }
    
    
    func getViewForDungeon()-> UIView{
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
        let imgBg = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
        imgBg.image = UIImage(named: "back_heroe")!
        view.addSubview(imgBg)
        let imgMonster = UIImageView(frame: CGRect(x: 5, y: 5, width: 140, height: 140))
        imgMonster.image = self.sprite
        view.addSubview(imgMonster)
        let imgAtk = UIImageView(frame: CGRect(x: 156, y: 22, width: 30, height: 30))
        imgAtk.image = UIImage(named: "damage")!
        view.addSubview(imgAtk)
        let lblAtk = UILabel(frame: CGRect(x: 190, y: 22, width: 40, height: 30))
        lblAtk.text = String(self.attack)
        view.addSubview(lblAtk)
        let imgMoney = UIImageView(frame: CGRect(x: 156, y: 62, width: 30, height: 30))
        imgMoney.image = UIImage(named: "money")!
        view.addSubview(imgMoney)
        let lblMon = UILabel(frame: CGRect(x: 190, y: 62, width: 40, height: 30))
        lblMon.text = String(self.moneyReward)
        view.addSubview(lblMon)
        let imgExp = UIImageView(frame: CGRect(x: 156, y: 102, width: 30, height: 30))
        imgExp.image = UIImage(named: "xp")!
        view.addSubview(imgExp)
        let lblExp = UILabel(frame: CGRect(x: 190, y: 102, width: 40, height: 30))
        lblExp.text = String(self.expReward)
        view.addSubview(lblExp)
        return view
    }
    
    /// Este método calcula a partir del ataque del mostruo al cantidad de dados y su cantidad de caras para generar unos dado que su máxima tirada sea igual al daño del monstruo
    func setDices() {
        var dados = [DiceMonster]()
        var count = self.attack
        if count > 60{
            count = 60
        }
        while count != 0
        {
            if count >= 12 {
                dados.append(DiceMonster(faces: 12))
                count -= 12
            }else{
                dados.append(DiceMonster(faces: count))
                count -= count
            }
            
        }
        self.dices = dados
    }
    func getDices() -> [DiceMonster] {
        return self.dices!
    }
}

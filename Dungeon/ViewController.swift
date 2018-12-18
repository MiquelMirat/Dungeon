//
//  ViewController.swift
//  Dungeon
//
//  Created by Miquel Maria Mirat on 14/11/2018.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//


//github, corazones, navigationBar? //////asasdasdas
import UIKit
import SpriteKit

var heros = [Hero]()

let bgMusic = SKAudioNode(fileNamed: "bg.mp3")
let shopGear = Gear()

class ViewController: UIViewController {
    @IBOutlet weak var btnAnsgar: UIButton!
    @IBOutlet weak var btnFaelwen: UIButton!
    @IBOutlet weak var btnLothar: UIButton!
    @IBOutlet weak var ansgarWasted: UIImageView!
    @IBOutlet weak var faelwenWasted: UIImageView!
    @IBOutlet weak var lotharWasted: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpViewData()
        checkWasteds()
        setUpButtons()
        
        
    }
    
    
    
    
    @IBAction func heroSelected(_ sender: UIButton) {
        let mainSb = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let vc = mainSb.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else{
                return
        }
        print(heros[sender.tag].name)
        vc.actualHero = heros[sender.tag]
        present(vc, animated: true, completion: nil)
        
    }
    
    
    
    func checkWasteds(){
        if heros[0].lifes <= 0 {
            btnAnsgar.isEnabled = false
            ansgarWasted.isHidden = false
        }
        if heros[1].lifes <= 0 {
            btnFaelwen.isEnabled = false
            faelwenWasted.isHidden = false
        }
        if heros[2].lifes <= 0 {
            btnLothar.isEnabled = false
            lotharWasted.isHidden = false
        }
    }
    
    func setUpButtons(){
        btnAnsgar.tag = 0
        btnFaelwen.tag = 1
        btnLothar.tag = 2
        self.view.bringSubviewToFront(btnAnsgar)
        self.view.bringSubviewToFront(btnFaelwen)
        self.view.bringSubviewToFront(btnLothar)
    }
    func setUpViewData(){
        var yinc = 255
        var y = 100
        for h in heros{
            let heroView = UIView(frame: CGRect(x: 30, y: y, width: 360, height: 190))
            heroView.addSubview(h.getSubViewInfo())
            self.view.addSubview(heroView)
            y += yinc
            yinc -= 8
        }
    }
    func setUp(){
        //items tier 1
        let sword1 = Item(name: "Vanity sword", attack: 4, deffense: 0, magic: 0, luck: 1, cost: 35, itemType: .sword, sprite: UIImage(named: "sword1")!)
        let shield1 = Item(name: "Doran shield", attack: 0, deffense: 3, magic: 0, luck: 2, cost: 50, itemType: .shield, sprite: UIImage(named: "shield")!)
        let armour1 = Item(name: "Coated mail", attack: 0, deffense: 4, magic: 0, luck: 0, cost: 40, itemType: .armour, sprite: UIImage(named: "armour")!)
        let helmet1 = Item(name: "Golgen helmet", attack: 1, deffense: 2, magic: 0, luck: 1, cost: 40, itemType: .helmet, sprite: UIImage(named: "helmet1")!)
        let ring1 = Item(name: "The ring", attack: 0, deffense: 0, magic: 4, luck: 3, cost: 20, itemType: .ring, sprite: UIImage(named: "ring")!)
        let boots1 = Item(name: "Rusty boots", attack: 0, deffense: 0, magic: 1, luck: 1, cost: 25, itemType: .boots, sprite: UIImage(named: "boots")!)
        let arrow1 = Item(name: "Infinity bow", attack: 5, deffense: 1, magic: 1, luck: 3, cost: 50, itemType: .arrow, sprite: UIImage(named: "arrow")!)
        let cap1 = Item(name: "Vanish cap", attack: 1, deffense: 2, magic: 4, luck: 1, cost: 40, itemType: .cap, sprite: UIImage(named: "cap")!)
        let scepter1 = Item(name: "Magic scepter", attack: 2, deffense: 2, magic: 3, luck: 1, cost: 60, itemType: .scepter, sprite: UIImage(named: "scepter")!)
        let helmet2 = Item(name: "Silent hat", attack: 0, deffense: 2, magic: 5, luck: 3, cost: 40, itemType: .helmet, sprite: UIImage(named: "helmet3")!)
        let shield2 = Item(name: "Light shield", attack: 1, deffense: 2, magic: 3, luck: 3, cost: 40, itemType: .shield, sprite: UIImage(named: "shield2")!)
        let necklace = Item(name: "Magic necklace", attack: 0, deffense: 0, magic: 5, luck: 3, cost: 80, itemType: .necklace, sprite: UIImage(named: "necklace")!)
        
        
        
        //items tier 2
        let sword1t2 = Item(name: "Silver Vanity sword", attack: 8, deffense: 3, magic: 0, luck: 2, cost: 70, itemType: .sword, sprite: UIImage(named: "sword1")!)
        let shield1t2 = Item(name: "Silver Doran shield", attack: 0, deffense: 5, magic: 0, luck: 4, cost: 100, itemType: .shield, sprite: UIImage(named: "shield")!)
        let armour1t2 = Item(name: "Silver Coated mail", attack: 0, deffense: 8, magic: 0, luck: 0, cost: 80, itemType: .armour, sprite: UIImage(named: "armour")!)
        let helmet1t2 = Item(name: "Silver Golgen helmet", attack: 2, deffense: 4, magic: 0, luck: 2, cost: 80, itemType: .helmet, sprite: UIImage(named: "helmet1")!)
        let ring1t2 = Item(name: "Silver The ring", attack: 0, deffense: 0, magic: 8, luck: 6, cost: 40, itemType: .ring, sprite: UIImage(named: "ring")!)
        let boots1t2 = Item(name: "Silver Rusty boots", attack: 0, deffense: 0, magic: 1, luck: 1, cost: 50, itemType: .boots, sprite: UIImage(named: "boots")!)
        let arrow1t2 = Item(name: "Silver Infinity bow", attack: 5, deffense: 1, magic: 1, luck: 3, cost: 100, itemType: .arrow, sprite: UIImage(named: "arrow")!)
        let cap1t2 = Item(name: "Silver Vanish cap", attack: 1, deffense: 2, magic: 4, luck: 1, cost: 80, itemType: .cap, sprite: UIImage(named: "cap")!)
        let scepter1t2 = Item(name: "Silver Magic scepter", attack: 2, deffense: 2, magic: 3, luck: 1, cost: 120, itemType: .scepter, sprite: UIImage(named: "scepter")!)
        let helmet2t2 = Item(name: "Silver Silent hat", attack: 0, deffense: 2, magic: 5, luck: 3, cost: 80, itemType: .helmet, sprite: UIImage(named: "helmet3")!)
        let shield2t2 = Item(name: "Silver Light shield", attack: 1, deffense: 2, magic: 3, luck: 3, cost: 80, itemType: .shield, sprite: UIImage(named: "shield2")!)
        let necklacet2 = Item(name: "Silver Magic necklace", attack: 0, deffense: 0, magic: 7, luck: 3, cost: 160, itemType: .necklace, sprite: UIImage(named: "necklace")!)
        
        
        //items tier 3
        let sword1t3 = Item(name: "Golden Vanity sword", attack: 16, deffense: 4, magic: 0, luck: 3, cost: 140, itemType: .sword, sprite: UIImage(named: "sword1")!)
        let shield1t3 = Item(name: "Golden Doran shield", attack: 0, deffense: 3, magic: 0, luck: 2, cost: 200, itemType: .shield, sprite: UIImage(named: "shield")!)
        let armour1t3 = Item(name: "Golden Coated mail", attack: 0, deffense: 4, magic: 0, luck: 0, cost: 160, itemType: .armour, sprite: UIImage(named: "armour")!)
        let helmet1t3 = Item(name: "Golden Golgen helmet", attack: 1, deffense: 2, magic: 0, luck: 1, cost: 160, itemType: .helmet, sprite: UIImage(named: "helmet1")!)
        let ring1t3 = Item(name: "Golden The ring", attack: 0, deffense: 0, magic: 4, luck: 3, cost: 80, itemType: .ring, sprite: UIImage(named: "ring")!)
        let boots1t3 = Item(name: "Golden Rusty boots", attack: 0, deffense: 0, magic: 1, luck: 1, cost: 100, itemType: .boots, sprite: UIImage(named: "boots")!)
        let arrow1t3 = Item(name: "Golden Infinity bow", attack: 5, deffense: 1, magic: 1, luck: 3, cost: 200, itemType: .arrow, sprite: UIImage(named: "arrow")!)
        let cap1t3 = Item(name: "Golden Vanish cap", attack: 1, deffense: 2, magic: 4, luck: 1, cost: 160, itemType: .cap, sprite: UIImage(named: "cap")!)
        let scepter1t3 = Item(name: "Golden Magic scepter", attack: 2, deffense: 2, magic: 3, luck: 1, cost: 240, itemType: .scepter, sprite: UIImage(named: "scepter")!)
        let helmet2t3 = Item(name: "Golden Silent hat", attack: 0, deffense: 2, magic: 5, luck: 3, cost: 160, itemType: .helmet, sprite: UIImage(named: "helmet3")!)
        let shield2t3 = Item(name: "Golden Light shield", attack: 1, deffense: 2, magic: 3, luck: 3, cost: 160, itemType: .shield, sprite: UIImage(named: "shield2")!)
        let necklacet3 = Item(name: "Golden Magic necklace", attack: 0, deffense: 0, magic: 10, luck: 3, cost: 320, itemType: .necklace, sprite: UIImage(named: "necklace")!)
        
        
        //shop
        if(shopGear.items.count == 0){
            shopGear.items.append(sword1)
            shopGear.items.append(shield1)
            shopGear.items.append(armour1)
            shopGear.items.append(helmet1)
            shopGear.items.append(boots1)
            shopGear.items.append(ring1)
            shopGear.items.append(arrow1)
            shopGear.items.append(shield2)
            shopGear.items.append(helmet2)
            shopGear.items.append(scepter1)
            shopGear.items.append(cap1)
            shopGear.items.append(necklace)
            //tier 2
            shopGear.items.append(sword1t2)
            shopGear.items.append(shield1t2)
            shopGear.items.append(armour1t2)
            shopGear.items.append(helmet1t2)
            shopGear.items.append(boots1t2)
            shopGear.items.append(ring1t2)
            shopGear.items.append(arrow1t2)
            shopGear.items.append(shield2t2)
            shopGear.items.append(helmet2t2)
            shopGear.items.append(scepter1t2)
            shopGear.items.append(cap1t2)
            shopGear.items.append(necklacet2)
            //tier 3
            shopGear.items.append(sword1t3)
            shopGear.items.append(shield1t3)
            shopGear.items.append(armour1t3)
            shopGear.items.append(helmet1t3)
            shopGear.items.append(boots1t3)
            shopGear.items.append(ring1t3)
            shopGear.items.append(arrow1t3)
            shopGear.items.append(shield2t3)
            shopGear.items.append(helmet2t3)
            shopGear.items.append(scepter1t3)
            shopGear.items.append(cap1t3)
            shopGear.items.append(necklacet3)
        }
        
        //preset gears
        let presetAnsgarGear = Gear()
        let presetFaelwenGear = Gear()
        let presetLotharGear = Gear()
        //preset gears
        if(presetAnsgarGear.items.count == 0 ){
        presetAnsgarGear.items.append(sword1)
        presetAnsgarGear.items.append(shield1)
        presetAnsgarGear.items.append(armour1)
        presetAnsgarGear.items.append(helmet1)
        presetAnsgarGear.items.append(boots1)
        presetAnsgarGear.items.append(ring1)
        }
        if(presetFaelwenGear.items.count == 0){
        presetFaelwenGear.items.append(arrow1)
        presetFaelwenGear.items.append(shield2)
        presetFaelwenGear.items.append(armour1)
        presetFaelwenGear.items.append(helmet2)
        presetFaelwenGear.items.append(boots1)
        presetFaelwenGear.items.append(ring1)
        }
        if(presetLotharGear.items.count == 0){
        presetLotharGear.items.append(scepter1)
        presetLotharGear.items.append(shield2)
        presetLotharGear.items.append(cap1)
        presetLotharGear.items.append(helmet2)
        presetLotharGear.items.append(boots1)
        presetLotharGear.items.append(ring1)
        }
        
        //heroes
        let ansgar = Hero (name: "Ansgar", lifes: 4, attack: 13, magic: 1, deffense: 2, luck: 4 , money: 100, exp: 0, sprite: UIImage(named: "heroe1")!, gear: presetAnsgarGear, dungeon: Dungeon())
        let faelwen = Hero (name: "Faelwen", lifes: 3, attack: 4, magic: 1, deffense: 1, luck: 3, money: 100, exp: 0, sprite: UIImage(named: "heroe2")!, gear: presetFaelwenGear, dungeon: Dungeon())
        let lothar = Hero (name: "Lothar", lifes: 2, attack: 3, magic: 6, deffense: 3, luck: 3, money: 100, exp: 0, sprite: UIImage(named: "heroe3")!, gear: presetLotharGear, dungeon: Dungeon())
        
        //si la lista de heroes esta vacia
        if heros.count == 0{
            heros.append(ansgar)
            heros.append(faelwen)
            heros.append(lothar)
        }
        
        //monsters
        let monster1 = Monster(name: "Rat", attack: 10, expReward: 5, moneyReward: 30, sprite: UIImage(named: "monster3")!)
        let monster2 = Monster(name: "Cangrejo", attack: 15, expReward: 7, moneyReward: 45, sprite: UIImage(named: "monster4")!)
        let monster3 = Monster(name: "Tarantula", attack: 10, expReward: 5, moneyReward: 50, sprite: UIImage(named: "monster5")!)
        let monster4 = Monster(name: "Gusano", attack: 10, expReward: 5, moneyReward: 50, sprite: UIImage(named: "monster8")!)
        let monster5 = Monster(name: "Escarabajo", attack: 10, expReward: 5, moneyReward: 50, sprite: UIImage(named: "monster10")!)
        let monster6 = Monster(name: "Topo", attack: 10, expReward: 5, moneyReward: 80, sprite: UIImage(named: "monster9")!)
        let monster7 = Monster(name: "Caperucita", attack: 10, expReward: 10, moneyReward: 80, sprite: UIImage(named: "monster13")!)
        let monster8 = Monster(name: "Puma azul", attack: 15, expReward: 10, moneyReward: 100, sprite: UIImage(named: "monster7")!)
        let monster9 = Monster(name: "Dron", attack: 15, expReward: 10, moneyReward: 100, sprite: UIImage(named: "monster11")!)
        let monster10 = Monster(name: "No one", attack: 15, expReward: 15, moneyReward: 150, sprite: UIImage(named: "monster6")!)
        let monster11 = Monster(name: "Vieja del bosque", attack: 20, expReward: 15, moneyReward: 150, sprite: UIImage(named: "monster12")!)
        let monster12 = Monster(name: "Ciclope", attack: 20, expReward: 15, moneyReward: 200, sprite: UIImage(named: "monster14")!)
        let monster13 = Monster(name: "Arbol", attack: 25, expReward: 20, moneyReward: 200, sprite: UIImage(named: "monster2")!)
        let monster14 = Monster(name: "Montaña", attack: 30, expReward: 20, moneyReward: 300, sprite: UIImage(named: "monster1")!)
        //monsters tier 2
     
        let masterDungeon = Dungeon()
        if(masterDungeon.monsters.count == 0){
            
            masterDungeon.monsters.append(monster1)
            masterDungeon.monsters.append(monster2)
            masterDungeon.monsters.append(monster3)
            masterDungeon.monsters.append(monster4)
            masterDungeon.monsters.append(monster5)
            masterDungeon.monsters.append(monster6)
            masterDungeon.monsters.append(monster7)
            masterDungeon.monsters.append(monster8)
            masterDungeon.monsters.append(monster9)
            masterDungeon.monsters.append(monster10)
            masterDungeon.monsters.append(monster11)
            masterDungeon.monsters.append(monster12)
            masterDungeon.monsters.append(monster13)
            masterDungeon.monsters.append(monster14)
        }
        
        if ansgar.dungeon.monsters.count == 0 {
            ansgar.dungeon = masterDungeon.copy() as! Dungeon
        }
        if faelwen.dungeon.monsters.count == 0 {
            faelwen.dungeon = masterDungeon.copy() as! Dungeon
        }
        if lothar.dungeon.monsters.count == 0 {
            lothar.dungeon = masterDungeon.copy() as! Dungeon
        }
        
    }


}


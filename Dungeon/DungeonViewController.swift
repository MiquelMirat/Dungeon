//
//  InventoryViewController.swift
//  Dungeon
//
//  Created by Sebastian Alcolea on 11/16/18.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//

import UIKit

class DungeonViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var monsterLenght: UILabel!
    @IBOutlet weak var dungeonPicker: UIPickerView!
    
    var dungeont2:Dungeon = Dungeon()
    var dungeont3:Dungeon = Dungeon()
    var actualHero:Hero?
    var selectedRow:Int?
    var availableMonsters:Dungeon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        availableMonsters = getAvailableMonsters()
        setUpDungeons()
        monsterLenght.text = String(actualHero!.dungeon.monsters.count)
        setUpPickers()
    }
    
    func setUpPickers(){
        dungeonPicker.dataSource = self
        dungeonPicker.delegate = self
        if selectedRow == nil {
            selectedRow = 0
        }
        dungeonPicker.selectRow(selectedRow ?? 0, inComponent: 0, animated: false)
    }
    
    @IBAction func bckButton(_ sender: Any) {
        let mainSb = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let vc = mainSb.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else{
            return
        }
       
        vc.actualHero = actualHero!
        present(vc, animated: true, completion: nil)
        
    }
    @IBAction func btnFight(_ sender: Any) {
        let mainSb = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let vc = mainSb.instantiateViewController(withIdentifier: "FightViewController") as? FightViewController else{
            return
        }
        
        vc.actualHero = actualHero!
        //vc.actualMonster = actualHero!.dungeon.monsters[selectedRow!]
        vc.actualMonster = availableMonsters!.monsters[selectedRow!]
        vc.selectedRow = selectedRow!
        present(vc, animated: true, completion: nil)
    }
    
    func getAvailableMonsters() -> Dungeon{
        let availableMonsters:Dungeon = Dungeon()
        var found:Bool = false
        for m in actualHero!.dungeon.monsters {
            found = false
            for w in actualHero!.wasteds.monsters {
                print("m", m.name , "w ", w.name)
                if w.name == m.name && w.attack == m.attack {
                    print("added")
                    found = true
                }
            }
            if !found {
                availableMonsters.monsters.append(m)
            }
        }
        print("lenght of available dungeon: " , availableMonsters.monsters.count)
        return availableMonsters
        
    }
    
    func setUpDungeons(){
        //monsters tier 2 queens
        let monster1t2 = Monster(name: "Queen Rat", attack: 15, expReward: 10, moneyReward: 50, sprite: UIImage(named: "monster3")!)
        let monster2t2 = Monster(name: "Queen Cangrejo", attack: 20, expReward: 10, moneyReward: 70, sprite: UIImage(named: "monster4")!)
        let monster3t2 = Monster(name: "Queen Tarantula", attack: 20, expReward: 15, moneyReward: 80, sprite: UIImage(named: "monster5")!)
        let monster4t2 = Monster(name: "Queen Gusano", attack: 20, expReward: 15, moneyReward: 80, sprite: UIImage(named: "monster8")!)
        let monster5t2 = Monster(name: "Queen Escarabajo", attack: 20, expReward: 15, moneyReward: 80, sprite: UIImage(named: "monster10")!)
        let monster6t2 = Monster(name: "Queen Topo", attack: 20, expReward: 20, moneyReward: 100, sprite: UIImage(named: "monster9")!)
        let monster7t2 = Monster(name: "Queen Caperucita", attack: 20, expReward: 20, moneyReward: 100, sprite: UIImage(named: "monster13")!)
        let monster8t2 = Monster(name: "Queen Puma azul", attack: 25, expReward: 25, moneyReward: 130, sprite: UIImage(named: "monster7")!)
        let monster9t2 = Monster(name: "Queen Dron", attack: 25, expReward: 35, moneyReward: 130, sprite: UIImage(named: "monster11")!)
        let monster10t2 = Monster(name: "Queen No one", attack: 27, expReward: 40, moneyReward: 190, sprite: UIImage(named: "monster6")!)
        let monster11t2 = Monster(name: "Queen Vieja del bosque", attack: 27, expReward: 45, moneyReward: 150, sprite: UIImage(named: "monster12")!)
        let monster12t2 = Monster(name: "Queen Ciclope", attack: 30, expReward: 50, moneyReward: 240, sprite: UIImage(named: "monster14")!)
        let monster13t2 = Monster(name: "Queen Arbol", attack: 35, expReward: 50, moneyReward: 240, sprite: UIImage(named: "monster2")!)
        let monster14t2 = Monster(name: "Queen Montaña", attack: 35, expReward: 60, moneyReward: 350, sprite: UIImage(named: "monster1")!)
        //monsters tier 3 kings
        let monster1t3 = Monster(name: "King Rat", attack: 20, expReward: 13, moneyReward: 70, sprite: UIImage(named: "monster3")!)
        let monster2t3 = Monster(name: "King Cangrejo", attack: 25, expReward: 13, moneyReward: 90, sprite: UIImage(named: "monster4")!)
        let monster3t3 = Monster(name: "King Tarantula", attack: 25, expReward: 20, moneyReward: 100, sprite: UIImage(named: "monster5")!)
        let monster4t3 = Monster(name: "King Gusano", attack: 25, expReward: 25, moneyReward: 100, sprite: UIImage(named: "monster8")!)
        let monster5t3 = Monster(name: "King Escarabajo", attack: 25, expReward: 25, moneyReward: 100, sprite: UIImage(named: "monster10")!)
        let monster6t3 = Monster(name: "King Topo", attack: 25, expReward: 25, moneyReward: 130, sprite: UIImage(named: "monster9")!)
        let monster7t3 = Monster(name: "King Caperucita", attack: 25, expReward: 40, moneyReward: 130, sprite: UIImage(named: "monster13")!)
        let monster8t3 = Monster(name: "King Puma azul", attack: 40, expReward: 40, moneyReward: 150, sprite: UIImage(named: "monster7")!)
        let monster9t3 = Monster(name: "King Dron", attack: 45, expReward: 50, moneyReward: 150, sprite: UIImage(named: "monster11")!)
        let monster10t3 = Monster(name: "King No one", attack: 45, expReward: 60, moneyReward: 200, sprite: UIImage(named: "monster6")!)
        let monster11t3 = Monster(name: "King Vieja del bosque", attack: 20, expReward: 70, moneyReward: 210, sprite: UIImage(named: "monster12")!)
        let monster12t3 = Monster(name: "King Ciclope", attack: 50, expReward: 75, moneyReward: 280, sprite: UIImage(named: "monster14")!)
        let monster13t3 = Monster(name: "King Arbol", attack: 55, expReward: 80, moneyReward: 280, sprite: UIImage(named: "monster2")!)
        let monster14t3 = Monster(name: "King Montaña", attack: 60, expReward: 100, moneyReward: 400, sprite: UIImage(named: "monster1")!)
        
        if dungeont2.monsters.count == 0 {
            dungeont2.monsters.append(monster1t2)
            dungeont2.monsters.append(monster2t2)
            dungeont2.monsters.append(monster3t2)
            dungeont2.monsters.append(monster4t2)
            dungeont2.monsters.append(monster5t2)
            dungeont2.monsters.append(monster6t2)
            dungeont2.monsters.append(monster7t2)
            dungeont2.monsters.append(monster8t2)
            dungeont2.monsters.append(monster9t2)
            dungeont2.monsters.append(monster10t2)
            dungeont2.monsters.append(monster11t2)
            dungeont2.monsters.append(monster12t2)
            dungeont2.monsters.append(monster13t2)
            dungeont2.monsters.append(monster14t2)
        }
        if dungeont3.monsters.count == 0 {
            dungeont3.monsters.append(monster1t3)
            dungeont3.monsters.append(monster2t3)
            dungeont3.monsters.append(monster3t3)
            dungeont3.monsters.append(monster4t3)
            dungeont3.monsters.append(monster5t3)
            dungeont3.monsters.append(monster6t3)
            dungeont3.monsters.append(monster7t3)
            dungeont3.monsters.append(monster8t3)
            dungeont3.monsters.append(monster9t3)
            dungeont3.monsters.append(monster10t3)
            dungeont3.monsters.append(monster11t3)
            dungeont3.monsters.append(monster12t3)
            dungeont3.monsters.append(monster13t3)
            dungeont3.monsters.append(monster14t3)
        }
        if availableMonsters!.monsters.count < 3{
            addMonstersByTier()
            
        }
        
    }
    
    func addMonstersByTier(){
        switch actualHero!.dungeon.tier {
        case 1:
            for m in dungeont2.monsters {actualHero!.dungeon.monsters.append(m)}
            actualHero!.dungeon.tier = 2
            break
        case 2:
            for m in dungeont3.monsters {actualHero!.dungeon.monsters.append(m)}
            actualHero!.dungeon.tier = 3
            break
        case 3:
            print("CASI HAS GANADO BASICAMENTE")
        default:
            print("tier not found")
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return availableMonsters!.monsters.count
        //return actualHero!.dungeon.monsters.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        selectedRow = row
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        
        return 250
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 170
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        return availableMonsters!.monsters[row].getViewForDungeon()
        //return actualHero!.dungeon.monsters[row].getViewForDungeon()
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  FightViewController.swift
//  Dungeon
//
//  Created by Sebastian Alcolea on 11/16/18.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//

import UIKit
import AVFoundation

class FightViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var wastedImg: UIImageView!
    @IBOutlet weak var monsterImg: UIImageView!
 
    
    @IBOutlet weak var monsterPower: UILabel!
 
    
    @IBOutlet weak var monsterHit: UILabel!

    
    @IBOutlet weak var monsterPicker: UIPickerView!
    @IBOutlet weak var heroPicker: UIPickerView!
    @IBOutlet weak var fightBtn: UIButton!
    
    var swordSoundEffect: AVAudioPlayer?
    var actualHero:Hero?
    var actualMonster:Monster?
    var selectedRow:Int?
    var dim:CGFloat = 80
    let rowsCount:Int = 10_000
    var heroView:UIView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDices()
        setUpPickers()
        setUpView()
        
    }
    
    
    
   
    
    @IBAction func btnFight(_ sender: Any) {
        playSound()
        
        //por cada jugador(hero,monster)
        //por cada dado(component)
        //get random de 0 al size de las caras del dado
        //asignar random
        var heroTurn:Int = 0
        for (index,dice) in actualHero!.dices!.enumerated() {
            let result = Int.random(in: 0..<dice.faces!)
            heroPicker.selectRow(result, inComponent: index, animated: true)
            print("Hero: got a ",(result+1)," from a total of", dice.faces!)
            heroTurn += result
            heroTurn += 1
        }
        //heroHit.text = String(heroTurn)
        var monsterTurn:Int = 0
        for (index,dice) in actualMonster!.dices!.enumerated() {
            let result = Int.random(in: 0..<dice.faces!-1)
            monsterPicker.selectRow(result, inComponent: index, animated: true)
            print("Monster: got a ",(result+1)," from a total of", dice.faces!)
            monsterTurn += result
            monsterTurn += 1
        }
        monsterHit.text = String(monsterTurn)
        if monsterTurn > heroTurn {
            //monstruo gana
            actualHero!.lifes -= 1
            for view in heroView!.subviews {
                view.removeFromSuperview()
            }
            self.heroView!.addSubview(actualHero!.getViewForFight(power: actualHero!.getAtackPower(), atack: heroTurn))
            if actualHero!.lifes == 0 {
                heroWasted()
            }
        }else{
           //heroe gana
            for view in heroView!.subviews {
                view.removeFromSuperview()
            }
            self.heroView!.addSubview(actualHero!.getViewForFight(power: actualHero!.getAtackPower(), atack: heroTurn))
            wastedImg.isHidden = false
            fightBtn.isEnabled = false
            actualHero!.wasteds.monsters.append(actualMonster!)
            print("wasted count", actualHero!.wasteds.monsters.count)
            actualHero!.money += actualMonster!.moneyReward
            
            
        }
        
        
    }
    
    
    @IBAction func btnBck(_ sender: Any) {
        let mainSb = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let vc = mainSb.instantiateViewController(withIdentifier: "DungeonViewController") as? DungeonViewController else{
            return
        }
        vc.selectedRow = selectedRow!
        vc.actualHero = actualHero!
        present(vc, animated: true, completion: nil)
    }
    
   
    
    
    
    func playSound(){
        let path = Bundle.main.path(forResource: "sword.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            swordSoundEffect = try AVAudioPlayer(contentsOf: url)
            swordSoundEffect?.play()
        } catch {
            print("no se encuentra el fichero!")
            // couldn't load file :(
        }
    }
    
    
    
    func heroWasted() {
        let alert = UIAlertController(title: "WASTED", message: "Serás redireccionado a la pantalla principal", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "caguenla...", style: .default, handler: {
            action in self.redirectToHome()
            
        }))
        self.present(alert, animated: true)
        
        
        
    }
    func redirectToHome() {
        let mainSb = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let vc = mainSb.instantiateViewController(withIdentifier: "ViewController") as? ViewController else{
            return
        }
        present(vc, animated: true, completion: nil)
        print("redirecting...")
    }
    
    func setUpView(){
        monsterImg.image = actualMonster!.sprite
        //heroImg.image = actualHero!.sprite
        monsterPower.text = String(actualMonster!.attack)
        //heroPower.text = String(actualHero!.getAtackPower())
        self.heroView = UIView(frame: CGRect(x: 40, y: 650, width: 300, height: 150))
        let interface = actualHero!.getViewForFight(power: actualHero!.getAtackPower(), atack: 0)
        self.heroView!.addSubview(interface)
        self.view.addSubview(self.heroView!)
    }
    
    func setUpPickers(){
        monsterPicker.tag = 0
        heroPicker.tag = 1
        monsterPicker.dataSource = self
        heroPicker.dataSource = self
        monsterPicker.delegate = self
        heroPicker.delegate = self
        monsterPicker.isUserInteractionEnabled = false
        heroPicker.isUserInteractionEnabled = false
        //monsterPicker.selectRow(5, inComponent: 0, animated: false)
        //heroPicker.selectRow(5, inComponent: 0, animated: false)
        //heroPicker.selectRow(5, inComponent: 1, animated: false)
        
    }
    func setUpDices(){
        actualMonster!.setDices()
        actualHero!.setDices()
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0 {
            return actualMonster!.getDices().count
        }else {
            return actualHero!.getDices().count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            //return 1000
            return actualMonster!.getDices()[component].faces!
        }else {
            //return 1000
            return actualHero!.getDices()[component].faces!
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        
        if pickerView.tag == 0 {
            //let newrow = actualMonster!.getDices()[component].faces! % row
            //print("el newRow es", newrow, " de caras: ", actualMonster!.getDices()[component].faces!)
            //return actualMonster!.getDices()[component].getViewForFight(dim: 100, row: row)
            return actualMonster!.getDices()[component].getViewForFight(dim: Int(dim), row: row)
        } else {
            //let newrow = row % actualHero!.getDices()[component].faces!
            return actualHero!.getDices()[component].getViewForFight(dim: Int(dim), row: row)
            //return actualHero!.getDices()[component].getViewForFight(dim: 100, row: newrow)
        }
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return dim
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return dim
    }
}

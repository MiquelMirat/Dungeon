//
//  MenuViewController.swift
//  Dungeon
//
//  Created by Sebastian Alcolea on 11/16/18.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//

import UIKit
import SpriteKit

class MenuViewController: UIViewController {

    var actualHero:Hero?
    
    
    @IBOutlet weak var btnDung: UIButton!
    @IBOutlet weak var actualHeroImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actualHeroImg.image = actualHero!.sprite
    }
    
    @IBAction func btnShop(_ sender: Any) {
        let mainSb = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let vc = mainSb.instantiateViewController(withIdentifier: "ShopViewController") as? ShopViewController else{
            return
        }
        
        vc.actualHero = actualHero!
        present(vc, animated: true, completion: nil)
    }
    @IBAction func btnInventory(_ sender: Any) {
        let mainSb = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let vc = mainSb.instantiateViewController(withIdentifier: "InventoryViewController") as? InventoryViewController else{
            return
        }
        
        vc.actualHero = actualHero!
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnDungeon(_ sender: Any) {
        let mainSb = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let vc = mainSb.instantiateViewController(withIdentifier: "DungeonViewController") as? DungeonViewController else{
            return
        }
        print("entrando dungeon con: " , actualHero!.name, " monstruos:" , actualHero!.dungeon.monsters.count)
        vc.actualHero = actualHero!
        present(vc, animated: true, completion: nil)
        
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

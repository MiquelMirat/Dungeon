//
//  InventoryViewController.swift
//  Dungeon
//
//  Created by Sebastian Alcolea on 11/16/18.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController {

    var actualHero:Hero?
    
    @IBOutlet weak var heroAvatar: UIImageView!
    @IBOutlet weak var item1: UIImageView!
    @IBOutlet weak var item2: UIImageView!
    @IBOutlet weak var item3: UIImageView!
    @IBOutlet weak var item4: UIImageView!
    @IBOutlet weak var item5: UIImageView!
    @IBOutlet weak var item6: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showInfo()
        showStuff()
        // Do any additional setup after loading the view.
    }
    
    
    func showInfo(){
        let heroView = UIView(frame: CGRect(x: 30, y: 600, width: 360, height: 190))
        heroView.addSubview(actualHero!.getSubViewForInventory())
        self.view.addSubview(heroView)
    }
    
    func showStuff(){
        heroAvatar.image = actualHero!.sprite
        //arma
        item1.image = actualHero!.gear.items[0].sprite
        //segunda mano
        item2.image = actualHero!.gear.items[1].sprite
        //cuerpo
        item3.image = actualHero!.gear.items[2].sprite
        //cabeza
        item4.image = actualHero!.gear.items[3].sprite
        //pies
        item5.image = actualHero!.gear.items[4].sprite
        //complementos
        item6.image = actualHero!.gear.items[5].sprite
    }
    
    
    
    
    @IBAction func btnBck(_ sender: Any) {
        let mainSb = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let vc = mainSb.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else{
            return
        }
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

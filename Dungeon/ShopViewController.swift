//
//  ShopViewController.swift
//  Dungeon
//
//  Created by Sebastian Alcolea on 11/16/18.
//  Copyright © 2018 Miquel Maria Mirat. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var shopPicker: UIPickerView!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var atkDiff: UILabel!
    @IBOutlet weak var defDiff: UILabel!
    @IBOutlet weak var magDiff: UILabel!
    @IBOutlet weak var lckDiff: UILabel!
    
    var actualHero:Hero?
    var availableItems:Gear?
    var selectedItem:Item?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        availableItems = getAvailableItems()
        selectedItem = availableItems!.items.first
        money.text = String(actualHero!.money) + "Ω"
        shopPicker.dataSource = self
        shopPicker.delegate = self
        updateItemsStatsDiff(row:0)
    }
    
    @IBAction func btnPurchase(_ sender: Any) {
        if selectedItem!.cost < actualHero!.money {
            //trabajando aquii
            actualHero!.money -= selectedItem!.cost
            money.text = String(actualHero!.money) + "Ω"
            let pos = selectedItem!.getInventoryPosByItemType()
            actualHero!.gear.items[pos] = selectedItem!
            updateItemsStatsDiff(row:0)
            availableItems = getAvailableItems()
            shopPicker .reloadAllComponents()
        }else{
            print("u freacking poor")
        }
    }
    
    
    
    
    @IBAction func btnBck(_ sender: Any) {
        let mainSb = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let vc = mainSb.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else{
            return
        }
        
        vc.actualHero = actualHero!
        present(vc, animated: true, completion: nil)
    }
    
    
    
    func getAvailableItems() -> Gear{
        let availableGear:Gear = Gear()
        var found:Bool = false
        for i in shopGear.items {
            found = false
            for o in actualHero!.gear.items {
                if o.name == i.name && o.cost == o.cost {
                    found = true
                }
            }
            if !found {
                availableGear.items.append(i)
            }
        }
        print("lenght of available gear: " , availableGear.items.count)
        return availableGear
        
    }
    func updateItemsStatsDiff(row:Int){
        selectedItem = availableItems!.items[row]
        
        var diffs:[Int] = [Int]()
        var lbls:[UILabel] = [UILabel]()
        var itemToCompare:Item?
        switch(selectedItem!.itemType){
        case .sword, .scepter, .arrow:
            itemToCompare = actualHero!.gear.items[0]
            break
        case .shield:
            itemToCompare = actualHero!.gear.items[1]
            break
        case .cap, .armour:
            itemToCompare = actualHero!.gear.items[2]
            break
        case .helmet:
            itemToCompare = actualHero!.gear.items[3]
            break
        case .boots:
            itemToCompare = actualHero!.gear.items[4]
            break
        case .ring, .necklace:
            itemToCompare = actualHero!.gear.items[5]
            break
        }
        diffs.append(selectedItem!.attack - itemToCompare!.attack)
        diffs.append(selectedItem!.deffense - itemToCompare!.deffense)
        diffs.append(selectedItem!.magic - itemToCompare!.magic)
        diffs.append(selectedItem!.luck - itemToCompare!.luck)
        lbls.append(atkDiff)
        lbls.append(defDiff)
        lbls.append(magDiff)
        lbls.append(lckDiff)
        var count = 0
        for d in diffs {
            if d == 0 {
                lbls[count].textColor = .white
            }else if d > 0 {
                lbls[count].textColor = .green
            }else if d < 0 {
                lbls[count].textColor = .red
            }
            if(d > 0){
                lbls[count].text = "+" + String(d)
            }else{
                lbls[count].text = String(d)
            }
            
            count+=1
        }
        
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return availableItems!.items.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return 100
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 400
    }
 
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
        return availableItems!.items[row].getItemShopView()
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        updateItemsStatsDiff(row:row)
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

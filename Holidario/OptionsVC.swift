//
//  OptionsVC.swift
//  Holidario
//
//  Created by Tadreik Campbell on 12/26/19.
//  Copyright © 2019 Tadreik Campbell. All rights reserved.
//

import UIKit

class OptionsVC: UITableViewController {
    
    let defaults = UserDefaults.standard
    let selection = UISelectionFeedbackGenerator()
    
    @IBOutlet weak var hapticSwitch: UISwitch!
    @IBOutlet weak var iconSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hapticSwitch.setOn(defaults.bool(forKey: "HapticEnabled"), animated: false)
        hapticSwitch.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        
        iconSwitch.setOn(defaults.bool(forKey: "HolidayIconEnabled"), animated: false)
        iconSwitch.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        
    }
    
    @objc func valueChanged(sender: UISwitch) {
        if defaults.bool(forKey: "HapticEnabled") {
            selection.selectionChanged()
        }
        if sender == hapticSwitch {
            if sender.isOn {
                defaults.set(true, forKey: "HapticEnabled")
            } else {
                defaults.set(false, forKey: "HapticEnabled")
            }
        } else if sender == iconSwitch {
            if sender.isOn {
                changeIcon(to: "")
                defaults.set(true, forKey: "HolidayIconEnabled")
            } else {
                changeIcon(to: "")
                defaults.set(false, forKey: "HolidayIconEnabled")
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    @IBAction func didTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func changeIcon(to iconName: String) {
        guard UIApplication.shared.supportsAlternateIcons else {
            return
        }
        UIApplication.shared.setAlternateIconName(iconName, completionHandler: { (error) in
            if let error = error {
                print("App icon failed to change due to \(error.localizedDescription)")
            } else {
                print("App icon changed successfully")
            }
        })
    }
    
}

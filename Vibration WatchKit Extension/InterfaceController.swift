//
//  InterfaceController.swift
//  weStand Extension
//
//  Created by Vinícius Bonemer on 19/09/2018.
//  Copyright © 2018 SudoWin. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    let vibrations: [(String,WKHapticType)] = [
        ("Click", .click),
        ("Direction Down", .directionDown),
        ("Direction Up",.directionUp),
        ("Failure", .failure),
        ("Notification", .notification),
        ("Retry", .retry),
        ("Start", .start),
        ("Stop", .stop),
        ("Success", .success)
    ]
    
    var itemFromPicker: WKHapticType = .click

    @IBOutlet weak var button: WKInterfaceButton!
    
    @IBOutlet var pickerView: WKInterfacePicker!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects here.
        let pickerItems: [WKPickerItem] = vibrations.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = String(describing: $0.0)
            return pickerItem
        }
        pickerView.setItems(pickerItems)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func pickerChanges(_ value: Int) {
        itemFromPicker = vibrations[value].1
        WKInterfaceDevice.current().play(.click)
    }
    
    @IBAction func vibrate() {
        
        WKInterfaceDevice.current().play(itemFromPicker)
        
    
    }
    
}

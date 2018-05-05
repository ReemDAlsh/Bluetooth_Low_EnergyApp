//
//  PeripheralTableViewCell.swift
//  BluetoothLowEnergy
//
//  Created by Reem alsharif on 4/26/18.
//  Copyright © 2018 Reem alsharif. All rights reserved.
//

import Foundation

import UIKit
import CoreBluetooth

class PeripheralTableViewCell: UITableViewCell {
    @IBOutlet weak var advertisedNameLabel: UILabel!
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var rssiLabel: UILabel!
    
    /**
     Render Cell with Peripheral properties
     */
    func renderPeripheral(_ blePeripheral: BlePeripheral) {
        advertisedNameLabel.text = blePeripheral.advertisedName
        identifierLabel.text = blePeripheral.peripheral.identifier.uuidString
        rssiLabel.text = blePeripheral.rssi.stringValue
        
    }
    
}


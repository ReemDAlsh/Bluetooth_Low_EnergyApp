//
//  GattTableViewCell.swift
//  BluetoothLowEnergy
//
//  Created by Reem alsharif on 4/26/18.
//  Copyright © 2018 Reem alsharif. All rights reserved.
//

import Foundation

import UIKit
import CoreBluetooth

class GattTableViewCell: UITableViewCell {
    @IBOutlet weak var uuidLabel: UILabel!
    @IBOutlet weak var readableLabel: UILabel!
    @IBOutlet weak var writeableLabel: UILabel!
    @IBOutlet weak var notifiableLabel: UILabel!
    @IBOutlet weak var noAccessLabel: UILabel!
    
    let isReal = "true"
    
    
    /**
     Render the cell with Characteristic properties
     */
    func renderCharacteristic(characteristic: CBCharacteristic) {
        uuidLabel.text = characteristic.uuid.uuidString
        
        print(characteristic.uuid.uuidString)
        
        var isReadable = false
        var isWriteable = false
        var isNotifiable = false
        
        if (characteristic.properties.rawValue & CBCharacteristicProperties.read.rawValue) != 0 {
            print("readable")
            isReadable = true
        }
        
        if (characteristic.properties.rawValue & CBCharacteristicProperties.write.rawValue) != 0 ||
            (characteristic.properties.rawValue & CBCharacteristicProperties.writeWithoutResponse.rawValue) != 0 {
            print("writable")
            isWriteable = true
        }
        
        if (characteristic.properties.rawValue & CBCharacteristicProperties.notify.rawValue) != 0 {
            print("notifiable")
            isNotifiable = true
        }
        
        readableLabel.isHidden = !isReadable
        writeableLabel.isHidden = !isWriteable
        notifiableLabel.isHidden = !isNotifiable
        
        if isReadable || isWriteable || isNotifiable {
            noAccessLabel.isHidden = true
        } else {
            noAccessLabel.isHidden = false
        }
        
    }
    
    
}


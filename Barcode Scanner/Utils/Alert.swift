//
//  Alert.swift
//  Barcode Scanner
//
//  Created by Pratyaksh Tyagi on 2/14/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dimissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "Invalid Device Input", message: "Something is wrong with the camera", dimissButton: .default(Text("Ok")))
    
    static let invalidScannedType = AlertItem(title: "Invalid Scan Type", message: "The value scanned does not conform to the EAN-8 and EAN-13 type", dimissButton: .default(Text("OK")))
}

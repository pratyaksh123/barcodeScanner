//
//  BarcodeScannerViewModel.swift
//  Barcode Scanner
//
//  Created by Pratyaksh Tyagi on 2/14/24.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    // Whenever state changes the view gets updated
    @Published var scannedCode = ""
    @Published var shouldRestartSession = false
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        scannedCode.isEmpty ? "Not yet scanned": scannedCode
    }
    
    var statusTextColor: Color {
        scannedCode.isEmpty ? .red : .green
    }
    
}

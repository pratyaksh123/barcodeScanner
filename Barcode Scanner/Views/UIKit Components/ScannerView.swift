//
//  ScannerView.swift
//  Barcode Scanner
//
//  Created by Pratyaksh Tyagi on 2/14/24.
//

import SwiftUI
import AVFoundation



struct ScannerView: UIViewControllerRepresentable {
    @Binding var scannedCode: String
    @Binding var shouldRestartSession: Bool
    @Binding var alertItem: AlertItem?
    
    let audioPlayer = AudioPlayer(soundFileName: "beep.mp3")
    
    func makeUIViewController(context: Context) -> ScannerVC {
        return ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context){
        if shouldRestartSession {
            DispatchQueue.main.async{
                uiViewController.captureSession.startRunning()
            }
            shouldRestartSession = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate {
        private let scannerView: ScannerView
        
        init(scannerView: ScannerView) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            DispatchQueue.main.async {
                self.scannerView.scannedCode = barcode
                self.scannerView.audioPlayer.playSound()
            }
        }
        
        func didSurface(error: CameraError) {
            switch error{
            case .invalidDeviceInput:
                scannerView.alertItem = AlertContext.invalidDeviceInput
            case .invalidScannedValue:
                scannerView.alertItem = AlertContext.invalidScannedType
            }
        }
    }
}

//
//  ContentView.swift
//  Barcode Scanner
//
//  Created by Pratyaksh Tyagi on 2/14/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode, shouldRestartSession: $viewModel.shouldRestartSession, alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
                
                if !viewModel.scannedCode.isEmpty {
                    Button(action: {
                        viewModel.scannedCode = ""
                        viewModel.shouldRestartSession = true
                    })
                    {
                        Text("Retake")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                    .buttonStyle(PlainButtonStyle())
                }
                
            }.navigationTitle("Barcode Scanner")
                .alert(item: $viewModel.alertItem){ alertItem in
                    Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dimissButton)
                }
        }
    }
}

#Preview {
    BarcodeScannerView()
}

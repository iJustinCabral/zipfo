//
//  ContentView.swift
//  Zipfo
//
//  Created by Justin Cabral on 12/28/22.
//

import SwiftUI
import MapKit

struct ContentView: View {

    
    @StateObject private var vm = ZipfoViewModel(service: ZipfoService())
    @State private var zipCode = ""
    @State private var showInfo = false
    
    var body: some View {
        NavigationStack {
            Group {
                switch vm.state {
                case .success(let data):
                    MapView(zipInfo: data)
                        .ignoresSafeArea()
                case .loading:
                    VStack {
                        ProgressView()
                        Text("Loading Zip Information...")
                    }
                case .not_avilable:
                    Text("Search for a Zip Code")
                case .failed(let error):
                    Text("Error \(error.localizedDescription)")
                }
            }
            .navigationTitle("Zipfo")
        }
        .searchable(text: $zipCode, prompt: "Enter a Zipcode")
        .onSubmit(of: .search) {
            Task {
                await vm.getZipInfo(postcode: zipCode)
                self.zipCode = ""
                showInfo.toggle()
            }
        }
        .sheet(isPresented: $showInfo) {
            DetailView(vm: vm)
                .presentationDetents([.medium])
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

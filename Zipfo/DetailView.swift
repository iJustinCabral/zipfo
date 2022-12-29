//
//  DetailView.swift
//  Zipfo
//
//  Created by Justin Cabral on 12/28/22.
//

import SwiftUI

struct DetailView: View {
    
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.dismissSearch) private var dismissSearch
    
    let vm: ZipfoViewModel
    
    var body: some View {
        Group {
            switch vm.state {
            case .success(let data):
                Form {
                    HStack {
                        Text("Zip Code:")
                            .fontWeight(.black)
                        Spacer()
                        Text(data.postcode)
                    }
                    
                    HStack {
                        Text("Country:")
                            .fontWeight(.black)
                        Spacer()
                        Text(data.country)
                    }
                    
                    HStack {
                        Text("City:")
                            .fontWeight(.black)
                        Spacer()
                        Text(data.places[0].placeName)
                    }
                    
                    HStack {
                        Text("State:")
                            .fontWeight(.black)
                        Spacer()
                        Text(data.places[0].state)
                    }
                    
                    Section {
                        Button("Done") {
                            dismiss()
                            dismissSearch()
                        }
                    }
                    
                }
            default:
                Text("No information available")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(vm: ZipfoViewModel(service: ZipfoService()))
    }
}

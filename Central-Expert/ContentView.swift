//
//  ContentView.swift
//  Central-Expert
//
//  Created by Iredefbmac_06 on 28/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Icone1")
                Spacer()
                Text("Icone2")
            }
            HStack() {
                Text("Icone3")
                Spacer()
            }
            HStack{
                Text("Coletar")
                
                Spacer()
                Text("Status: Disponivel")
            }
            HStack {
                Image("Image")
                    .resizable()
                    .frame(width: 400, height: 250)
            }
            VStack(alignment: .leading) {
                HStack() {
                    Text("Teste teste")
                        .frame(width: 130, height: 30)
                        .background(Color.green)
                    Spacer()
                    Text("Teste teste")
                        .frame(width: 130, height: 30)
                        .background(Color.green)
                }
                VStack(){
                    HStack() {
                        Text("280kg")
                            .font(.system(size: 25))
                            .frame(width: 100, height: 30)
                            .background(Color.green)

                        Spacer()
                        
                        Text("280kg")
                            .font(.system(size: 25))
                            .frame(width: 100, height: 30)
                            .background(Color.green)
                                        }
                    Spacer()
                        .frame(height: 30)
                        HStack(alignment: .center) {
                            
                            Text("Icone4")
                                .background(Color.green)
                            
                            Text("RELATAR PROBLEMA")
                                .frame(maxWidth: .infinity, alignment: .center)
                                .background(Color.green)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

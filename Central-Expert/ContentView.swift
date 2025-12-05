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
                Image("logo 16")
                    .frame(width: 20)
                Text("Coletar**AI**")
                Spacer()
                Image("jijoca")
            }
            HStack() {
                Image("Arrow 1")
                Spacer()
            }
            HStack{
                Text("**Coletar**")
                    .font(.system(size: 24))
                Spacer()
                Text("**Status**:")
                Text("Disponível")
                    .foregroundStyle(.green)
            }
            HStack {
                Image("Image")
                    .resizable()
                    .frame(width: 359, height: 188)
            }
        
            VStack(alignment: .leading) {
                HStack(){
                    VStack() {
                        Text("LIXO COLETADO")
                            .foregroundStyle(Color.white)
                            .frame(width: 130, height: 30)
                        HStack{
                            Text("280")
                                .font(.system(size: 40))
                                .foregroundStyle(Color.white)
                            Text("kg")
                                .foregroundStyle(Color.white)
                        }
                    }
                    .frame(width: 169, height: 79)
                    .background(Color.green)
                    
                    VStack {
                        Text("META DIÁRIA")
                            .frame(width: 130, height: 30)
                                                
                        Text("50kg")
                            .font(.system(size: 25))
                            .frame(width: 100, height: 30)
                    }
                }
            }
                    
            HStack() {
                Text("Icone4")
                
                Text("RELATAR PROBLEMA")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

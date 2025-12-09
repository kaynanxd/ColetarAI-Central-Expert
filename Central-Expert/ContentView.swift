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
        
            VStack() {
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
                    .cornerRadius(10)
                    .padding(.top, 30)
                    
                    VStack() {
                        Text("META DIÁRIA")
                            .foregroundStyle(Color.white)
                            .frame(width: 130, height: 30)
                        HStack{
                            Text("50")
                                .font(.system(size: 40))
                                .foregroundStyle(Color.white)
                            Text("kg")
                                .foregroundStyle(Color.white)
                        }
                    }
                    .frame(width: 169, height: 79)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.top, 30)
                }
            }
            ZStack(){
                Image("Vector")
                HStack() {
                    Image("Image 2")
                        .background(Color.white)
                        .cornerRadius(20)
                    
                    Text("RELATAR PROBLEMA")
                        .frame(maxWidth: 280, alignment: .center)
                }
            }
            .padding(.top, 40)
            .frame(width: 338)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

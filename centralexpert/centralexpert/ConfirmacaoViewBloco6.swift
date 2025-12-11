//
//  ConfirmacaoView.swift
//  Telas Central Expert
//
//  Created by Iredefbmac_06 on 09/12/25.
//

// Tela de confirmação para baixar PDF
import SwiftUI

struct ConfirmacaoViewBloco6: View {

    @Binding var mostraModal: Bool
    @State private var baixarPDF = false

    var body: some View {
        ZStack {

            // Fundo
            Color.black.opacity(0.45)
                .ignoresSafeArea()

            // Fundo
            Color.clear
                .ignoresSafeArea()
                .onTapGesture {
                    mostraModal = false
                }

            // ------- Caixa central ---------
            VStack(alignment: .leading, spacing: 12) {

                // LOGO + NOME
                HStack(spacing: 2) {
                    Image("coletarAI_logo")
                        .resizable()
                        .frame(width: 60, height: 60)

                    HStack(spacing: 0) {
                        Image("nome")
                            .resizable()
                            .frame(width: 190,height: 70)
                    }

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .padding(.top, 10)

                // Texto
                Text("Deseja baixar este comprovante como PDF?")
                    .font(.system(size: 13, weight: .heavy))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)

                // Texto observação
                Text("O arquivo será salvo no seu dispositivo com todas as informações do catador.")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)

                // ----- BOTÕES --------
                HStack(spacing: 70) {
                   
                    // Cancelar
                    Button {
                        mostraModal = false
                    } label: {
                        Text("Cancelar")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.00, green: 0.996, blue: 0.357),
                                        Color(red: 0.00, green: 0.698, blue: 0.459)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(20)
                    }

                    // Baixar PDF
                    Button {
                        baixarPDF = true
                    } label: {
                        Text("Baixar PDF")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 0.00, green: 0.996, blue: 0.357),
                                        Color(red: 0.00, green: 0.698, blue: 0.459)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(20)
                    }

                }
                .padding(.horizontal, 25)
                .padding(.top, 12)
                .padding(.bottom, 18)

            }
            .frame(width: 350)
            .padding(.vertical, 5)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black.opacity(0.95),
                        Color.green.opacity(0.95)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(20)
            .shadow(radius: 8)
        }
    }
}

//PREVIEW
#Preview {

    ConfirmacaoViewBloco6(mostraModal: .constant(true))
}

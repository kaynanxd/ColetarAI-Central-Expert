//
//  ContentView.swift
//  Telas Central Expert
//
//  Created by Iredefbmac_06 on 08/12/25.
//

import SwiftUI

struct ComprovanteServicoViewBloco2: View {
    @State private var mostraModal = false

    var body: some View {

        ZStack {

            ZStack(alignment: .top) {

                // ---------- FUNDO VERDE ----------
                VStack(spacing: 0) {
                    Color.clear
                        .frame(height: 170)

                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.30, green: 1.0, blue: 0.40),
                                    Color(red: 0.10, green: 0.60, blue: 0.40)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .offset(x: -20, y: -30)
                        .frame(height: 690)
                }
                .padding(.leading, 28)
                .padding(.trailing, 1)
                .ignoresSafeArea()

                VStack(spacing: 10) {

                    // -------- LOGO + SETA + NOME --------
                    HStack(alignment: .top) {

                        VStack(spacing: 12) {
                            HStack(spacing: 2) {
                                Image("coletarAI_logo")
                                    .resizable()
                                    .frame(width: 30, height: 30)

                                Image("nomee")
                                    .resizable()
                                    .frame(width: 92, height: 40)
                            }

                            Image("seta")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 27, height: 27)
                                .padding(.leading, -55)
                        }

                        Spacer()
                        Image("jijoca_logo")
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)


                    // -------- CARTÃO BRANCO --------
                    VStack(alignment: .leading, spacing: 0) {

                        Text("Comprovante de serviço")
                            .font(.system(size: 25, weight: .bold))
                            .padding(.bottom, 10)
                            .offset(y: -15)


                        VStack(alignment: .leading, spacing: 4) {

                            Text("Nome: Nilton Felipe de Oliveira Braz")
                            Text("Idade: 31 anos")
                            Text("Localidade: Jijoca de Jericoacoara")
                            Text("CPF: 000.000.000-00")
                            Text("Contato: (00) 00000-0000")
                            Text("TOTAL DE RESÍDUOS COLETADOS: 213kg")
                            Text("PRINCIPAIS TIPOS DE RESÍDUOS:")
                            Text("                   1º - Papel")
                            Text("                   2º - Papelão")
                            Text("                   3º - Plástico")
                            Text("Código do usuário: 000")
                            Text("Data de início como Catador: 00/00/0000")

                            Rectangle()
                                .fill(Color.pink.opacity(0.25))
                                .frame(height: 1)
                                .padding(.vertical, 16)

                            JustifiedText(
                                text:
"""
Declaramos, para os devidos fins, que Nilton Felipe de Oliveira Braz, portador(a) do CPF nº 000.000.000-00, exerceu atividades como catador(a) de materiais recicláveis no período de 00/00/0000 até a presente data, realizando coleta, separação e destinação adequada de resíduos recicláveis.

Esta declaração é emitida a pedido do(a) interessado(a) para comprovação de experiência e atuação na área.
"""
                            )
                            .frame(minHeight: 180)
                            .fixedSize(horizontal: false, vertical: true)

                            VStack(spacing: 4) {
                                Rectangle().frame(height: 1)
                                Text("Assinatura do representante:")
                                    .font(.caption)
                                    .padding(.bottom, 5)
                            }
                            .padding(.top, 40)

                            //------- BOTÃO --------
                            HStack {
                                Spacer()
                                Button {
                                    mostraModal = true
                                } label: {
                                    Text("EMITIR COMPROVANTE")
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 13)
                                        .padding(.vertical, 10)
                                        .background(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color(red: 0.50, green: 0.95, blue: 0.60),
                                                    Color(red: 0.20, green: 0.70, blue: 0.44)
                                                ]),
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                        .cornerRadius(13)
                                }
                            }
                            .padding(.top, 60)
                        }
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black)
                    }
                    .padding(27)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 3)
                    .padding(.horizontal)
                }
            }
        }


        .overlay {
            if mostraModal {
                ConfirmacaoViewBloco6(mostraModal: $mostraModal)
                    .transition(.opacity)
                    .animation(.easeInOut, value: mostraModal)
            }
        }
    }
}



struct JustifiedText: UIViewRepresentable {
    var text: String
    var font: UIFont = .systemFont(ofSize: 12, weight: .bold)

    func makeUIView(context: Context) -> UITextView {
        let tv = UITextView()
        tv.isScrollEnabled = false
        tv.backgroundColor = .clear
        tv.textAlignment = .justified
        tv.font = font
        tv.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return tv
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

//PREVIEW
struct ComprovanteServicoView_Previews: PreviewProvider {
    static var previews: some View {
        ComprovanteServicoViewBloco2()
    }
}

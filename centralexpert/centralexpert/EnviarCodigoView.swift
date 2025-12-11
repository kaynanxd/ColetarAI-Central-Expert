import SwiftUI

struct EnviarCodigoView: View {
    var body: some View {

        NavigationStack {
            VStack(spacing: 28) {
                Text("Login")
                    .font(.system(size: 36))
                
                VStack(spacing: 10) {
                    
                    Text("Te enviaremos um código")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    
                    Text("Confira o número do código e digite\nabaixo. O número deve ter seis dígitos.")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 32)
                

                Button {

                } label: {
                    Text("Receber por SMS")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: 210)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(25)
                        .padding(.top, 10)
                }
                .padding(.bottom, 60)
                
                VStack(spacing: 16) {
                    
                    HStack(spacing:135) {
                        Text("CÓDIGO")
                            .font(.system(size: 14))
                        
                        Text("6 Caracteres")
                            .font(.system(size: 14))
                    }
                    .padding(.horizontal, 32)
                    
                    
                    HStack(spacing: 10) {
                        ForEach(0..<6) { _ in
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.gray.opacity(0.15))
                                .frame(width: 45, height: 45)
                        }
                    }
                    
                    
                    HStack {
                        Spacer()
                        Text("Para reenviar o código, aguarde x:xx")
                            .font(.system(size: 14))
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 24)
                    
                }
                
                

                NavigationLink(destination: Tela6trocarsenhar()) {
                    Text("PRÓXIMO")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: 180)
                        .padding(.vertical, 10)
                        .background(Color.green)
                        .cornerRadius(25)
                }
                .padding(.horizontal, 32)
                

                .padding(.top, 30)
                
                
                HStack {
                    Spacer()
                    Button("VOLTAR") {}
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 32)
                
                
                Spacer()
            }
            .padding(.top, 110)

            .navigationBarHidden(true)
        }
    }
}

#Preview {

    NavigationStack {
        EnviarCodigoView()
    }
}

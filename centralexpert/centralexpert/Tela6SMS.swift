import SwiftUI

struct Tela6SMS: View {
    

    @State private var phoneNumber: String = ""
    

    let primaryGreen = Color(red: 0.1, green: 0.7, blue: 0.1) // Verde escuro para o botão

    var body: some View {
        VStack(spacing: 32) {
            

            HStack(spacing: 4) {

                Image("logoApp")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 70, height: 70)

                Text("ColetarAI")
                    .font(.largeTitle)
            }
            .padding(.top, 160)
            // 2. Textos de Autenticação
            VStack(spacing: 15) {
                Text("Autenticação")
                    .font(.system(size: 22, weight: .semibold))
                
                Text("Preencha seu contato telefônico")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
            }

            
            // 3. Campo de Telefon
            HStack(spacing: 8) {
                
                Text("+55")
                    .font(.system(size: 16, weight: .medium))
                    .padding(.leading, 8)
                    .background(Color.clear)
                

                TextField("(xx) xxxxx-xxxx", text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(Color(.systemGray6))
                    .cornerRadius(7)
                    .frame(maxWidth: 160)
            }

            
            
            // 4. Botão CONTINUAR
            NavigationLink(destination: EnviarCodigoView()) {
                Text("CONTINUAR")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: 200)
                    .padding(.vertical, 12)
                    .background(primaryGreen)
                    .cornerRadius(25)
            }

            .padding(.top, 30)
            
            Spacer()
        }
        .multilineTextAlignment(.center)
    }
}

// PREVIEW
#Preview {

    NavigationStack {
        Tela6SMS()
    }
}

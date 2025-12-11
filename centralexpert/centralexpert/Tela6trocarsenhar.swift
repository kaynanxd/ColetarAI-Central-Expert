// Arquivo: Tela6trocarsenhar.swift
import SwiftUI


struct Tela6trocarsenhar: View {
    

    
    @State private var novaSenha: String = ""
    @State private var confirmarSenha: String = ""
    
    let greenColor = Color(red: 0/255, green: 180/255, blue: 0/255)
    
    var body: some View {

        VStack(spacing: 30) {
            
            Spacer().frame(height: 100)
            
            // ------ Título -------
            VStack(spacing: 6) {
                Text("Login")
                    .font(.system(size: 30, weight: .semibold))
                
                Text("Entre com sua senha")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
            }
            
            // ----- Campos de senha -------
            VStack(spacing: 15) {
                
                // Nova senha
                TextField("NOVA SENHA", text: $novaSenha)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .frame(height: 35)
                    .background(Color(.systemGray6))
                    .cornerRadius(7)
                    .padding(.horizontal, 40)
                
                // Confirmar nova senha
                TextField("CONFIRME A NOVA SENHA", text: $confirmarSenha)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .frame(height: 35)
                    .background(Color(.systemGray6))
                    .cornerRadius(7)
                    .padding(.horizontal, 40)
            }
            
            // ------ Observação ------
            HStack(alignment: .top, spacing: 2) {
                Text("•")
                Text("A senha deve conter no mínimo 6 caracteres")
            }
            .font(.system(size: 12))
            .padding(.horizontal, 60)
            .padding(.top, -20)
            .foregroundColor(.black)
            
            // ------ Botão PRÓXIMO --------
            NavigationLink(destination: CatadorCadastroLoginBloco5()) { 
                Text("PRÓXIMO")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(greenColor)
                    .cornerRadius(60)
                    .padding(.horizontal, 120)
            }
            .padding(.top, 20)
            
            Spacer()
        }
    }
}

// PREVIEW
#Preview {

    NavigationStack {
        Tela6trocarsenhar()
    }
}

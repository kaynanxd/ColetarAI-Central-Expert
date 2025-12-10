
import SwiftUI

// --- View Principal ---
struct ContentView: View {
    var body: some View {
        // Usando NavigationStack para gerenciar a navegação
        NavigationStack {
            LoginView()
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

// --- View de Cadastro (Signup) ---
// (Mantida idêntica ao seu código original)
struct SignupView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var remember = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer().frame(height: 40)
            
            HStack {
                Image("logoApp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                
                Text("ColetarIA")
                    .font(.system(size: 32, weight: .bold))
                Spacer()
            }

            Text("Cadastro")
                .font(.system(size: 26, weight: .bold))

            // ... Campos de formulário ...
            HStack(spacing: 10) { Image(systemName: "person.fill").foregroundColor(.green); TextField("Nome", text: $name) }
            Divider()
            HStack(spacing: 10) { Image(systemName: "envelope.fill").foregroundColor(.green); TextField("Email", text: $email) }
            Divider()
            HStack(spacing: 10) { Image(systemName: "lock.fill").foregroundColor(.green); SecureField("Password", text: $password) }
            Divider()
            HStack(spacing: 10) { Image(systemName: "lock.fill").foregroundColor(.green); SecureField("Confirm Password", text: $confirmPassword) }
            Divider()
            Toggle("Lembre-se", isOn: $remember)
            
            Button(action: {}) {
                Text("CADASTRE-SE")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(colors: [.green.opacity(0.7), .green], startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .cornerRadius(12)
            }
            .padding(.top, 10)

            HStack {
                Spacer()
                Text("Já tem uma conta?")
                NavigationLink(destination: LoginView()) {
                    Text("Entre aqui")
                        .foregroundColor(.green)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .font(.footnote)

            Spacer()
        }
        .padding(.horizontal, 30)
        .navigationTitle("Cadastro")
    }
}

// --- LOGIN VIEW (Tela 1) ---
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var remember = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer().frame(height: 40)

            HStack {
                Image("logoApp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                
                Text("ColetarIA")
                    .font(.system(size: 32, weight: .bold))
                Spacer()
            }

            Text("Login")
                .font(.system(size: 26, weight: .bold))

            HStack(spacing: 10) { Image(systemName: "envelope.fill").foregroundColor(.green); TextField("Email", text: $email) }
            Divider()
            HStack(spacing: 10) { Image(systemName: "lock.fill").foregroundColor(.green); SecureField("Password", text: $password) }
            Divider()
            
            HStack {
                Toggle("Lembre-se", isOn: $remember)
                Spacer()
                
                // --- AQUI ESTÁ O LINK PARA A NOVA TELA (Tela 3) ---
                // Usei o "esqueceu a senha" como gatilho para demonstrar a tela nova
                NavigationLink(destination: ConfirmPasswordView()) {
                    Text("esqueceu a senha?")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            Button(action: {}) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(LinearGradient(colors: [.green.opacity(0.7), .green], startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                    .cornerRadius(12)
            }
            .padding(.top, 10)

            HStack {
                Spacer()
                Text("Não tem uma conta?")
                NavigationLink(destination: SignupView()) {
                    Text("Cadastre-se")
                        .foregroundColor(.green)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .font(.footnote)

            Spacer()
        }
        .padding(.horizontal, 30)
        .navigationTitle("Login")
        .navigationBarBackButtonHidden(true) // Opcional: Esconde botão de voltar padrão se quiser
    }
}

// --- NOVA TELA: CONFIRMAR SENHA (Tela 3) ---
// Baseada na imagem que tem o botão "PRÓXIMO" cinza e o texto verde
struct ConfirmPasswordView: View {
    @Environment(\.dismiss) var dismiss // Para o botão Voltar funcionar
    @State private var password = ""
    @State private var remember = false
    @State private var isPasswordVisible = false // Para controlar o "olhinho"

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer().frame(height: 40)

            // Logo
            HStack {
                Image("logoApp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                
                Text("ColetarIA")
                    .font(.system(size: 32, weight: .bold))
                Spacer()
            }

            // Títulos
            VStack(alignment: .leading, spacing: 5) {
                Text("Login")
                    .font(.system(size: 26, weight: .bold))
                
                Text("Confirme sua Senha")
                    .font(.system(size: 16))
                    .foregroundColor(.green) // Texto verde conforme imagem
            }
            .padding(.bottom, 10)

            // Campo de Senha com "Olhinho"
            HStack(spacing: 10) {
                Image(systemName: "lock.fill")
                    .foregroundColor(.green)
                
                if isPasswordVisible {
                    TextField("SENHA", text: $password)
                } else {
                    SecureField("SENHA", text: $password)
                }
                
                // Botão do Olho
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.green)
                }
            }
            Divider() // Linha sublinhada

            // Opções (Lembre-me e Esqueci)
            HStack {
                Toggle("Lembre-me", isOn: $remember)
                    .toggleStyle(SwitchToggleStyle(tint: .green)) // Estilo switch verde
                    .labelsHidden() // Esconde label padrão do toggle para customizar
                
                Text("Lembre-me")
                    .font(.footnote)
                
                Spacer()
                
                Text("ESQUECI MINHA SENHA")
                    .font(.caption)
                    .foregroundColor(.black)
            }
            .padding(.top, 5)

            Spacer().frame(height: 30)

            // Botão PRÓXIMO (Estilo diferente: Fundo Cinza, Texto Verde)
            Button(action: {
                // Ação do botão Próximo
            }) {
                Text("PRÓXIMO")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.15)) // Fundo cinza claro
                    .foregroundColor(.green) // Texto Verde
                    .font(.system(size: 18, weight: .bold))
                    .cornerRadius(25) // Bordas bem arredondadas
            }

            // Botão VOLTAR
            HStack {
                Spacer()
                Button(action: {
                    dismiss() // Volta para a tela anterior
                }) {
                    Text("VOLTAR")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                }
                Spacer()
            }
            .padding(.top, 20)

            Spacer()
        }
        .padding(.horizontal, 30)
        .navigationBarHidden(true) // Esconde a barra de navegação padrão
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Tela 1: Login
            NavigationStack {
                LoginView()
            }
            .previewDisplayName("1. Login")
            
            // Tela 2: Cadastro
            NavigationStack {
                SignupView()
            }
            .previewDisplayName("2. Cadastro")
            
            // Tela 3: Confirmar Senha (Nova)
            NavigationStack {
                ConfirmPasswordView()
            }
            .previewDisplayName("3. Confirmar Senha")
        }
    }
}


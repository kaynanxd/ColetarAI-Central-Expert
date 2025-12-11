
import SwiftUI

// --- View Principal ---
struct CatadorCadastroLoginBloco5: View {
    var body: some View {
        NavigationStack {
            LoginView()
                .toolbar(.hidden, for: .navigationBar)
        }
    }
}

// --- View de Cadastro  ---
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

    }
}

// --- LOGIN VIEW ---
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
                

                NavigationLink(destination: Tela6SMS()) {
                    Text("esqueceu a senha?")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            NavigationLink(destination: LoginInicialView()) {
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
        .navigationBarBackButtonHidden(true)
    }
}

struct ConfirmPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @State private var password = ""
    @State private var remember = false
    @State private var isPasswordVisible = false

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
                    .foregroundColor(.green)
            }
            .padding(.bottom, 10)

            HStack(spacing: 10) {
                Image(systemName: "lock.fill")
                    .foregroundColor(.green)
                
                if isPasswordVisible {
                    TextField("SENHA", text: $password)
                } else {
                    SecureField("SENHA", text: $password)
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(.green)
                }
            }
            Divider()

            HStack {
                Toggle("Lembre-me", isOn: $remember)
                    .toggleStyle(SwitchToggleStyle(tint: .green))
                    .labelsHidden()
                
                Text("Lembre-me")
                    .font(.footnote)
                
                Spacer()
                
                NavigationLink(destination: Tela6SMS()) {
                    Text("esqueceu a senha?")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 5)

            Spacer().frame(height: 30)


            Button(action: {
                // Ação Próximo
            }) {
                Text("PRÓXIMO")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .foregroundColor(.green)
                    .font(.system(size: 18, weight: .bold))
                    .cornerRadius(25)
            }

            // Botão VOLTAR
            HStack {
                Spacer()
                Button(action: {
                    dismiss()
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
        .navigationBarHidden(true)
    }
}

// --- PREVIEW ---
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack { LoginView() }
                .previewDisplayName("1. Login")
            
            NavigationStack { SignupView() }
                .previewDisplayName("2. Cadastro")
            
            NavigationStack { ConfirmPasswordView() }
                .previewDisplayName("3. Confirmar Senha")
        }
    }
}

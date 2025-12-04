Tela de login e cadastro 

// SwiftUI – Telas de Login e Cadastro idênticas ao design enviado

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            LoginView()
                .navigationBarHidden(true)
        }
    }
}

// --- LOGIN ---
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var remember = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer().frame(height: 40)

            HStack {
                Image("logo")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .cornerRadius(12)
                Text("ColetarIA")
                    .font(.system(size: 32, weight: .bold))
                Spacer()
            }

            Text("Login")
                .font(.system(size: 26, weight: .bold))

            // Email
            HStack(spacing: 10) {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.green)
                TextField("Email", text: $email)
            }
            Divider()

            // Password
            HStack(spacing: 10) {
                Image(systemName: "lock.fill")
                    .foregroundColor(.green)
                SecureField("Password", text: $password)
            }
            Divider()

            // Lembre-se e Esqueceu
            HStack {
                Toggle("Lembre-se", isOn: $remember)
                    .toggleStyle(.checkbox)
                Spacer()
                Text("esqueceu a senha?")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            // Botão Login
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

            // Link cadastro
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
    }
}

// --- CADASTRO ---
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
                Image("logo")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .cornerRadius(12)
                Text("ColetarIA")
                    .font(.system(size: 32, weight: .bold))
                Spacer()
            }

            Text("Cadastro")
                .font(.system(size: 26, weight: .bold))

            // Nome
            HStack(spacing: 10) {
                Image(systemName: "person.fill")
                    .foregroundColor(.green)
                TextField("Nome", text: $name)
            }
            Divider()

            // Email
            HStack(spacing: 10) {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.green)
                TextField("Email", text: $email)
            }
            Divider()

            // Password
            HStack(spacing: 10) {
                Image(systemName: "lock.fill")
                    .foregroundColor(.green)
                SecureField("Password", text: $password)
            }
            Divider()

            // Confirm Password
            HStack(spacing: 10) {
                Image(systemName: "lock.fill")
                    .foregroundColor(.green)
                SecureField("Confirm Password", text: $confirmPassword)
            }
            Divider()

            // Lembre-se
            Toggle("Lembre-se", isOn: $remember)
                .toggleStyle(.checkbox)

            // Botão cadastrar
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

            // já tem conta?
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


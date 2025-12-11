
import SwiftUI

// MARK: - HEX Color Support

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}

// MARK: - VIEW
struct LoginInicialView: View {
    
    @State private var lembrar = false
    @State private var senha = ""
    
    var body: some View {

        NavigationStack {
            VStack(spacing: 1) {
                
                ZStack {
                    Image ("logoTitle")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 280)
                    
                    Image("logoApp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 95)
                        .padding(.trailing, 260)
                        .padding(.bottom, 130)
                    
                }
                .padding(.top, 80)
                .padding(.bottom, -100)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Login")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.bottom, 10)
                        .padding(.top, 0)
                    
                    Text("Confirme sua Senha")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "#01F269"))
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 90)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 12) {
                    
                    HStack(spacing: 10) {
                        Image("lockSymbol")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15)
                        
                        Text("SENHA")
                            .font(.system(size: 16))
                            .foregroundColor(Color(hex: "#01F269"))
                        
                        Spacer()
                        
                        Image("eyeSymbol")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22)
                    }
                    .padding(.horizontal, 32)
                    
                    Rectangle()
                        .fill(Color.black.opacity(0.2))
                        .frame(height: 1)
                        .padding(.horizontal, 32)
                    
                    HStack {
                        
                        Button {
                            lembrar.toggle()
                        } label: {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(lembrar ? Color(hex: "#01F269") : Color.clear)
                                .frame(width: 16, height: 16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                        .contentShape(Rectangle())
                        
                        Text("Lembre-me")
                            .font(.system(size: 10))
                        
                        Spacer()
                        

                        NavigationLink(destination: EnviarCodigoView()) {
                            Text("ESQUECI MINHA SENHA")
                                .font(.system(size: 10))
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 32)
                }
                
                Spacer()
                

                NavigationLink(destination: LocationMenuView()) {
                    Text("PRÓXIMO")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(hex: "#01F269"))
                        .frame(maxWidth: 220)
                        .padding(.vertical, 14)
                        .background(Color.gray.opacity(0.15))
                        .cornerRadius(24)
                }
                

                Button("VOLTAR") {}
                    .foregroundColor(.black)
                    .font(.system(size: 15))
                    .padding(.trailing, 32)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.top, 30)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginInicialView()
}

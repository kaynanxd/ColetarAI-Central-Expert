import SwiftUI

// MARK: CONFIGURAÇÃO DO APP
@main
struct centralexpertApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}

// MARK:  1 TELA DE CARREGAMENTO
struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            MainMenuView()
        } else {
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.8), Color("DarkGreen")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    LogoView(isWhiteText: true)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

// MARK: - 2. MENU INICIAL
struct MainMenuView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack(spacing: 0) {
                    Color.white.frame(height: 250)
                    Color.black
                }
                .ignoresSafeArea()
                
                VStack(spacing:0) {

                    Image("imagemFloresta")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .frame(width:330)
                        .cornerRadius(20)
                        .padding(.horizontal)
                        .padding(.top, 40)
                        .clipped()
                    
                    
                    VStack(spacing: 15) {
                        LogoView(isWhiteText: true)
                            .padding(.top, 10)
                        
                        Text("O LIXO DE HOJE É O AVANÇO DE AMANHÃ.\nDOE LIXO, O MEIO AMBIENTE AGRADECE!")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .textCase(.uppercase)
                    }
                    
                    Spacer()
                    
                
                    VStack(spacing: 20) {
                        NavigationLink(destination: GeneratorMenuView()) {
                            CustomButtonLabel(text: "GERADOR", showArrow: true)
                        }
                        
                        Button(action: { print("Cooperativa clicado") }) {
                            CustomButtonLabel(text: "COOPERATIVA", showArrow: true)
                        }
                        
                        Button(action: { print("Catador clicado") }) {
                            CustomButtonLabel(text: "CATADOR", showArrow: true)
                        }
                    }
                    .padding(.bottom, 50)
                    .padding(.horizontal)
                }
            }
        }
        .tint(.white)
    }
}

// MARK: - 3. MENU DO GERADOR
struct GeneratorMenuView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer().frame(height: 50)
                
                LogoView(isWhiteText: true)
                
                Spacer()
                
                VStack(spacing: 20) {
                    Button(action: {}) {
                        GeneratorButtonLabel(text: "Pequeno Gerador", iconName: "person.fill")
                    }
                    
                    Button(action: {}) {
                        GeneratorButtonLabel(text: "Pequeno Gerador\nComercial", iconName: "storefront.fill")
                    }
                    
                    Button(action: {}) {
                        GeneratorButtonLabel(text: "Grande Gerador", iconName: "building.2.fill")
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - 4. MENU DE LOCALIZAÇÃO (NOVA TELA)
struct LocationMenuView: View {
    
    // Variável que recebera os dadod do Backend no futuro
    var locationName: String = "Jijoca de\nJericoacoara"
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer().frame(height: 50)
                
                
                LogoView(isWhiteText: true)
                
                
                HStack(alignment: .center, spacing: 25) {
                    Text(locationName)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Image(systemName: "mappin.and.ellipse")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                .padding(.top, 10)
                
                Spacer()
                
                
                VStack(spacing: 30) {
                    
                    Button(action: {}) {
                        GeneratorButtonLabel(text: "COLETAR", iconName: "arrow.triangle.2.circlepath")
                    }
                    
                    
                    Button(action: {}) {
                        GeneratorButtonLabel(text: "DADOS", iconName: "server.rack")
                    }
                    
                    
                    Button(action: {}) {
                        GeneratorButtonLabel(text: "COMPROVANTES", iconName: "list.bullet.rectangle.portrait")
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}
// MARK: COMPONENTES REUTILIZÁVEIS

struct LogoView: View {
    var isWhiteText: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            
            
             Image("logoApp")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
            

            
            Text("ColetarAI")
                .font(.system(size: 46, weight: .bold))
                .foregroundColor(isWhiteText ? .white : .black)
        }
    }
}

struct CustomButtonLabel: View {
    let text: String
    let showArrow: Bool
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 21, weight: .heavy))
                .foregroundColor(.white)
            
            Spacer()
            
            if showArrow {
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .bold))
            }
        }
        .padding()
        .frame(height: 80)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("BrightGreen"), Color("DarkGreen")]), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(10)
    }
}

struct GeneratorButtonLabel: View {
    let text: String
    let iconName: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(height: 24)
                .foregroundColor(.white)
        }
        .padding(.horizontal, 20)
        .frame(height: 80)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("BrightGreen"), Color("DarkGreen")]), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(12)
    }
}

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}

extension Color {
    static let darkGreen = Color(red: 0.0, green: 0.5, blue: 0.2)
    static let brightGreen = Color(red: 0.0, green: 0.8, blue: 0.4)
}

extension Color {
    init(_ name: String) {
        if name == "DarkGreen" {
            self = .darkGreen
        } else if name == "BrightGreen" {
            self = .brightGreen
        } else {
            self = .green
        }
    }
}

#Preview("1 - Splash Screen") {
    SplashScreenView()
}

#Preview("2 - Menu Inicial") {
    MainMenuView()
}

#Preview("3 - Menu Gerador") {
    GeneratorMenuView()
}

#Preview("4 - Menu Localização") {
   
    LocationMenuView(locationName: "Jijoca de\nJericoacoara")
}

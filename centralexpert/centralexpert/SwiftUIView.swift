
import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        // VStack principal com espaçamento padrão de 15 entre os elementos
        VStack(alignment: .leading, spacing: 15) {
            
            // --- 1. CABEÇALHO (Logo e Localização) ---
            HStack(alignment: .top) {
                // Logo
                HStack(spacing: 5) {
                    Image("logoApp") // Certifique-se que este asset existe
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Text("Coletar")
                        .font(.title3)
                        .fontWeight(.medium) +
                    Text("AI")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                // Localização
                HStack(alignment: .center, spacing: 5) {
                    VStack(alignment: .trailing, spacing: 0) {
                        Text("Jijoca de")
                            .font(.footnote)
                        Text("Jericoacoara")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    Image(systemName: "mappin.and.ellipse")
                        .font(.title3)
                }
            }
            .padding(.top, 10)

            // --- 2. SETA DE VOLTAR ---
            Button(action: {
                // Ação para voltar
            }) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundColor(.black)
            }
            // Pequeno ajuste vertical para alinhar com a referência
            .padding(.vertical, 5)

            // --- 3. TÍTULO E STATUS ---
            HStack(alignment: .bottom) {
                Text("Coletar")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                HStack(spacing: 5) {
                    Text("Status:")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text("Disponível")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                .padding(.bottom, 8) // Ajuste fino para alinhar com a base do título grande
            }

            // --- 4. IMAGEM DO MAPA ---
            // CORREÇÃO: Usando o nome original "Image" que funciona para você
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(15)
                .clipped()

            // --- 5. CARDS DE INFORMAÇÃO ---
            HStack(spacing: 15) {
                // Card 1: LIXO COLETADO
                VStack(alignment: .leading, spacing: 10) {
                    Text("LIXO COLETADO")
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    HStack(alignment: .lastTextBaseline, spacing: 2) {
                        Text("280")
                            .font(.system(size: 42, weight: .bold))
                        Text("kg")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(15)
                
                // Card 2: META DIÁRIA
                VStack(alignment: .leading, spacing: 10) {
                    Text("META DIÁRIA")
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    HStack(alignment: .lastTextBaseline, spacing: 2) {
                        Text("50")
                            .font(.system(size: 42, weight: .bold))
                        Text("kg")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(15)
            }
            .padding(.vertical, 10)

            // CORREÇÃO: Spacer() REMOVIDO DAQUI.
            // O botão agora subirá e ficará logo abaixo dos cards.

            // --- 6. BOTÃO RELATAR PROBLEMA ---
            Button(action: {
                // Ação do botão
            }) {
                HStack(spacing: 15) {
                    // Ícone de alerta no círculo branco
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.title3)
                            .foregroundColor(.red)
                    }
                    
                    Text("RELATAR PROBLEMA")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(Color.green)
                .cornerRadius(15)
            }
            // Padding inferior para não grudar na borda da tela
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 20)
        // Se quiser que todo o conteúdo fique centralizado verticalmente na tela,
        // descomente a linha abaixo com o Spacer(). Caso contrário, ele ficará no topo.
        // Spacer()
    }
}

#Preview {
    SwiftUIView()
}

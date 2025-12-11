
import SwiftUI

// --- MODELOS DE DADOS ---
struct ChartData: Identifiable {
    let id = UUID()
    let month: String
    let collected: CGFloat
    let goal: CGFloat
}

struct Collector: Identifiable {
    let id = UUID()
    let name: String
    let weight: String
}

struct Bloco3: View {
    @Environment(\.dismiss) var dismiss


    let scaleFactor: CGFloat = 2.0

    let chartData: [ChartData] = [
        ChartData(month: "Jan", collected: 40, goal: 30),
        ChartData(month: "Fev", collected: 60, goal: 50),
        ChartData(month: "Mar", collected: 80, goal: 65),
        ChartData(month: "Abr", collected: 50, goal: 50),
        ChartData(month: "Mai", collected: 70, goal: 60),
        ChartData(month: "Jun", collected: 45, goal: 45),
        ChartData(month: "Jul", collected: 90, goal: 50)
    ]

    let collectors: [Collector] = [
        Collector(name: "NILTON BRAZ", weight: "12kg"),
        Collector(name: "SALATYEL", weight: "17kg"),
        Collector(name: "JADE", weight: "15kg"),
        Collector(name: "GABRIEL", weight: "14kg"),
        Collector(name: "ARTHUR", weight: "34kg")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // --- 1. CABEÇALHO ---
                    headerView

                    // --- 2. SETA DE VOLTAR ---
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 20) {
                        // Legenda
                        HStack(spacing: 15) {
                            legendItem(color: .green, text: "Coletado")
                            legendItem(color: .indigo, text: "Meta Mensal")
                        }
                        
                        // O Gráfico
                        HStack(alignment: .bottom, spacing: 16) {
                            ForEach(chartData) { data in
                                VStack(spacing: 8) {
                                    HStack(alignment: .bottom, spacing: 6) {
                                        Rectangle()
                                            .fill(Color.indigo)
                                            .frame(width: 12, height: data.goal * scaleFactor)
                                            .cornerRadius(4)

                                        Rectangle()
                                            .fill(Color.green)
                                            .frame(width: 12, height: data.collected * scaleFactor)
                                            .cornerRadius(4)
                                    }
                                    // Mês
                                    Text(data.month)
                                                    .font(.caption)
                                                    .fontWeight(.medium)
                                                    .foregroundColor(.black)
                                            }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top, 15)
                        
                        Divider()
                    }
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.green.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.horizontal)

                    // --- 4. CARD HISTÓRICO DE COLETAS ---
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Histórico de Coletas")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 5)

                        ForEach(collectors) { item in
                            HStack {
                                Text(item.name)
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(item.weight)
                                    .fontWeight(.bold)
                            }
                            Divider()
                        }
                        
                        HStack {
                            Spacer()
                            Button(action: {

                            }) {
                                Text("VER MAIS")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 8)
                                    .background(Color.green)
                                    .cornerRadius(20)
                            }
                        }
                        .padding(.top, 5)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.green.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
            }
        }
    }

    // --- COMPONENTES AUXILIARES ---

    var headerView: some View {
        HStack(alignment: .top) {
            HStack(spacing: 5) {
                Image("logoApp")
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
        .padding(.horizontal)
        .padding(.top, 10)
    }

    func legendItem(color: Color, text: String) -> some View {
        HStack(spacing: 5) {
            Rectangle()
                .fill(color)
                .frame(width: 15, height: 10)
            Text(text)
                .font(.caption)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    Bloco3()
}

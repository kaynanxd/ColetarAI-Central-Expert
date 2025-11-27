import SwiftUI

struct Bloco3: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
            HStack(){
                VStack(alignment: .leading){
                    Image("logoo")
                    NavigationLink(value: "Back"){
                        Image("Arrow")
                            .padding(.top, 10)                    }
                }
                Spacer()
                Image("Location")
            }
            .padding(.horizontal)
            Image("graficos")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            Image("geradores")
                    .resizable()
                    .scaledToFit()
            .padding()
            Spacer()
            }
        }
    }
}
#Preview {
    Bloco3()
}


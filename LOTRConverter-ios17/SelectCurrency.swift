import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss

    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency

    var body: some View {
        ZStack {
            // background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown.opacity(0.5))

            VStack {
                // text
                Text("Select the currency you are starting with: ")
                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)

                // currency icons
                IconGrid(currency: $topCurrency)

                // text
                Text("Select the currency you would like to convert to: ")
                    .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)

                // currency icons
                IconGrid(currency: $bottomCurrency)

                // done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.title)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(topCurrency: .constant(.silverPenny), bottomCurrency: .constant(.goldPenny))
}

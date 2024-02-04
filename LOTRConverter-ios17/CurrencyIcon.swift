import SwiftUI

struct CurrencyIcon: View {
    let currencyImage: ImageResource
    let currencyName: String

    var body: some View {
        ZStack(alignment: .bottom) {
            // currency image
            Image(currencyImage)
                .resizable()
                .scaledToFit()
                .padding(10)

            // text
            Text(currencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/)
                .background(.brown.opacity(0.75))
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    CurrencyIcon(currencyImage: .copperpenny, currencyName: "Cooper Penny")
}

import SwiftUI

struct ExchangeRate: View {
    let leadingImage: ImageResource
    let trailingImage: ImageResource
    let currencyText: String

    var body: some View {
        HStack {
            // left currency image
            Image(leadingImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)

            // exchange rate text
            Text(currencyText)

            // right currency image
            Image(trailingImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leadingImage: .silverpiece, trailingImage: .goldpiece, currencyText: "1 Gold Piece = 4 Gold Pennies")
}

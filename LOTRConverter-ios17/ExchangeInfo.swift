import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // background image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown.opacity(0.5))

            VStack {
                Spacer()
                // title text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(5)

                // description text
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title2)
                    .padding()

                // exchange rates
                ExchangeRate(leadingImage: .goldpiece, trailingImage: .goldpenny, currencyText: "1 Gold Piece = 4 Gold Pennies")
                
                ExchangeRate(leadingImage: .goldpenny, trailingImage: .silverpiece, currencyText: "1 Gold Penny = 4 Silver Pennies")
            
                ExchangeRate(leadingImage: .silverpiece, trailingImage: .silverpenny, currencyText: "1 Silver Piece = 4 Silver Pennies")
                
                ExchangeRate(leadingImage: .silverpenny, trailingImage: .copperpenny, currencyText: "1 Silver Penny = 100 Cooper Pennies")

                Spacer()

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
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}


//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Alin RADU on 02.02.2024.
//

import SwiftUI

struct IconGrid: View {
    @Binding var currency: Currency

    let columns = [GridItem(), GridItem(), GridItem()]

    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(Currency.allCases) { currency in
                if currency == self.currency {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: /*@START_MENU_TOKEN@*/ .black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 3)
                                .opacity(0.3)
                        }
                } else {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.currency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    IconGrid(currency: .constant(.silverPiece))
}

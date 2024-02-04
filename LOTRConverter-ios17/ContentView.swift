import SwiftUI
import TipKit

struct ContentView: View {
    @State private var showExchangeInfo = false
    @State private var showSelectCurrency = false

    @State var leftCurrency: Currency = .silverPenny
    @State var rightCurrency: Currency = .goldPenny

    @State private var leftAmount = ""
    @State private var rightAmount = ""

    @FocusState var leftTyping
    @FocusState var rightTyping

    var body: some View {
        print("showExchangeInfo-> \(showExchangeInfo)")

        return ZStack {
            // background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()

            VStack {
                // prancy poney Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                // currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                // currency conversion section
                HStack {
                    // left conversion section /////////////////////////////////////////////////
                    VStack {
                        // currency
                        CurrencyBasic(
                            currency: $leftCurrency,
                            showSelectCurrency: $showSelectCurrency)
                        .popoverTip(CurrencyTip(), arrowEdge: .bottom)

                        // text Field
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                    }
                    .padding(.vertical)

                    // equal sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    // right conversion section  /////////////////////////////////////////////////
                    VStack {
                        // currency
                        CurrencyBasic(
                            currency: $rightCurrency,
                            showSelectCurrency: $showSelectCurrency
                        )
                        // text Field
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
                .background(.black.opacity(0.5))
                .clipShape(.capsule)

                Spacer()

                // Info button
                HStack {
                    Spacer()

                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
            // .border(.yellow)
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo, content: {
            ExchangeInfo()
        })
        .sheet(isPresented: $showSelectCurrency, content: {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        })
    }
}

#Preview {
    ContentView()
}

struct CurrencyBasic: View {
    @Binding var currency: Currency
    @Binding var showSelectCurrency: Bool

    var body: some View {
        HStack {
            // currency image
            Image(currency.image)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            // currency text
            Text(currency.name)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .onTapGesture {
            self.showSelectCurrency.toggle()
        }
    }
}

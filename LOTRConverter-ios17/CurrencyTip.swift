import SwiftUI
import TipKit

struct CurrencyTip: Tip {
    var title: Text {
        Text("Change currency")
    }

    var message: Text? {
        Text("You can tap the left or right currency to bring up the Select Currency screen.")
    }
}

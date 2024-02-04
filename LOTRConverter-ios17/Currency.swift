import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
    case cooperPenny = 640
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1

    // var id: Currency { self }
    var id: Double { rawValue }

    var image: ImageResource {
        switch self {
        case .cooperPenny:
            ImageResource.copperpenny
        case .silverPenny:
            ImageResource.silverpenny
        case .silverPiece:
            ImageResource.silverpiece
        case .goldPenny:
            ImageResource.goldpenny
        case .goldPiece:
            ImageResource.goldpiece
        }
    }

    var name: String {
        switch self {
        case .cooperPenny:
            "Copper Penny"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        }
    }

    func convert(_ amountString: String, to currency: Currency) -> String {
        guard let doubleAmount = Double(amountString) else {
            return ""
        }

        let convertedAmount = (doubleAmount / rawValue) * currency.rawValue

        return String(format: "%.2f", convertedAmount)
    }
}

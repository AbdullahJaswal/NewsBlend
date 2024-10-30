import SwiftUI

struct CategoriesTileView: View {
    let category: String
    let categoryColour: Color?
    let icon: String?

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(categoryColour ?? .primary)

            if let ic = icon {
                Image(systemName: ic)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .rotationEffect(.degrees(randomRotation()))
                    .scaleEffect(1.1)
                    .clipped()
                    .foregroundStyle(.white.opacity(0.34))
            }

            Text(category)
                .font(.title2)
                .bold()
                .foregroundStyle(.white)
        }
        .frame(maxWidth: UIScreen.main.bounds.width / 2, maxHeight: 100)
    }

    private func randomRotation() -> Double {
        let ranges = [-20.0 ... -10.0, 10.0 ... 20.0]
        let selectedRange = ranges.randomElement()!

        return Double.random(in: selectedRange)
    }
}

#Preview {
    CategoriesTileView(
        category: "Politics",
        categoryColour: Color(red: 252 / 255, green: 7 / 255, blue: 7 / 255),
        icon: "cross.case"
    )
}

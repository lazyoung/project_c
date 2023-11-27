import SwiftUI

struct CoinsView: View {
    
    @AppStorage("itemCoins") private var itemCoins = 0
    @AppStorage("dailyCoins") private var dailyCoins = 0
    @AppStorage("coinItemName") private var coinItemName = "nil"
    
    let cornerRadius: CGFloat = 10

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(Color.yellow, lineWidth: 2)
            
            HStack {
                HStack {
                    Text(" \(coinItemName):")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                }
                .padding(.leading, 12)
                
                Spacer()

                Text(" \(itemCoins) / \(dailyCoins)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                    .padding(.trailing, 12)
            }
        }
        .frame(height: 50)
    }
}

// MARK: - Preview
struct CoinsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsView()
            .previewLayout(.fixed(width: 375, height: 50))
    }
}

import SwiftUI

struct CoinsView: View {
    
    @Binding var itemCoins: Int
    @Binding var dailyCoins: Int
    @Binding var coinItemName: String
    
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
                }
                            
                Spacer()

                Text(" \(itemCoins) / \(dailyCoins)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                    .padding()
            }
        }
        .frame(height: 50)
    }
}


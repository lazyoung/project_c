import SwiftUI

struct CoinsView: View {
    
    // MARK: - Variable
    @ObservedObject var timerManager: TimerManager
    
    @AppStorage("coins") private var coins = 0
    
    @Binding var selectionIndex: Int
    
    let cornerRadius: CGFloat = 10
    
    // TODO: show process bar; show coins by types; show coin icons
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(Color.yellow, lineWidth: 5)
            
            HStack {
                // Title
                HStack {
                    Text("daily coins:")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.yellow)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                }
                .padding(.leading, 12)
                
                Spacer()

                // Number
                Text(" \(coins)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.primary)
                    .padding(.trailing, 100)
            }
        }
        .frame(height: 50)
    }
}

// MARK: - Preview
struct CoinsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinsView(timerManager: TimerManager(), selectionIndex: Binding.constant(0))
            .previewLayout(.fixed(width: 375, height: 50))
    }
}

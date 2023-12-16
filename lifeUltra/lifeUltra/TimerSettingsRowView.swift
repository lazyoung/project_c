import SwiftUI

struct TimerSettingsRowView: View {
    
    var iconName: String
    var iconColor: Color
    var firstText: LocalizedStringKey
    var secondText: LocalizedStringKey
    
    init(iconName: String, iconColor: Color, firstText: String, secondText: String) {
        self.iconName = iconName
        self.firstText = LocalizedStringKey(firstText)
        self.secondText = LocalizedStringKey(secondText)
        self.iconColor = iconColor
    }
    
    var body: some View {
        HStack {
            
            Text(firstText)
                .fontWeight(.regular)
                .foregroundColor(Color.primary)
                .padding(.leading, 5)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Spacer()
            
            Text(secondText)
                .fontWeight(.regular)
                .foregroundColor(Color.secondary)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold, design: .rounded))
            
        }
        
    }
}

// MARK: - Preview
struct TimerSettingsRow_Previews: PreviewProvider {
    static var previews: some View {
        TimerSettingsRowView(iconName: "gear", iconColor: Color.blue, firstText: "Application", secondText: "Todo")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}



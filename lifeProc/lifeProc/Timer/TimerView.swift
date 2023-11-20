import SwiftUI

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

struct TimerView: View {
    
    // MARK: - Variable
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @ObservedObject var timerManager: TimerManager
    
    // MARK: - View
    var body: some View {
        
        VStack {
            ZStack {
                VStack(spacing: 10) {
                    
                    if timerManager.timerStart {
                        Text("\(timerManager.currentMinute) min")
                            .fontWeight(.bold)
                            .font(.system(size: 45))
                    }
                    
                    Text(timerManager.currentText)
                        .fontWeight(.light)
                        .font(.system(size: 30))
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                    
                }
                .frame(width: screenWidth/2.6, height: screenWidth/2.6, alignment: .center)
                .scaledToFill()
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                
                ZStack {
                    
                    // BG Gray Circle
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth: screenWidth/10, lineCap: .round))
                    
                    // Active Timer Circle
                    Circle()
                        .trim(from: 0, to: timerManager.currentTo)
                        .stroke(timerManager.currentColor, style: StrokeStyle(lineWidth: screenWidth/15, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                    
                    // Button
                    Button(action: {
                        timerManager.timerStart.toggle()
                    }, label: {
                        Circle() // BG Gray Circle
                            .trim(from: 0, to: 1)
                            .foregroundColor(Color.clear)
                    })

                }
                .frame(width: screenWidth/1.5, height: screenWidth/1.5, alignment: .center)
            }
            
        }
        .onReceive(self.timer, perform: { _ in
            if self.timerManager.timerStart {
                
                withAnimation {
                    timerManager.timerFired()
                }
                
            }
        })
        .onChange(of: self.timerManager.timerStart) {
            if !self.timerManager.timerStart {
                withAnimation {
                    timerManager.resetTimer()
                }
            }
        }
        
    }
}


// MARK: - Preview
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerManager: TimerManager())
    }
}

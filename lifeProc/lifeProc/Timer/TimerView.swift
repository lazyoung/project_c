import SwiftUI

struct TimerView: View {

    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @ObservedObject var timerManager: TimerManager

    var body: some View {
        
        ZStack {
            VStack {
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
            
            ZStack {
                Circle()
                    .stroke(
                        Color.gray.opacity(0.3),
                        style: StrokeStyle(lineWidth: 3, lineCap: .round)
                    )
                Circle()
                    .trim(from: 0, to: timerManager.currentTo)
                    .stroke(
                        timerManager.currentColor,
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))

                 Button(
                    action: {
                        timerManager.timerStart.toggle()
                    },
                    label: {
                        Circle().foregroundColor(Color.clear)
                    })
                }
        }
        .padding()
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


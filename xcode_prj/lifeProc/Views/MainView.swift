import SwiftUI

struct MainView: View {
    
    // MARK: - Variable
    @AppStorage("work") private var work = 25
    @AppStorage("shortRest") private var shortRest = 5
    @AppStorage("longRest") private var longRest = 15
    @AppStorage("numOfSection") private var numOfSection = 4
    @AppStorage("coins") private var coins = 0
    
    @StateObject var timerManager: TimerManager = TimerManager()
    
    @State private var selectionIndex = 0
    
    var body: some View {
        
        NavigationView {

            VStack {
                CoinsView(timerManager: timerManager, selectionIndex: $selectionIndex)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                
                TabView(selection: $selectionIndex) {
                    TimerMainView(timerManager: timerManager)
                        .padding(.top, 5)
                        .tag(0)
                    
                    // TODO: checklist view
                    // TODO: alarm check view
                    // TODO: personal health view
                    // TODO: diary view
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .navigationBarTitle(Text("LifeProc"))
                .navigationBarTitleDisplayMode(.inline)
                .onChange(of: selectionIndex) {
                    self.timerManager.resetTimer()
                }
            }
        }
        .onAppear(perform: {
            timerManager.task = Task(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            timerManager.currentMinute = timerManager.task.workSeconds
            timerManager.coins = coins
        })
        .onChange(of: timerManager.coins) {
            self.coins = timerManager.coins
        }
    }
}

// MARK: - Preview
struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(timerManager: TimerManager())
    }
}

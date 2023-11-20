//
//  ContentView.swift
//  lifeProc
//
//  Created by 金刚榕树 on 2023/11/21.
//

import SwiftUI

struct EntryView: View {
    
    @AppStorage("work") private var work = 5
    @AppStorage("shortRest") private var shortRest = 2
    @AppStorage("longRest") private var longRest = 3
    @AppStorage("numOfSection") private var numOfSection = 2
    @AppStorage("itemCoins") private var itemCoins = 0
    @AppStorage("dailyCoins") private var dailyCoins = 0
    @AppStorage("coinItemName") private var coinItemName = "nil"
    
    @StateObject var timerManager: TimerManager = TimerManager()
    
    @State private var selectionIndex = 0
    
    var body: some View {
        
        NavigationView {

            VStack {
                CoinsView()
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .onAppear() {
                        itemCoins = 0
                        dailyCoins = 2000
                    }
                
                TabView(selection: $selectionIndex) {
                    TimerMainView(timerManager: timerManager)
                        .padding(.top, 5)
                        .tag(0)
                        .onAppear() {
                            coinItemName = "timer"
                        }
                    
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
                    coinItemName = "nil"
                }
            }
        }
        .onAppear() {
            timerManager.storage = TimerStorage(workSeconds: work, shortRelaxSeconds: shortRest, longRelaxSeconds: longRest, numOfSections: numOfSection)
            timerManager.currentMinute = timerManager.storage.workSeconds
            timerManager.coins = 0
        }
        .onChange(of: timerManager.coins) {
            itemCoins = timerManager.coins
            dailyCoins = 2000 - timerManager.coins
        }
    }
}

#Preview {
    EntryView(timerManager: TimerManager())
}

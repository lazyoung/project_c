//
//  ContentView.swift
//  lifeProc
//
//  Created by 金刚榕树 on 2023/11/21.
//

import SwiftUI

struct EntryView: View {
    
    @StateObject var timerManager: TimerManager = TimerManager()
    
    @State private var work: Int = 5
    @State private var shortRest: Int = 2
    @State private var longRest: Int = 3
    @State private var numOfSection: Int = 2
    @State private var itemCoins: Int = 0
    @State private var dailyCoins: Int = 2000
    @State private var coinItemName: String = "nil"
    
    var body: some View {
        
        NavigationView {

            VStack {
                CoinsView(
                    itemCoins: $itemCoins,
                    dailyCoins: $dailyCoins,
                    coinItemName: $coinItemName
                )
                .padding(.horizontal, 20)
                .padding(.top, 10)

                TabView() {
                    TimerMainView(
                        timerManager: timerManager,
                        work: $work,
                        shortRest: $shortRest,
                        longRest: $longRest,
                        numOfSection: $numOfSection
                    )
                    .padding(.top, 5)
                    .tag(0)
                    .onChange(of: timerManager.coins) {
                        itemCoins = timerManager.coins
                        dailyCoins -= timerManager.coins
                    }
                    .onAppear() {
                        coinItemName = "timer"
                    }
                    
                    TodoView()
                        .onAppear() {
                            coinItemName = "todo"
                            itemCoins = 0
                        }
                    // TODO: checklist view
                    // TODO: alarm check view
                    // TODO: personal health view
                    // TODO: diary view
                }
                .tabViewStyle(PageTabViewStyle())
                .navigationBarTitle(Text("LifeProc"))
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    EntryView(timerManager: TimerManager())
}

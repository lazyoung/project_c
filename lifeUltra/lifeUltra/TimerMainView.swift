import SwiftUI

struct TimerMainView: View {

    @ObservedObject var timerManager:TimerManager
    @Binding var work: Int
    @Binding var shortRest: Int
    @Binding var longRest:Int
    @Binding var numOfSection: Int

    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    Text("Section Completed:")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary)
                        
                    Spacer()
                    
                    Text("\(timerManager.completedSection) / \(timerManager.storage.numOfSections)")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color.primary)
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 25)
                .padding(.bottom, 5)

                TimerView(timerManager: timerManager)
                
                Spacer()
                
                VStack {
                    NavigationLink(
                        destination: TimerPickerView(num: $work, id: 0, list: [30, 60, 90]),
                        label: {
                            TimerSettingsRowView(iconName: "hammer.fill", iconColor: Color.blue, firstText: "Work", secondText: "\(work) Minutes")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                    
                    NavigationLink(
                        destination: TimerPickerView(num: $shortRest, id: 0, list: [5, 10, 15]),
                        label: {
                            TimerSettingsRowView(iconName: "die.face.3.fill", iconColor: Color.green, firstText: "Short Break", secondText: "\(shortRest) Minutes")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                    
                    NavigationLink(
                        destination: TimerPickerView(num: $longRest, id: 0, list: [20, 30, 45]),
                        label: {
                            TimerSettingsRowView(iconName: "bed.double.fill", iconColor: Color.orange, firstText: "Long Break", secondText: "\(longRest) Minutes")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                    
                    NavigationLink(
                        destination: TimerPickerView(num: $numOfSection, id: 0, list: [1, 2, 3], unit: "Sections"),
                        label: {
                            TimerSettingsRowView(iconName: "rectangle.stack", iconColor: Color.red, firstText: "Sections", secondText:"\(numOfSection)")
                                .padding(.vertical, 3)
                                .buttonStyle(PlainButtonStyle())
                        }).id(UUID())
                }
            }
        }
        .onChange(of: work) {
            timerManager.storage = TimerStorage(workMinutes: work, shortRelaxMinutes: shortRest, longRelaxMinutes: longRest, numOfSections: numOfSection)
            timerManager.resetTimer()
        }
        .onChange(of: shortRest) {
            timerManager.storage = TimerStorage(workMinutes: work, shortRelaxMinutes: shortRest, longRelaxMinutes: longRest, numOfSections: numOfSection)
            timerManager.resetTimer()
        }
        
        .onChange(of: longRest) {
            timerManager.storage = TimerStorage(workMinutes: work, shortRelaxMinutes: shortRest, longRelaxMinutes: longRest, numOfSections: numOfSection)
            timerManager.resetTimer()
        }
        .onChange(of: numOfSection) {
            timerManager.storage = TimerStorage(workMinutes: work, shortRelaxMinutes: shortRest, longRelaxMinutes: longRest, numOfSections: numOfSection)
            timerManager.resetTimer()
        }
        .onAppear() {
            timerManager.storage = TimerStorage(workMinutes: work, shortRelaxMinutes: shortRest, longRelaxMinutes: longRest, numOfSections: numOfSection)
            timerManager.currentMinute = timerManager.storage.workSeconds
            timerManager.coins = 0
        }
    }
}

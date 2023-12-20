import SwiftUI

struct TimerPickerView: View {
    
    @Binding var num: Int
    @State var id: Int
    
    let list: [Int]
    var unit: String = "Minutes"
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        Picker("Picker", selection: $id) {
            ForEach(0 ..< list.count, id:\.self) {
                Text("\(list[$0]) \(unit)")
            }
        }
        .pickerStyle(WheelPickerStyle())
        .onChange(of: id) {
            num = list[id]
        }
        .onAppear() {
            num = list[id]
        }
    }
    
}

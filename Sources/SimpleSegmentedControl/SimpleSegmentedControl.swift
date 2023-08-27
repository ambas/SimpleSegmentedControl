
import SwiftUI

public struct SimepleSegmentedControl<Value: Hashable>: View {
    
    @Binding var selected: Value
    let pairs: [Pair]
    
    public init(selected: Binding<Value>, pairs: [Pair]) {
        self._selected = selected
        self.pairs = pairs
    }
    
    public var body: some View {
        VStack {
            Picker(selection: $selected) {
                ForEach(pairs) { pair in
                    Text(pair.text).tag(pair.value)
                }
            } label: {
                Text("Alignment Segment Controll")
            }
            .pickerStyle(.segmented)
        }
    }
    
    public struct Pair: Identifiable {
        public var id: String { text }
        let text: String
        let value: Value
    }
}

public extension SimepleSegmentedControl {
    init(selected: Binding<Value>, pairs: [(String, Value)]) {
        self = .init(selected: selected, pairs: pairs.map { .init(text: $0.0, value: $0.1) })
    }
}

#Preview {
    Driver()
    
}

struct Driver: View {
    let mockValue = (0..<3).map { ("Text\($0)", "Text\($0)") }
    @State var selectedValue: String = "no selection"
    var body: some View {
        VStack {
            Text(selectedValue)
            SimepleSegmentedControl(selected: $selectedValue, pairs: mockValue)
        }
    }
}



//
//  ContentView.swift
//  ExpandableSearchBarProgressiveBlurEffect
//
//  Created by Abbas on 16/08/2024.
//
import SwiftUI
import SwiftUI

struct ContentView: View {
    
    @State private var yOffset: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                ForEach(sampleImage) { item in
                    CardView(item)
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .named("scrollView")).minY)
                            }
                        )
                }
            }
            .padding(15)
        }
        .coordinateSpace(name: "scrollView")
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            self.yOffset = value
            print("Y Offset: \(value)")
        }
    }
    
    @ViewBuilder
    func CardView(_ item: Item) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            if let image = item.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            Text("By: \(item.title)")
                .font(.callout)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.3))
        .cornerRadius(10)
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue: Value = 0
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

#Preview {
    ContentView()
}

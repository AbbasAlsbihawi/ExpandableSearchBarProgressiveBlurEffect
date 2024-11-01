//
//  Home.swift
//  ExpandableSearchBarProgressiveBlurEffect
//
//  Created by Abbas on 16/08/2024.
//

import SwiftUI
 
//struct ScrollOffsetPreferenceKey: PreferenceKey {
//    typealias Value = CGFloat
//    static var defaultValue: Value = 0
//    
//    static func reduce(value: inout Value, nextValue: () -> Value) {
//        value = nextValue()
//    }
//}
/// on Scroll Geometry Change Offset
struct Home: View {
    
    // View Properties
    @State private var progress :CGFloat = 0
    @State private var searchText :String = ""
    @FocusState private var isFocus :Bool
    @State private var yOffset: CGFloat = 0

    
    var body: some View {
        ScrollView(.vertical){
            LazyVStack(spacing: 15) {
                ForEach(sampleImage) { item in
                    CardView(item)
//                        .background(GeometryReader { geo in
//                                                   Color.clear
//                                                       .preference(key: ScrollOffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
//                                               })
                }
            }
            .padding(15)
            .offset(y: isFocus ? 0 : progress * 75)
            .padding(.bottom,15)
            .safeAreaInset(edge: .top, spacing: 0){
                ResizableHeader()
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(CustomScrollTarget())
        /// on   Scroll Geometry Change Offset  for Header Effect Scroll to hide some part of header and show some part of header floating search bar
        ///
        .animation(.snappy(duration: 0.3,extraBounce: 0),value:isFocus)
//        .visualEffect { content, geometryProxy in
//            let y = geometryProxy.frame(in: .scrollView).minY
//            let progress =  -y / 100
////            max(min(y/75,1),0) // 75 is the height of the header
//            return content
//                .opacity(1 - Double(progress))
//                .blur(radius: CGFloat(progress * 10))
//        }

// .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
//            self.yOffset = value
//            print("Y Offset: \(value)") // Print or use the offset value as needed
//        }
//        
    }
//    
    
    // custom Header
    @ViewBuilder
    func ResizableHeader() -> some View {
        let  progress = isFocus ? 1 : progress
        VStack(spacing: 0){
            HStack{
                VStack(alignment: .leading,spacing: 4){
                    Text("Welcome Back!")
                        .font(.callout)
                        .foregroundStyle(.gray)
                    Text("I abbas")
                        .font(.title.bold())
                    
                }
                Spacer(minLength: 0)
                
                Button {
                    
                }label: {
                    Image("image1")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 40,height: 40)
                        .clipShape(.circle)
                    
                    
                }
            }
            .frame(height: 60 - (60 * progress),alignment: .bottom)
            .padding(.horizontal,15)
            .padding(.top ,15)
            .padding(.bottom,15 - (15 * progress))
            .opacity(1 - progress)
            .offset(y : -10 * progress)
            
            
            
            /// floating search bar
            
            HStack(spacing: 8){
                Image (systemName: "magnifyingglass")
                
                TextField("search photo ...",text: $searchText)
                    .focused($isFocus)
                
                
                
                Button {
                    
                }label: {
                    Image(systemName: "mic.fill")
                        .foregroundStyle(.red)
                    
                }
            }
            .padding(.horizontal,12)
            .padding(.vertical,15)
            
            .background{
                RoundedRectangle(cornerRadius:isFocus ? 0 : 30)
                
                    .fill(.background
                        .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5 ,y: 5))
                        .shadow(.drop(color: .black.opacity(0.05), radius: 5, x: -5 ,y: -5))
                    )
                    .padding(.top ,isFocus ? -100 : 0)
            }
            .padding(.horizontal,isFocus ? 0 : 15)
            .padding(.bottom,10)
            .padding(.top,5)
        }
        .background{
            ProgressiveBlurView()
                .blur(radius: isFocus ? 0: 10)
                .padding(.horizontal,-16)
                .padding(.bottom,-10)
                .padding(.top,-100)
            
        }
        .visualEffect { content, geometryProxy in

//            let y = geometryProxy.frame(in: .scrollView).minY
//            self.progress = max(min(y/75,1),0) // 75 is the height of the header
//            return content
//                .opacity(1 - Double(progress))
//                .blur(radius: CGFloat(progress * 10))
            
            return content.offset(y:offsetY(geometryProxy))
            
//
        }
        
    }
    
    nonisolated private
    func offsetY(_ proxy :GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY
       
        
        return minY > 0 ? (isFocus ? -minY : 0) : -minY
    }
    
//    CardView
    @ViewBuilder
    func CardView(_ item :Item) -> some View {
        VStack(alignment: .leading,spacing: 8){
            GeometryReader {
                let size = $0.size
                
                if let image = item.image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: size.width,height: size.height)
                        .clipShape(.rect(cornerRadius: 20))
                }
            }
            .frame(height: 220)
            
            Text("By: \(item.title)")
                .font(.callout)
                .foregroundStyle(.primary.secondary)
            
        }
    }
}

struct CustomScrollTarget : ScrollTargetBehavior {
    func updateTarget(_ target: inout ScrollTarget, context: TargetContext) {
        
        let endPoint = target.rect.minY 

        if endPoint < 75 {
           if endPoint > 40 {
               target.rect.origin = .init(x: 0, y: 75)
           }else {
            target.rect.origin = .zero
           }
            
        }
    }
    
    
}

#Preview {
    ContentView()
}

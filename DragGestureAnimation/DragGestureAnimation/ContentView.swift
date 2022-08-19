//
//  ContentView.swift
//  DragGestureAnimation
//
//  Created by Nasim Ahmed on 19.08.22.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("I LOVE SWIFTUI")
    @State private var enabled = true
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack(spacing: 0){
            ForEach(0 ..< letters.count, id: \.self){ num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title2)
                    .background(enabled ? .red: .blue)
                    .animation(.default.delay(Double(num)/20), value: dragAmount)
                
            }
        }
        .offset(dragAmount)
        .gesture(
            DragGesture().onChanged({
                dragAmount = $0.translation
            })
            .onEnded({ _ in
                dragAmount = CGSize.zero
                enabled.toggle()
            })
        )
        
        
        
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .top, endPoint: .bottom)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged({  dragAmount = $0.translation})
//                    .onEnded({ _ in
//                        withAnimation(.spring()) {
//                            dragAmount = CGSize.zero
//                        }
//                    })
//            )

       
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

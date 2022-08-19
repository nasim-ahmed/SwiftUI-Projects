//
//  ContentView.swift
//  DragGestureAnimation
//
//  Created by Nasim Ahmed on 19.08.22.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .top, endPoint: .bottom)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged({  dragAmount = $0.translation})
                    .onEnded({ _ in
                        dragAmount = CGSize.zero
                    })
            )
            .animation(.spring(), value: dragAmount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

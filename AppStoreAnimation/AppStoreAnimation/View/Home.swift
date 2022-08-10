//
//  SwiftUIView.swift
//  AppStoreAnimation
//
//  Created by Nasim Ahmed on 10.08.22.
//

import SwiftUI

struct Home: View {
    //MARK: Animation Properties
    @State var currentItem: Today?
    @State var showDetailPage: Bool = false
    
    //Matched Geometry Effect
    @Namespace var animation
    
    //MARK:Detail Animation Properties
    @State var animateView: Bool = false
    @State var animateContent: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 8){
                        Text("MONDAY 4 APRIL")
                            .font(.callout)
                            .foregroundColor(.gray)
                        Text("Today")
                            .font(.largeTitle.bold())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .font(.largeTitle)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                .opacity(showDetailPage ? 0 : 1)
                
                
                ForEach(todayItems){ item in
                    Button {
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                            currentItem = item
                            showDetailPage = true
                        }
                        
                    } label: {
                        CardView(item: item)
                            .scaleEffect(currentItem?.id == item.id && showDetailPage ? 1:0.93)
                    }
                    .buttonStyle(ScaledButtonStyle())
                    .opacity(showDetailPage ? (currentItem?.id == item.id ? 1 : 0) : 1)

                }
            }
            .padding(.vertical)
        }
        .overlay {
            if let currentItem = currentItem, showDetailPage{
                DetailView(item: currentItem)
                    .ignoresSafeArea(.container, edges: .top)
            }
        }
        
        .background(alignment: .top){
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("BG"))
                .frame(height: animateView ? nil: 350, alignment: .top)
                .scaleEffect(animateView ? 1: 0.93)
                .opacity(animateView ? 1: 0)
                .ignoresSafeArea()
        }
        
    }
    
    @ViewBuilder
    func CardView(item: Today) -> some View{
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .topLeading) {
                GeometryReader { proxy in
                    let size = proxy.size
                    
                    Image(item.artWork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipShape(CustomCorner(corners: [.topLeft, .topRight], radius: 15))
                }
                .frame(height: 400)
                
                LinearGradient(colors: [
                    .black.opacity(0.5),
                    .black.opacity(0.2),
                    .clear
                ], startPoint: .top, endPoint: .bottom)
                
                VStack(alignment: .leading, spacing: 8){
                    Text(item.platformTitle.uppercased())
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text(item.bannerTitle)
                        .font(.largeTitle.bold())
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .foregroundColor(.primary)
                .offset(y: currentItem?.id == item.id && animateView ? safeArea().top: 0)
            }
            
            HStack(spacing: 12){
                Image(item.appLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                
                VStack(alignment: .leading, spacing: 4){
                    Text(item.platformTitle.uppercased())
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(item.appName)
                        .fontWeight(.bold)
                    Text(item.appDescription)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.primary)
                
                Button {
                    
                } label: {
                    Text("GET")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background(
                            Capsule().fill(.ultraThinMaterial)
                        )
                    
                }

            }
            .padding([.horizontal, .bottom])
        }
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("BG"))
        }
        .matchedGeometryEffect(id: item.id, in: animation)
    }
    
    
    //MARK: Detail View
    func DetailView(item: Today) -> some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                CardView(item: item)
                    .scaleEffect(animateView ? 1: 0.93)
                
                VStack(spacing: 15){
                    //Dummy Text
                    
                    Text(dummyText)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(10)
                        .padding(.bottom, 20)
                    Divider()
                    Button {
                        
                    } label: {
                        Label {
                            Text("Share Story")
                        } icon: {
                            Image(systemName: "square.and.arrow.up.fill")
                        }
                        .foregroundColor(.primary)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background {
                             RoundedRectangle(cornerRadius: 5, style: .continuous)
                                .fill(.ultraThinMaterial)
                        }
                    }
                }
                .padding()
                .opacity(animateContent ? 1 : 0)
                .scaleEffect(animateView ? 1 : 0, anchor: .top)
            }
        }
        
        .overlay(alignment: .topTrailing, content: {
            Button {
                //Closing View
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                    animateView = false
                    animateContent = false
                }
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)){
                    currentItem = nil
                    showDetailPage = false
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.top, safeArea().top)
            .offset(y: -10)
            .opacity(animateView ? 1 : 0)
        })
        
        .onAppear {
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                animateView = true
            }
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7).delay(0.1)) {
                animateContent = true
            }
        }
        
        .transition(.identity)
    }

}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Home().preferredColorScheme(.dark)
    }
}

struct ScaledButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.94: 1)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}

//Safe Area Value
extension View{
    func safeArea() -> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        
        return safeArea
    }
}




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

                }
            }
            .padding(.vertical)
        }
        .overlay {
            if let currentItem = currentItem, showDetailPage{
                DetailView(item: currentItem)
            }
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
                }.padding()
                    .foregroundColor(.primary)
                
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
    }
    
    
    //MARK: Detail View
    func DetailView(item: Today) -> some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                CardView(item: item)
            }
        }
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




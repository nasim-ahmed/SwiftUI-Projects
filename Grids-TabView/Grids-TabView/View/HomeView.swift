//
//  HomeView.swift
//  Grids-TabView
//
//  Created by Nasim Ahmed on 24.08.22.
//

import SwiftUI

struct HomeView: View {
    @State private var index = 0
   
    
    var body: some View {
        NavigationView{
            VStack{
                //Tab View
                HStack(spacing: 0){
                    Text("Day")
                        .foregroundColor(index == 0 ?  Color.white: Color("TabColor"))
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(index == 0 ? Color("TabBackground"): Color.white)
                        .clipShape(Capsule())
                        .onTapGesture {
                            
                            withAnimation(.default){
                                index = 0
                            }
                            
                        }
                    Spacer(minLength: 0)
                    
                    Text("Weak")
                        .foregroundColor(index == 1 ? Color.white: Color("TabColor"))
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(index == 1 ? Color("TabBackground"): Color.white)
                        .clipShape(Capsule())
                        .onTapGesture {
                            withAnimation(.default){
                                index = 1
                            }
                        }
                    Spacer(minLength: 0)
                    
                    Text("Month")
                        .foregroundColor(index == 2 ? Color.white: Color("TabColor"))
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(index == 2 ? Color("TabBackground"): Color.white)
                        .clipShape(Capsule())
                        .onTapGesture {
                            withAnimation(.default){
                                index = 2
                            }
                        }
                }
                .padding(.horizontal)
                .clipShape(Capsule())
                
                //Dashboard Grid
                TabView(selection: self.$index){
                    GridView(feeds_data: dayFeeds)
                        .tag(0)
                    GridView(feeds_data: weekFeeds)
                        .tag(1)
                    
                    VStack{
                       Text("Month Feed")
                            
                    }
                    .tag(2)
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
      
                Spacer(minLength: 0)
            }
            .navigationTitle("STATS")
            .padding(.horizontal)
            .padding(.top, 10)
            
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11")
            
    }
}

struct CardView: View{
    let feed: Feed
    
    var body: some View{
        VStack(alignment: .leading, spacing: 15){
            Text(feed.name)
                .foregroundColor(.white)
            
            Text(feed.value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 10)
            HStack{
                Spacer(minLength: 0)
                
                Text(feed.suggest)
                    .foregroundColor(.white)
            }
            
        }
        .padding()
        .background(Color(feed.image))
        .cornerRadius(20)
        
    }
}



struct GridView: View {
    var feeds_data: [Feed]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(feeds_data, id: \.self){ feed in
                CardView(feed: feed)
            }
        }
        
    }
}

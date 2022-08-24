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
                            index = 0
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
                            index = 1
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
                            index = 2
                        }
                }
                .padding(.horizontal)
                .clipShape(Capsule())
                
                //Dashboard Grid
                
                Spacer(minLength: 0)
            }
            .navigationTitle("STATS")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 12 mini")
            
    }
}

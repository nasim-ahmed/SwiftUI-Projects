//
//  Feed.swift
//  Grids-TabView
//
//  Created by Nasim Ahmed on 24.08.22.
//

import Foundation

struct Feed: Hashable,Identifiable{
    let id = UUID()
    let name:String
    let value: String
    let image: String
    let suggest: String
}


let dayFeeds = [
    Feed(name: "Heart Rate", value: "124 BPM", image: "heart", suggest: "80-120 \nHealthy"),
    Feed(name: "Sleep", value: "6h 43m", image: "moon.zzz", suggest: "Deep Sleep \n5h 13m"),
    Feed(name: "Energy Burn", value: "583 kcal", image: "flame.fill", suggest: "900 \n900kcal"),
    Feed(name: "Steps", value: "16741", image: "figure.walk", suggest: "Daily Goal \n20000 Steps"),
    Feed(name: "Running", value: "5.3 km", image: "figure.run", suggest: "Daily Goal \n10km"),
    Feed(name: "Cycling", value: "15.3 km", image: "figure.outdoor.cycle", suggest: "Daily Goal \n20km")
]

let weekFeeds = [
    Feed(name: "Heart Rate", value: "84 BPM", image: "heart", suggest: "80-120 \nHealthy"),
    Feed(name: "Sleep", value: "43h 23m", image: "moon.zzz", suggest: "Deep Sleep \n5h 13m"),
    Feed(name: "Energy Burn", value: "3500 kcal", image: "flame.fill", suggest: "Weekly Goal \n4800kcal"),
    Feed(name: "Steps", value: "17,8741", image: "figure.walk", suggest: "Weekly Goal \n25,0000 Steps"),
    Feed(name: "Running", value: "45.3 km", image: "figure.run", suggest: "Weekly Goal \n70km"),
    Feed(name: "Cycling", value: "100.3 km", image: "figure.outdoor.cycle", suggest: "Weekly Goal \n125km")
]

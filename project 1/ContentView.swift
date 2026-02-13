//
//  ContentView.swift
//  project 1
//
//  Created by ash moreira on 2/13/26.
//


import SwiftUI

struct ContentView: View {
    // variables
    @State private var currentTime: Double = 0
    @State private var duration: Double = 241
    @State private var volume: Double = 0
    @State private var play: Bool = false
    @State private var star: Bool = false
    
    // time funcition
    func formatTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%2d:%02d", minutes, seconds)
    }
    var body: some View {
        VStack {
            HStack{
                Text("12:46")
                Spacer()
                Image(systemName: "cellularbars")
                Image(systemName: "wifi")
                Image(systemName: "battery.50percent")
            }
            .padding(.horizontal)
            Image("apple")
                .resizable()
                .scaledToFit().frame(width: 380, height: 380)
                .clipShape(RoundedRectangle(cornerRadius:12))
                .padding(.vertical,35)
            HStack{
                VStack(alignment:.leading){
                    Text("Be Like A Woman")
                        .bold()
                    Text("Chris Rainbow")
                }
                .font(.title3)
                Spacer()
                Button {
                    star.toggle ()
                } label : {
                    Image(systemName: star ? "star"  :"star.fill")
                        .bold()
                        .padding(4)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
                Image(systemName:"ellipsis")
                    .padding(12)
                    .bold()
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                }
            .padding()
            Slider(value: $currentTime, in:0...duration)
                .padding(.horizontal,15)
                .sliderThumbVisibility(.hidden)
                .tint(.white)
            HStack {
                Text(formatTime(currentTime))
                Spacer()
                Text("-\(formatTime(duration-currentTime))")
            }
            .padding(.horizontal,15)
            .font(.footnote)
            HStack (spacing:40){
                Image(systemName:"backward.fill")
                    .resizable()
                    .frame(width:50, height:30)
                Button {
                    play.toggle()
                } label : {
                    Image(systemName: play ? "play.fill" : "pause.fill")
                        .resizable()
                        .frame(width:30, height:30)
                }
                Image(systemName:"forward.fill")
                    .resizable()
                    .frame(width:50, height:30)
            }
            .padding(.vertical, 20)
            HStack{
                Image(systemName:"speaker.fill")
                
                Slider(value: $volume, in:0...10)
                    .sliderThumbVisibility(.hidden)
                    .tint(.white)
                Image(systemName:"speaker.wave.3.fill")
            }
            .padding(.vertical,15)
            .padding(.horizontal,15)
            HStack(spacing:90){
                Image(systemName:"quote.bubble")
                    .resizable()
                    .frame(width:20, height:20)
                Image(systemName:"airplay.audio")
                    .resizable()
                    .frame(width:20, height:20)
                Image(systemName:"list.bullet")
                    .resizable()
                    .frame(width:20, height:15)
            }
        }
        .foregroundStyle(.white)
        .padding(.horizontal,20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red:0.28, green:0.28, blue:0.28))
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}


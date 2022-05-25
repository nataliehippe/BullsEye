//
//  ContentView.swift
//  Bullseye
//
//  Created by Natalie on 24.05.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false;
    @State private var sliderValue = 50.0;
    @State private var game  = Game();
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯\n PUT THE BULLSEYE AS CLOSE AS YOU CAN!")
                .bold()
                .kerning(2.0)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.footnote)
                
            Text(String(game.target))
                .kerning(-1)
                .font(.largeTitle)
                .fontWeight(.black)
            HStack {
                Text("1")
                    .bold()
                Slider(value: $sliderValue,in: 1.0...100.0)
                Text("100")
                    .bold()
            }
            Button(action:{
                print("Pressed Button!");
                alertIsVisible = true;
            }) {
                Text("Hit Me");
            }.alert("Hello there!", isPresented: $alertIsVisible) {
                
                Button("Awesome!") { }
              } message: {
                let roundedSliderValue  = Int(sliderValue.rounded());
                  
                Text("The slider's value is \(roundedSliderValue) \n " +
                     "You've scored \(self.game.points(sliderValue: roundedSliderValue)) in this game"
                );
              }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width:568,height:320))
    }
}

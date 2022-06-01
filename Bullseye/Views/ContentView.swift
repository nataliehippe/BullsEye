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
        
        ZStack {
            BackgroundView(game: $game)
            VStack {
                // InstuctionView
                InstructionView(game: $game).padding(.bottom,100);
                
                // HitMeButtonView
                HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game);
            }
            // SliderView
            SliderView(sliderValue: $sliderValue);
        }
    }
}

struct InstructionView : View{
    @Binding var game : Game
    
    var body: some View{
        VStack{
            InstructionText(text:"🎯🎯🎯\nput the BullsEye as close as you can to" )
                .padding(.leading,30.0)
                .padding(.trailing,30.0)
            ScoreText(text: String(game.target))
            
        }
    }
}

struct SliderView : View{
    @Binding var sliderValue : Double;
    var body: some View{
        HStack {
            SliderText(text: "1");
            Slider(value: $sliderValue,in: 1.0...100.0)
            SliderText(text: "100");
        }.padding()
    }
}

struct HitMeButtonView : View{
    @Binding var alertIsVisible: Bool;
    @Binding var sliderValue : Double;
    @Binding var game: Game;
    
    var body: some View{
        Button(action:{
            print("Pressed Button!");
            alertIsVisible = true;
        }) {
            Text("Hit Me".uppercased())
                .bold()
                .font(.title3);
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            })
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .overlay(RoundedRectangle(
            cornerRadius: 21.0
        ).strokeBorder(
            Color.white,lineWidth: 2.0))
        .alert("Hello there!", isPresented: $alertIsVisible) {
            
            Button("Awesome!") {
                let roundedSliderValue  = Int(sliderValue.rounded());
                let point = game.points(sliderValue: roundedSliderValue)
                game.startNewRound(points: point);
            }
          } message: {
            let roundedSliderValue  = Int(sliderValue.rounded());
            let point = game.points(sliderValue: roundedSliderValue)
              
            Text("The slider's value is \(roundedSliderValue) \n " +
                 "You've scored \(point) in this game"
            );
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView().previewLayout(.fixed(width:568,height:320))

        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

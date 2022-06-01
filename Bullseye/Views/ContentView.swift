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
                InstructionView(game: $game).padding(.bottom,
                                                     alertIsVisible == true ? 0 :100).transition(.scale);
                
                if alertIsVisible == true{
                    PointsView(game: $game, alertIsVisible: $alertIsVisible, sliderValue: $sliderValue).transition(.scale);
                }else{
                    // HitMeButtonView
                    HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game);
                }
            }
            if !alertIsVisible{
                // SliderView
                SliderView(sliderValue: $sliderValue).transition(.scale);
            }
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
            withAnimation{
                alertIsVisible = true;
            }
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
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .overlay(RoundedRectangle(
            cornerRadius: Constants.General.roundedRectCornerRadius
        ).strokeBorder(
            Color.white,lineWidth: Constants.General.strokeWidth))
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

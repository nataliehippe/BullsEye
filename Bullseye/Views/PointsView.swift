//
//  PointsView.swift
//  Bullseye
//
//  Created by Natalie on 01.06.22.
//

import SwiftUI

struct PointsView: View {
    @Binding var game : Game;
    @Binding var alertIsVisible: Bool;
    @Binding var sliderValue : Double;
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue);

            VStack(spacing:10) {
                InstructionText(text:"The slider's value is")
                ScoreText(text: String(roundedValue));
                BodyText(text: "You scored \(points) Points \n 🎉🎉🎉")
                Button(action:{
                    withAnimation{
                        alertIsVisible = false;
                    }
                    
                    game.startNewRound(points: points);
                }){
                    ButtonTextView(text: "Start New Round")
                };
            }.padding()
            .frame(maxWidth:300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21.0)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
    
        PointsView(game: game,alertIsVisible: alertIsVisible,sliderValue: sliderValue)
        PointsView(game: game,alertIsVisible: alertIsVisible,sliderValue: sliderValue).previewLayout(.fixed(width:568,height:320))

        PointsView(game: game,alertIsVisible: alertIsVisible,sliderValue: sliderValue)
            .preferredColorScheme(.dark)
        PointsView(game: game,alertIsVisible: alertIsVisible,sliderValue: sliderValue)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

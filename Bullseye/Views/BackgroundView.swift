//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Natalie on 27.05.22.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game : Game;
    
    var body: some View {
        VStack{
            TopView(game: $game);
            Spacer();
            BottomView(game: $game);
        }.padding()
            .background(Color("BackgroundColor"))
            .edgesIgnoringSafeArea(.all)
    }
}

struct TopView: View {
    @Binding var game : Game;
    
    var body: some View {
        HStack{
            RoundViews(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView : View{
    var title : String;
    var text : String;
    
    var body: some View{
        VStack(spacing:10){
            BottomLaybleText(text: title)
                .padding(2)
            RoundedRectangleView(text: text)
        }
    }
}

struct BottomView : View{
    @Binding var game : Game;
    
    var body: some View{
        HStack {
            NumberView(title: "Score".uppercased(), text: String(game.score))
            Spacer()
            NumberView(title: "Round".uppercased(), text: String(game.round))
        }
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}

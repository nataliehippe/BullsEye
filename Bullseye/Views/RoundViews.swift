//
//  RoundViews.swift
//  Bullseye
//
//  Created by Natalie on 27.05.22.
//

import SwiftUI

struct RoundViews: View {
    var systemName : String;
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .overlay(
                (Circle(                ).strokeBorder(
                    Color("ButtonStrokeColor"),lineWidth: Constants.General.strokeWidth))
            )
    }
}

struct RoundedImageViewFilled: View{
    var systemName : String;
    var body: some View{
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .background(
                Circle().fill(Color("ButtonsFilledBackgroundColor"))
            )
        
    }
}

struct RoundedRectangleView : View{
    var text : String
    var body: some View{
        Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width:
                    Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .stroke(lineWidth: Constants.General.strokeWidth)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct PreviewView : View{
    var body: some View{
        VStack() {
            RoundViews(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectangleView(text: "999")
            RounedTextView(text: 1111)
        }
        
    }
}

struct RounedTextView : View{
    var text : Int
    var body: some View{
        Text(String(text))
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .overlay(
                Circle()
                    .strokeBorder(
                        Color("LeaderboardRowColor"),lineWidth: Constants.General.strokeWidth)
            )
        
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView().preferredColorScheme(.dark)
    }
}

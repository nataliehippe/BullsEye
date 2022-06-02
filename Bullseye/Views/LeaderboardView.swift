//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Natalie on 01.06.22.
//

import SwiftUI

struct LeaderboardView :  View{
    @Binding var leaderboardIsShowing : Bool
    
    var body: some View{
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing:10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                RowView(index: 1, score: 20, date: Date())
            }
        };
    }
}

struct RowView : View{
    let index : Int;
    let score : Int;
    let date : Date;
    
    var body: some View{
        HStack{
            RounedTextView(text: index)
            Spacer()
            LeaderboardScoreText(score:score ).frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }.background(
            RoundedRectangle(cornerRadius: .infinity).strokeBorder(
                Color("LeaderboardRowColor"),
                lineWidth: Constants.General.strokeWidth
            ))
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView : View{
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing : Bool
    
    var body: some View{
        ZStack{
            HStack {
                
                if verticalSizeClass == .regular && horizontalSizeClass == .compact{
                    
                    LeaderboardText(text: "Leaderboard").padding(.leading)
                    Spacer()
                }else{
                    LeaderboardText(text: "Leaderboard")
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    leaderboardIsShowing = false
                }){
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
            }
        }
    }
}

struct LabelView : View{
    var body: some View{
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            InstructionText(text: "Score")
                .frame(width:Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            InstructionText(text: "Date")
                .frame(width:Constants.Leaderboard.leaderboardDateColWidth)
        } .padding(.leading)
            .padding(.trailing)
            .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews:
    PreviewProvider {
    
    static private var leaderboardIsShowing = Binding.constant(false)

    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing).previewLayout(.fixed(width:568,height:320))
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing)
            .preferredColorScheme(.dark)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Natalie on 01.06.22.
//

import SwiftUI

struct LeaderboardView :  View{
    var body: some View{
        RowView(index: 1, score: 20, date: Date());
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

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
        LeaderboardView()
            .preferredColorScheme(.dark)
    }
}

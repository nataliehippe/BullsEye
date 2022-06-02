//
//  TextView.swift
//  Bullseye
//
//  Created by Natalie on 27.05.22.
//

import Foundation
import SwiftUI

struct InstructionText : View{
    var text : String;
    
    var body : some View{
        Text(text.uppercased())
            .bold()
            .kerning(Constants.General.strokeWidth)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct ScoreText : View{
    
    var text : String;
    
    var body: some View{
        Text(text)
            .kerning(-1)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))

    }
}

struct SliderText : View{
    var text : String;
    
    var body: some View{
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct BottomLaybleText : View{
    var text : String;
    var body: some View{
        Text(text)
            .bold()
            .font(.caption)
            .kerning(1.5)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText : View{
    var text : String;
    var body: some View{
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonTextView : View{
    var text : String;
    var body: some View{
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth:.infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12)
        
    }
}

struct LeaderboardScoreText : View{
    var score : Int
    
    var body: some View{
        Text(String(score))
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct DateText : View{
    var date : Date
    var body: some View{
        Text(date , style: .time)
            .bold()
            .font(.title3)
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
    }
}

struct LeaderboardText : View{
    var text: String
    var body: some View{
        Text(text.uppercased())
            .kerning(2.0)
            .fontWeight(.black)
            .font(.title)
    }
}


struct TextView_Previews : PreviewProvider{
    
    static var previews: some View{
        VStack (spacing:10){
            InstructionText(text:"Instruction")
            ScoreText(text: "111")
            SliderText(text: "1")
            BottomLaybleText(text: "999")
            BodyText(text: "You scored 100 Points \n 🎉🎉🎉")
            ButtonTextView(text: "Start New Round")
            DateText(date: Date())
            LeaderboardScoreText(score: 9999)
            LeaderboardText(text: "Leaderboard")
        }.padding()
    }
}

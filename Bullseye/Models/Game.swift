//
//  Game.swift
//  Bullseye
//
//  Created by Natalie on 25.05.22.
//

import Foundation

struct LeaderboardEntry{
    let score : Int
    let date : Date
}

struct Game{
    var target = Int.random(in: 1...100);
    var score = 0;
    var round = 1;
    var leaderboardEntries : [LeaderboardEntry] = []
    
    func points(sliderValue: Int)-> Int{
        let difference = abs(sliderValue - target);
        let bonus: Int;
        
        if difference == 0{
            bonus = 100;
        } else if difference <= 2{
            bonus = 50;
        } else{
            bonus = 0;
        }
        
        return 100 - difference + bonus;
    }
    
    mutating func addToLeaderBoard(point: Int)-> Void{
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort{$0.score > $1.score}
    }
    
    mutating func startNewRound(points: Int) -> Void{
        score += points;
        round += 1;
        target = Int.random(in: 1...100);
        
        addToLeaderBoard(point: score)
    }
    
    mutating func restart() -> Void{
        score = 0;
        round = 1;
        target = Int.random(in: 1...100);
    }
}

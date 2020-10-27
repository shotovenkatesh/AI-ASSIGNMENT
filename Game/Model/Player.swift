//
//  Player.swift
//  Game
//
//  Created by Venkatesh on 27/10/20.
//

import GameplayKit

class Player: NSObject, GKGameModelPlayer {
  
  enum Value: Int {
    case empty
    case brain
    case zombie
    
    var name: String {
      switch self {
      case .empty:
        return ""
        
      case .brain:
        return "Brain"
        
      case .zombie:
        return "Zombie"
      }
    }
  }
  
  var value: Value
  var name: String
  var playerId: Int

  static var allPlayers = [
    Player(.brain),
    Player(.zombie)
  ]
  
  var opponent: Player {
    if value == .zombie {
      return Player.allPlayers[0]
    } else {
      return Player.allPlayers[1]
    }
  }
  
  init(_ value: Value) {
    self.value = value
    name = value.name
    playerId = value.rawValue
  }
  
}

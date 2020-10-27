//
//  Strategist.swift
//  Game
//
//  Created by Venkatesh on 27/10/20.
//

import GameplayKit

struct Strategist {
  
  // 1
  private let strategist: GKMinmaxStrategist = {
    let strategist = GKMinmaxStrategist()
    
    strategist.maxLookAheadDepth = 5
    strategist.randomSource = GKARC4RandomSource()
    
    return strategist
  }()
  
  // 2
  var board: Board {
    didSet {
      strategist.gameModel = board
    }
  }
  
  // 3
  var bestCoordinate: CGPoint? {
    if let move = strategist.bestMove(for: board.currentPlayer) as? Move {
      return move.coordinate
    }
    
    return nil
  }
  
}


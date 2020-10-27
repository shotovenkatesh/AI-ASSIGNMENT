//
//  GameViewController.swift
//  Game
//
//  Created by Venkatesh on 27/10/20.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let view = self.view as? SKView {
      let scene = GameScene(size: UIScreen.main.bounds.size)
      scene.scaleMode = .aspectFill
      
      view.presentScene(scene)
    }
  }
  
  override var shouldAutorotate: Bool {
    return true
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
}

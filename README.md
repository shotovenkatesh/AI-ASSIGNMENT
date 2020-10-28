# AI-ASSIGNMENT

#Zombies vs Brains( Tic Tac Toe) game using GKMinMaxStrategist Protocol


# working on xcode 12.0
# INTRO

This game is built using swift programming language and with the help of a framework called spritekit. Since this is an AI based assignment, I wont be covering basic game layout and game related details. This project is organized into 3 foldres:

Model: Where gameplay kit was added to get up AI running. https://developer.apple.com/documentation/gameplaykit
Game: Contains spritekit files.
Supporting Files: Contains Standard files and assets for an ios app.

# EXPLANATION OF GKStrategist
I adopted a protocol called GKStrategist which provides AI for turn based games. https://developer.apple.com/documentation/gameplaykit/gkstrategist

Gameplaykit provides 2 specific strategist classes based on the GKStrategist protocol.
GKMinmaxStrategist:An AI that chooses moves in turn-based games using a deterministic strategy.
GKMonteCarloStrategist:An AI that chooses moves in turn-based games using a probabilistic strategy.

For this assignment i used GKMinMaxStrategist.

For the strategist to work, it has to know the structure of the game. That is where game model come into play.

# EXPLANATION OF GAME MODEL
The game model is a representation of the gameplay that GameplayKit can understand. GameplayKit uses game model to do the following:
Analyze the game state by asking the model for the available moves for a given player.
Test future moves by using copies of game state to test the results of hypothetical moves.
Rate each move to determine the optimal one.

# EXPLANATION OF PLAYER.SWIFT
The model keeps track of all the players in the game. To GameplayKit, a player is simply a class that conforms to the GKGameModelPlayer protocol. This protocol requires the player class to have a unique playerId property so that the model can distinguish between players.

# EXPLANATION OF MOVE.SWIFT
A move is simply a class that implements the GKGameModelUpdate protocol. According to this protocol, this class must contain a value property so it can assign the move based on its calculation.

Since this is TicTacToe, my model only consists of a 3×3 board and 2 players: the brain and the zombie. The move class will keep track of the position of the player. I have made the AI only smart enough to determine if the next move will win the game.So this AI is beatable.

# Whats happening in player and move.swift
The Player.swift from the Model folder has confirmed to the GKGameModelPlayer protocol by giving it a playerid.

In move.swift I first declare conformance to the GKGameModelUpdate protocol. I used Score enum to define the score of a move based on whether it results in a win. Then i provided a value property to help GameplayKit rate a move. Finally, the coordinate property is a CGPoint that contains the location on the board.( A cg point is a structure that contains a point in a two-dimensional coordinate system.)

# EXPLANATION OF BOARD.SWIFT
Now in Board.swift I put these pieces together in a model class. GKGameModel requires conformance to NSCopying(A protocol that objects adopt to provide functional copies of themselves.) because the strategist evaluates moves against copies of the game. The players property stores a list of all the players in the match and 
the activePlayer property keeps track of the player in turn.
Function setGameModel(_:) lets GameplayKit update the game model with the new state after it makes a decision. 
Function iswin() determines whether a player wins the game via winningPlayer. This result was later used to compare it to the player that was passed onto this method.
Function gameModelUpdates(for:) tells GameplayKit about all the possible moves in the current state of the game.
It loop over all of the board’s positions and add a position to the possible moves if it is not already occupied.
GameplayKit calls func apply(_:) after each move selected by the strategist so that there is a chance to update the game state. After a player makes a move, it is now the opponent’s turn.
The AI uses function score(for:) to calculate it’s best move. 
When GameplayKit creates its move tree, it will select the shortest path to a winning outcome.
The GameModel is now done.

# Setting Up the Strategist
This is where I used the model to drive the strategist.

# Explanation of what is happening in strategist.swift

I instantiated a GKMinmaxStrategist with a maxLookAheadDepth of 5. The look ahead depth is the constraint that i  gave a strategist to limit the number of future moves it can simulate. 
I kept a reference to the game model to define and supply to the strategist.
The best coordinate is a CGPoint representing the strategist’s best move. 
The bestMove(for:) method will return nil if the player is in an invalid state or nonexistent.

# Gamescene.swift Explanation
Now in the GameScene.swift file i've added a property to keep a reference to the strategist used by the game.( var strategist: Strategist!)
In the func didMoveto() I've initialized the strategist with the model driving the game.

# Touches Section
# Explanatiom of func ProcessAIMove()
In this function I have done the following:

Created a dispatch queue to process the AI’s move since it could take a while.
Record the starting time before the strategist decides on the best move.
Calculate the time it took for the strategist to make its decision.
Create a delay based on a constant so the AI will appear to take a bit of time to make a decision.
Finally,updated the board on the main queue to reflect the new move.


# THANK YOU

$LOAD_PATH << "."

require "tictactoe"
require "player"
require "Board"

  class Player
      attr_reader :name, :mark
    
      def initialize(name, mark)
        @name,  @mark = name, mark
      end
    end
    
  
    game = TicTacToe.new
  
    game.add_player("Chris")
    game.add_player("Bob")
  
    game.start
   
  
  
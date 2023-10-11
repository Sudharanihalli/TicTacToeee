require "Board"
require "player"

class TicTacToe
    attr_reader :players, :board, :current_player
  
      def initialize
        @board =Board.new
        @players = []
      end
        
      def start
          if players.length != 2
             raise StandardError, "Two players are required to play TicTacToe"
          end
      
          @current_player = players.first   
  
         render
         
          until (win? ||  draw?) do
            get_input
            board.render
            switch_player
        end

        if(winner = win?)
          puts "Congratulations, #{winner.name}! you won!"
        else
          puts "It was a draw"
      end
    end

    def render
      board.render
    end
  
    def win?
      board.win?
    end

    def draw?
      board.draw
    end

      def switch_player
        @current_player = (@current_player == players.first) ? players.last : players.first
      end
            
      def get_input
        loop do
         puts "#{current_player.name},where would you like to go? [1-9]"
         location = gets.chomp.to_i

         if board.available?[location] 
         board.set(location ,current_player)
         break
         else
            puts "That spot is already taken"
      end
    end
end

      def draw?
          board.none?(nil)&& !win?
      end
  
      def add_player(name=nil)
        mark = players.empty? ? "X" : "O"
  
           if name == nil
            puts "What is your name?"
            name = gets.chomp
          end
  
        players << Player.new(name, mark)
      end
    end
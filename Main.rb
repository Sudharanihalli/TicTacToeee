class TicTacToe
    attr_reader :players, :board, :current_player
  
      def initialize
        @board = [
          nil, nil, nil,
          nil, nil, nil,
          nil, nil, nil,
        ]
        @players = []
      end
    
      def start
          if players.length != 2
             raise StandardError, "Two players are required to play TicTacToe"
          end
      
          @current_player = players.first   
  
            render
          until (win? || draw?) do
            get_input
            render
            switch_player
        end

        if(winner=win?)
          puts "Congratulations, #{winner.name}! you won!"
        else
          puts "It was a draw"
      end

      
  
      def switch_player
        @current_player = (@current_player == players.first) ? players.last : players.first
      end
            
      def get_input
        loop do
         puts "#{current_player.name},where would you like to go? [1-9]"
         location = gets.chomp.to_i

         if board[location -1] == nil
         board[location - 1] = current_player
         break
         else
            puts "That spot is already taken"
      end
    end
end
  
  
      def render
        puts
          puts "#{board[0]&.mark || " "} | #{board[1]&.mark || " "} | #{board[2]&.mark || " "}"
          puts "--------"
          puts "#{board[3]&.mark || " "} | #{board[4]&.mark || " "} | #{board[5]&.mark || " "}"
          puts "--------"
          puts "#{board[6]&.mark || " "} | #{board[7]&.mark || " "} | #{board[8]&.mark || " "}"
        puts
      end

      def win?
        board.each_slice(3) do |row|
          p row
        end

        #Horizontals
        row = [board[0], board[1], board[2]].compact
        return row.first if row.length == 3 && row.all?{ |r| r== row.first}

        row = [board[3], board[4], board[5]].compact
        return row.first if row.length == 3 && row.all?{ |r| r== row.first}

        row = [board[6], board[7], board[8]].compact
        return row.first if row.length == 3 && row.all?{ |r| r== row.first}

        #Horizantals
        row = [board[0], board[3], board[6]].compact
        return row.first if row.length == 3 && row.all?{ |r| r== row.first}

        row = [board[1], board[4], board[7]].compact
        return row.first if row.length == 3 && row.all?{ |r| r== row.first}

        row = [board[2], board[5], board[8]].compact
        return row.first if row.length == 3 && row.all?{ |r| r== row.first}

        #Horizontals
        row = [board[0], board[1], board[2]].compact
        return row.first if row.length == 3 && row.all?{ |r| r== row.first}

        row = [board[0], board[1], board[2]].compact
        return row.first if row.length == 3 && row.all?{ |r| r== row.first}
        
        false

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
   
  
  
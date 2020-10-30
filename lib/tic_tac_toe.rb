class TicTacToe
    attr_accessor :board 
   def initialize 
    @board = Array.new(9, " ")
   end 

   WIN_COMBINATIONS = [
       [0,1,2],
       [3,4,5],
       [6,7,8],
       [0,3,6],
       [1,4,7],
       [2,5,8],
       [0,4,8],
       [6,4,2]
   ]
   def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def input_to_index(string)
    index = string.to_i - 1
   end 

   def move(index, player_token = X)
    @board[index] = player_token
   end 

   def position_taken?(index)
    @board[index] != " "
   end 

   def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
   end 

   def turn_count
    @board.count {|s| s == "X" || s == "O"}
   end 

   def current_player
    turn_count.even? ? "X" : "O"
   end 

   def turn
    index = input_to_index(gets.chomp)
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end 

   end 

   def won?
    WIN_COMBINATIONS.each do |win|
        index_1 = win[0]
        index_2 = win[1]
        index_3 = win[2]
        pos_1 = board[index_1]
        pos_2 = board[index_2]
        pos_3 = board[index_3]
        if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
          return win
        elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
          return win
            end
        end 
    return false 
    end 
    def full?
        @board.none?{|p| p == " " || p == ""}
    end 

    def draw?
        !(won?) && (full?)
    end 
    def over?
        won? || full? || draw?
    end
    def winner 
        WIN_COMBINATIONS.detect do |win_combo|
            if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
              return "X"
            elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
              return "O"
            else
              nil
            
          end
        end
    end

    def play 
        while over? == false
            turn
          end
          if won?
            puts "Congratulations #{winner}!"
          elsif draw?
            puts "Cat's Game!"
          end
    end
end 
 



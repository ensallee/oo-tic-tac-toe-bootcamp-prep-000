class TicTacToe
  def initialize(board=nil)
    @board=board || Array.new(9, " ")
  end

  WIN_COMBINATIONS= [
 [0, 1, 2],
 [3, 4, 5],
 [6, 7, 8],
 [0, 3, 6],
 [1, 4, 7],
 [2, 5, 8],
 [0, 4, 8],
 [2, 4, 6]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, character="X")
  @board[index]=character
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(@board, index)
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if current_player(@board) == "X"
    character = "X"
  elsif current_player(@board) == "O"
    character = "O"
  end
  if valid_move?(index)
    move(index, character)
    display_board
  else
    turn
  end
end

def turn_count
  counter=0
  @board.each do |turn|
    if turn != " " && turn != ""
      counter += 1
    end
  end
  return counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

end

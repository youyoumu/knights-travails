require "./lib/board.rb"
require "./lib/square.rb"

board = Board.new
board.knight_moves([0, 0], [7, 7])
puts ""
board.knight_moves([7, 7], [0, 7])
puts ""
board.knight_moves([3, 3], [4, 3])

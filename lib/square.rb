class Square
  attr_accessor :coordinate, :knight_possible_move, :surrounding_coordinate, :surrounding_corner_coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @knight_possible_move = get_knight_possible_move(coordinate)
    @surrounding_coordinate = get_surrounding_coordinate(coordinate)
    @surrounding_corner_coordinate = get_surrounding_corner_coordinate(coordinate)
  end

  def get_surrounding_coordinate(coordinate)
    surrounding_coordinate = []
    surrounding_coordinate.push([coordinate[0] + 1, coordinate[1]])
    surrounding_coordinate.push([coordinate[0] - 1, coordinate[1]])
    surrounding_coordinate.push([coordinate[0] + 1, coordinate[1] + 1])
    surrounding_coordinate.push([coordinate[0] - 1, coordinate[1] - 1])
    surrounding_coordinate.push([coordinate[0], coordinate[1] + 1])
    surrounding_coordinate.push([coordinate[0], coordinate[1] - 1])
    surrounding_coordinate.push([coordinate[0] - 1, coordinate[1] + 1])
    surrounding_coordinate.push([coordinate[0] + 1, coordinate[1] - 1])
    filter_coordinate(surrounding_coordinate)
  end

  def get_surrounding_corner_coordinate(coordinate)
    surrounding_corner_coordinate = []
    surrounding_corner_coordinate.push([coordinate[0] + 2, coordinate[1] + 2])
    surrounding_corner_coordinate.push([coordinate[0] + 2, coordinate[1] - 2])
    surrounding_corner_coordinate.push([coordinate[0] - 2, coordinate[1] - 2])
    surrounding_corner_coordinate.push([coordinate[0] - 2, coordinate[1] + 2])
    filter_coordinate(surrounding_corner_coordinate)
  end

  def get_knight_possible_move(coordinate)
    knight_possible_move = []
    knight_possible_move.push([coordinate[0] + 2, coordinate[1] + 1])
    knight_possible_move.push([coordinate[0] + 2, coordinate[1] - 1])
    knight_possible_move.push([coordinate[0] + 1, coordinate[1] + 2])
    knight_possible_move.push([coordinate[0] + 1, coordinate[1] - 2])
    knight_possible_move.push([coordinate[0] - 1, coordinate[1] + 2])
    knight_possible_move.push([coordinate[0] - 1, coordinate[1] - 2])
    knight_possible_move.push([coordinate[0] - 2, coordinate[1] + 1])
    knight_possible_move.push([coordinate[0] - 2, coordinate[1] - 1])
    filter_coordinate(knight_possible_move)
  end

  def filter_coordinate(coordinate_array)
    coordinate_array.reject do |coordinate|
      coordinate[0] < 0 || coordinate[0] > 7 || coordinate[1] < 0 || coordinate[1] > 7
    end
  end
end

class Board
  def knight_moves(start_coordinate, target_coornidate)
    target_coornidate_obj = Square.new(target_coornidate)
    surrounding_coordinate = target_coornidate_obj.surrounding_coordinate
    surrounding_corner_coordinate = target_coornidate_obj.surrounding_corner_coordinate
    step = knight_moves_recursive(start_coordinate, target_coornidate, [], 0, surrounding_coordinate, surrounding_corner_coordinate)
    puts "Start: #{start_coordinate}, Target: #{target_coornidate}"
    puts "You made it in #{step.length - 1} moves! Here's your path:"
    p step
  end

  def knight_moves_recursive(start_coordinate, target_coornidate, step, counter, surrounding_coordinate, surrounding_corner_coordinate)
    return if counter == 10

    step.push(start_coordinate)
    start_coordinate = Square.new(start_coordinate)
    return step.push(target_coornidate) if start_coordinate.knight_possible_move.include?(target_coornidate)

    next_step = start_coordinate.knight_possible_move.reduce(start_coordinate.coordinate) do |best_coordinate, coordinate|
      best_coordinate_distance = get_coordinate_distance(best_coordinate, target_coornidate)
      current_coordinate_distance = get_coordinate_distance(coordinate, target_coornidate)
      best_coordinate = coordinate if (
        current_coordinate_distance < best_coordinate_distance &&
        !surrounding_coordinate.include?(coordinate) &&
        !surrounding_corner_coordinate.include?(coordinate)
      )
      if best_coordinate == start_coordinate.coordinate
        best_coordinate = coordinate if (
          !surrounding_coordinate.include?(coordinate) &&
          !surrounding_corner_coordinate.include?(coordinate)
        )
      end
      best_coordinate
    end
    knight_moves_recursive(next_step, target_coornidate, step, counter + 1, surrounding_coordinate, surrounding_corner_coordinate)
  end

  def get_coordinate_distance(start_coordinate, target_coornidate)
    a = target_coornidate[0] - start_coordinate[0]
    b = target_coornidate[1] - start_coordinate[1]
    Math.sqrt(a**2 + b**2)
  end
end

class Workbench
  def initialize(circuit_boards)
    @circuit_boards = circuit_boards
  end

  def bad_cards
    j_board = @circuit_boards.last

    results = []
    @circuit_boards.each_slice(3) do |boards|
      results << Board::Tester.test(boards) if boards.count == 3
    end

    false_indexes = []
    results.flatten.each_with_index{ |result, index| false_indexes << index if result == false }
    x_y_z_boards = []
    @circuit_boards.each_with_index{|board, index| x_y_z_boards << board if false_indexes.include?(index) }

    q_board = x_y_z_boards[Board::Tester.test(x_y_z_boards).find_index(false)]

    a_b_j_boards = @circuit_boards.take(2) + [j_board]
    r_board = a_b_j_boards[Board::Tester.test(a_b_j_boards).find_index(false)]

    r_y_z_boards = [r_board] + x_y_z_boards.last(2)
    w_board = r_y_z_boards[Board::Tester.test(r_y_z_boards).find_index(false)]

    [q_board, w_board]
  end
end

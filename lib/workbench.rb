class Workbench
  def initialize(circuit_boards)
    @circuit_boards = circuit_boards
  end

  def bad_cards
    j_board = @circuit_boards.last

    x_y_z_results = []
    @circuit_boards.each_slice(3) do |boards|
      x_y_z_results << Board::Tester.test(boards) if boards.count == 3
    end

    false_indexes = []
    x_y_z_results.flatten.each_with_index{ |result, index| false_indexes << index if result == false }
    x_y_z_boards = []
    @circuit_boards.each_with_index{|board, index| x_y_z_boards << board if false_indexes.include?(index) }

    # faulty
    q_board = test_and_return_faulty_board x_y_z_boards

    a_b_j_boards = @circuit_boards.take(2) + [j_board]
    # maybe faulty
    r_board = test_and_return_faulty_board a_b_j_boards

    r_y_z_boards = [r_board] + x_y_z_boards.last(2)
    w_board = test_and_return_faulty_board r_y_z_boards

    [q_board, r_board, w_board]
  end

  private

  def test_and_return_faulty_board boards
    boards[Board::Tester.test(boards).find_index(false)]
  end
end

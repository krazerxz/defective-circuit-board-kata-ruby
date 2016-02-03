class Workbench
  def initialize(circuit_boards)
    @circuit_boards = circuit_boards
  end

  def bad_cards
    boards = Board::Helper.new(@circuit_boards)

    x_board = test_and_return_faulty_board [boards.a_board, boards.b_board, boards.c_board]
    y_board = test_and_return_faulty_board [boards.d_board, boards.e_board, boards.f_board]
    z_board = test_and_return_faulty_board [boards.g_board, boards.h_board, boards.i_board]

    # faulty
    q_board = test_and_return_faulty_board [x_board, y_board, z_board]

    # maybe faulty
    r_board = test_and_return_faulty_board [boards.a_board, boards.b_board, boards.j_board]

    w_board = test_and_return_faulty_board [r_board, y_board, z_board]

    [q_board, w_board]
  end

  private

  def test_and_return_faulty_board boards
    boards[Board::Tester.test(boards).find_index(false)]
  end
end

class Board::Helper
  def initialize all_boards
    @boards = all_boards
    define_methods
  end

  def define_methods
    board_names = %w(a b c d e f g h i j)
    @boards.each_with_index do |board, index|
      define_singleton_method("#{board_names[index]}_board") do
        @boards[index]
      end
    end
  end
end

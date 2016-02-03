class Workbench
  def initialize(circuit_boards)
    @circuit_boards = circuit_boards
  end

  def bad_cards
    boards = Board::Helper.new(@circuit_boards)

    a_b_c_boards = [boards.a_board, boards.b_board, boards.c_board] # Test 1
    d_e_f_boards = [boards.d_board, boards.e_board, boards.f_board] # Test 2
    g_h_i_boards = [boards.g_board, boards.h_board, boards.i_board] # Test 3

    x_board = test_and_return_faulty_board a_b_c_boards
    y_board = test_and_return_faulty_board d_e_f_boards
    z_board = test_and_return_faulty_board g_h_i_boards

    # faulty
    q_board = test_and_return_faulty_board [x_board, y_board, z_board] # Test 4

    set_to_test = []

    # Find which set the initial faulty board game from
    [a_b_c_boards, d_e_f_boards, g_h_i_boards].each do |board_set|
      set_to_test = board_set if board_set.include? q_board
    end.flatten

    # q is definitely faulty, we can now disregard this and build out next test, less the one we discovered
    set_to_test = set_to_test - [q_board] + [boards.j_board]

    # maybe faulty
    r_board = test_and_return_faulty_board set_to_test # test 5

    set_to_test = []
    [a_b_c_boards, d_e_f_boards, g_h_i_boards].each do |board_set|
      set_to_test = board_set if board_set.include? r_board
    end

    final_test = [r_board, x_board, y_board] if set_to_test == g_h_i_boards
    final_test = [r_board, x_board, z_board] if set_to_test == d_e_f_boards
    final_test = [r_board, y_board, z_board] if set_to_test == a_b_c_boards

    w_board = test_and_return_faulty_board final_test # Test 6

    [q_board, w_board]
  end

  private

  def test_and_return_faulty_board(boards)
    boards[Board::Tester.test(boards).find_index(false)]
  end
end

class Board
  class Helper
    def initialize(all_boards)
      @boards = all_boards
      define_methods
    end

    def define_methods
      board_names = %w(a b c d e f g h i j)
      @boards.each_with_index do |_board, index|
        define_singleton_method("#{board_names[index]}_board") do
          @boards[index]
        end
      end
    end
  end
end

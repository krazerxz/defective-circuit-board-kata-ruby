class BoardTester
  def test(array_of_boards)
    boards = BoardSet.new(array_of_boards)

    return boards.correct_identification_of_all_boards             if boards.defective_boards == 1
    return boards.correctly_identify_one_faulty_board              if boards.defective_boards == 2
    return boards.incorrectly_identify_one_working_board_as_faulty if boards.defective_boards == 0
  end
end

class BoardSet
  def initialize(boards)
    @boards = boards
  end

  def correct_identification_of_all_boards
    @boards.map(&:working?)
  end

  def defective_boards
    @boards.count { |board| !board.working? }
  end

  def correctly_identify_one_faulty_board
    value = [true, false].shuffle
    new_array = []
    @boards.each do |board|
      new_array << value.pop unless board.working?
      new_array << true if board.working?
    end
    new_array
  end

  def incorrectly_identify_one_working_board_as_faulty
    [true, true, false].shuffle
  end
end

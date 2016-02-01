class BoardTester
  def test(array_of_boards)
    boards = BoardSet.new(array_of_boards)

    return boards.correct_identification_of_all_boards             if boards.defective_boards == 1
    return boards.correctly_identify_one_faulty_board              if boards.defective_boards == 2
    return boards.incorrectly_identify_one_working_board_as_faulty if boards.defective_boards == 0
  end
end


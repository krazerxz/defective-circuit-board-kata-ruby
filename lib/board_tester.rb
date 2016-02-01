class BoardTester
  def faulty_board?(boards)
    !boards.select{ |board| board.faulty? }.empty?
  end
end

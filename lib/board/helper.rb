module Board
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

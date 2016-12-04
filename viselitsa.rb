require 'unicode_utils'

current_path = "./" + File.dirname(__FILE__)

require current_path + "/game.rb"
require current_path + "/result_printer.rb"
require current_path + "/word_reader.rb"

printer = ResultPrinter.new
word_reader = WordReader.new

words_file_name = current_path + "/data/words.txt"

game = Game.new(word_reader.read_from_file(words_file_name))

while game.status == 0 do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)

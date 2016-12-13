require 'unicode_utils'

current_path = "./" + File.dirname(__FILE__)

require current_path + "/lib/game.rb"
require current_path + "/lib/result_printer.rb"
require current_path + "/lib/word_reader.rb"

word_reader = WordReader.new

if (ARGV[0] == '' || ARGV[0] == nil )
  words_file_name = "#{File.dirname(__FILE__)}/data/words.txt"
  word = word_reader.read_from_file(words_file_name)
else
  word = word_reader.read_from_args
end


game = Game.new(word)

printer = ResultPrinter.new(game)

while game.in_progress? do
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)

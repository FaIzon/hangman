class WordReader

  def read_from_args
    ARGV[0]
  end

  def read_from_file(file_name)
    begin
      File.readlines(file_name).sample.chomp
    rescue
      abort("Проверьте правильность имени файла #{file_name}")
    end
  end
end
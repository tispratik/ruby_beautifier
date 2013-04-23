require "ruby_beautifier/version"

module RubyBeautifier
  def self.run
    files = Dir["**/*.rb"]

    files.each do |file|
      text = File.read(file)

      # Add space before hash rocket (Make sure to skip <=> cases)
      # text.gsub!(/(?<! )(?<!\<)=>/, ' =>')
      # text.gsub!(/(?<!( |\<))=>/, ' =>')
      text.gsub!(/(?<![ \<])=>/, ' =>')

      # Add space after hash rocket
      text.gsub!(/=>(?! )/, '=> ')

      # Add space after comma, following cases have been tested
      # [a,b,c,d] => [a, b, c, d]
      # [a, b, c,d] => [a, b, c, d]
      # (a,b,c,d) => (a, b, c, d)
      # (a, b, c, d) => no change
      # a.join(',') => no change
      # a.join(/,/) => no change
      # a.join(",") => no change
      # ["a","b", "c","d","e", "f"] => ["a", "b", "c", "d", "e", "f"]
      # ["a","b", "c","d","e", "f"], => ["a", "b", "c", "d", "e", "f"],
      # text.gsub!(/(,(?! ))(?!'\))(?!"\))(?!\/\))(?!\n)/, ', ')
      text.gsub!(/,(?!( |'\)|"\)|\/\)|\n))/, ', ')

      # add a blank new line between methods
      text.gsub!(/end(\n)def/, '\n\n')

      File.open(file, "w") { |file| file.puts text }
    end
  end
end

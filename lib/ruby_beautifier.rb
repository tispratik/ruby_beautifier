require 'ruby_beautifier/version'
require 'ruby_beautifier/regex_definitions'

module RubyBeautifier
  def self.files
    Dir["**/*.rb"]
  end

  def self.run
    files.each do |file|
      text = File.read(file)

      REGEX.keys.each do |regex|
        self.send regex, text
      end

      File.open(file, "w") { |file| file.puts text }
    end
  end

  REGEX.keys.each do |key|
    define_singleton_method key do |text|
      text.gsub!(REGEX[key][:search], REGEX[key][:replace])
    end
  end
end

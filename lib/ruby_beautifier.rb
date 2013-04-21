require "ruby_beautifier/version"

module RubyBeautifier
  def self.run
    files = Dir["**/*.rb"]

    files.each do |file|
      cmd = 'sed -i "" "s/\([^ ]\)=>/\1 =>/g" ' + file
      system cmd

      cmd = 'sed -i "" "s/=>\([^ ]\)/=> \1/g" ' + file
      system cmd
    end
  end
end
require "ruby_beautifier/version"

module RubyBeautifier
  def self.run
    files = Dir["**/*.rb"]

    files.each do |file|
      fix_spacing_before_hashrocket = 'sed -i "" "s/\([^ ]\)=>/\1 =>/g" ' + file
      system fix_spacing_before_hashrocket

      fix_spacing_after_hashrocket = 'sed -i "" "s/=>\([^ ]\)/=> \1/g" ' + file
      system fix_spacing_after_hashrocket
    end

    system "sh #{File.expand_path(File.dirname(__FILE__))}/../bin/insert_space_after_comma.sh"
  end
end

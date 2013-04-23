require 'spec_helper'

describe RubyBeautifier do

  describe '#missing_space_before_hash_rocket' do
    it 'a=>b should convert to a =>b' do
      text = 'my test a=>b string'
      RubyBeautifier.missing_space_before_hash_rocket(text).should == 'my test a =>b string'
    end

    it 'a=> b should convert to a => b' do
      text = 'my test a=> b string'
      RubyBeautifier.missing_space_before_hash_rocket(text).should == 'my test a => b string'
    end

    it 'a =>b should be unchanged' do
      text = 'my test a =>b string'
      RubyBeautifier.missing_space_before_hash_rocket(text).should == nil # unchanged
    end

    it 'a => b should be unchanged' do
      text = 'my test a => b string'
      RubyBeautifier.missing_space_before_hash_rocket(text).should == nil # unchanged
    end
  end

end

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
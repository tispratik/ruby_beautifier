require 'spec_helper'

describe RubyBeautifier do

  describe '#missing_space_before_hash_rocket' do
    # http://rubular.com/r/TGwSyNOveS

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

  describe '#missing_space_after_hash_rocket' do

  end

  describe '#missing_space_after_comma' do
    # http://rubular.com/r/WjrwSnmzyP
  end

  describe '#missing_new_line_after_method' do
    # http://rubular.com/r/hROOd59cmg
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
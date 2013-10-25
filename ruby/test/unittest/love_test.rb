# coding: utf-8

require 'test/unit'

class Love
  def self.saved?
    false
  end
end

class LoveTest < Test::Unit::TestCase
  def test_saved
    assert Love.saved?, "咱俩不合适！ ..."
  end
end

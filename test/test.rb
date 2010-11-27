$:.reject{|x| x=='.'}
$:.unshift File.expand_path('../../lib', __FILE__)

require 'test/unit'

class TestRelative < Test::Unit::TestCase
  def test_that_it_works?
    assert_raise(LoadError) do
      require './fixtures/a'
    end

    require 'relative-require'

    assert_nothing_raised() do
      require './fixtures/a'
    end

    assert(defined? C)
    assert(defined? D)
    
    assert_nothing_raised do
      require ['./fixtures/e', __FILE__]
    end
    assert(defined? E)
  end
end

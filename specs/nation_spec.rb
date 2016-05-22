require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/nation.rb'

class TestNation

  def setup()
    options = {
      'id' => 1, 
      'name' => 'Scotland', 
      'flag' => '../public/flags/scotland.gif', 
      'athletes' => ['R. Murdoch']
    }
    @n1 = Nation.new( options )
  end

  def test_nation_has_name()
    result = @n1.name
    assert_equal( 'Scotland', result )
  end

end
require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/athlete.rb'

class TestAthlete

  def setup()
    options = {'id' => 1, 'name' => 'R. Murdoch', 'nation_id' => 1}
    @a1 = Athlete.new( options )
  end

  def test_athlete_has_name()
    result = @a1.name
    assert_equal( 'R. Murdoch', result )
  end

end
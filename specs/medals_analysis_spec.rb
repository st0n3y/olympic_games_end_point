require 'minitest/autorun'
require 'minitest/rg'

require_relative '../models/medals_analysis.rb'
require_relative '../models/athlete.rb'
require_relative '../models/nation.rb'

class TestMedalsAnalysis

  def setup()
    a1 = Athlete.new( {'id' => 1, 'name' => 'R. Murdoch', 'nation_id' => 1} )
    a2 = Athlete.new( {'id' => 2, 'name' => 'E. Doyle', 'nation_id' => 1} )
    a3 = Athlete.new( {'id' => 3, 'name' => 'A. Murray', 'nation_id' => 1} )
    n1 = Nation.new( {'id' => 1, 'name' => 'Scotland', 'flag' => '../public/flags/scotland.gif', 'athletes' => [a1, a2, a3]} )
  end

  def test_total_gold_for_nation( id )

  end

  def test_total_silver_for_nation( id )

  end

  def test_total_bronze_for_nation( id )
      
  end

end
require( 'pg' )

require_relative 'nation.rb'

class MedalsAnalysis

  def initialize()
    @nations = []
  end

  def total_gold_for_nation( nation )
    total = 0
    nation.athletes.each do
      |athlete| total += athlete.gold_medals_won
    end
    return total
  end

  def total_silver_for_nation( nation )
    total = 0
    nation.athletes.each do
      |athlete| total += athlete.silver_medals_won
    end
    return total
  end

  def total_bronze_for_nation( nation )
    total = 0
    nation.athletes.each do
      |athlete| total += athlete.bronze_medals_won
    end
    return total
  end

  def total_points_for_nation( nation )
    total = 0
    total += ( total_gold_for_nation( nation ) * 5 ) + ( total_silver_for_nation( nation ) * 3 ) + (total_bronze_for_nation( nation ) )
    return total
  end

  def points_ranking()
    ranking = []
    for nation in @nations
    ranking << {nation: nation, points: total_points_for_nation( nation )}
    end
    ranking.sort_by {|n| n[:points]}
  end

end
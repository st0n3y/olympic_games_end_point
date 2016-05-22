require( 'pg' )

class MedalsAnalysis

  attr_reader :id, :total_gold, :total_silver, :total_bronze, :nations

  def initialize( options )
    @id = options['id'].to_i
    @total_gold = options['total_gold'].to_i
    @total_silver = options['total_silver'].to_i
    @total_bronze = options['total_bronze'].to_i
    @nations = []
  end

end
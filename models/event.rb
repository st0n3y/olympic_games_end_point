require 'pg'

require_relative '../db/sql_runner.rb'
require_relative 'athlete.rb'
require_relative 'event_reg.rb'

class Event

  attr_accessor :id, :type, :gold_winner, :silver_winner, :bronze_winner

  def initialize( options )
    @id = options['id'].to_i
    @type = options['type']
    @gold_winner = options['gold_winner']
    @silver_winner = options['silver_winner']
    @bronze_winner = options['bronze_winner']
  end

  
  def save()
    sql = "INSERT INTO events (
          type, gold_winner, silver_winner, bronze_winner ) 
          VALUES ( '#{@type}', '#{@gold_winner}', '#{silver_winner}', '#{bronze_winner}' ) 
          RETURNING *;
        "
    return Event.map_item( sql )
  end

  def gold_athlete()
    sql = "SELECT * FROM athletes
          WHERE id = #{@gold_winner};
        "
    return Athlete.map_item( sql )
  end

  def silver_athlete()
    sql = "SELECT * FROM athletes
          WHERE id = #{@silver_winner};
        "
    return Athlete.map_item( sql )
  end

  def bronze_athlete()
    sql = "SELECT * FROM athletes
          WHERE id = #{@bronze_winner};
        "
    return Athlete.map_item( sql )
  end

  def self.all()
    sql = "SELECT * FROM events;"
    return Event.map_items( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM events;"
    SqlRunner.run( sql )
  end

  def self.map_items( sql )
    events = SqlRunner.run( sql )
    result = events.map { |event| Event.new( event ) }
    return result
  end

  def self.map_item( sql )
    result = Event.map_items( sql )
    return result.first
  end

  def self.find( id )
    events = SqlRunner.run( 
      "SELECT * FROM events 
      WHERE id=#{id};" 
    )
    result = Event.new( events.first )
    return result
  end

  def self.update( options )
    SqlRunner.run(  
      "UPDATE events SET 
      name='#{options['name']}',
      type='#{options['type']}', 
      gold_winner=#{options['gold_winner']}, 
      silver_winner=#{options['silver_winner']}, 
      bronze_winner=#{options['bronze_winner']}
      WHERE id=#{options['id']};"
    )
  end

  def self.destroy( id )
    SqlRunner.run( 
      "DELETE FROM events 
      WHERE id=#{id};" 
    )
  end

end
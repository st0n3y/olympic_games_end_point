require 'pg'
require_relative '../db/sql_runner.rb'
require_relative 'nation.rb'
require_relative 'athlete.rb'

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
    sql = "INSERT INTO eventreg (
      type, gold_winner, silver_winner, bronze_winner, date) 
      VALUES ( '#{@type}', '#{@gold_winner}', '#{silver_winner}', '#{bronze_winner}' ) 
      RETURNING *;"
    return EventReg.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM eventreg;"
    return EventReg.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM eventreg;"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    eventregs = SqlRunner.run( sql )
    result = eventregs.map { |eventreg| EventReg.new( eventreg ) }
    return result
  end

  def self.map_item(sql)
    result = EventReg.map_items(sql)
    return result.first
  end

  def self.find(id)
    events = SqlRunner.run( 
      "SELECT * FROM events 
      WHERE id=#{id};" 
    )
    result = Event.new( events.first )
    return result
  end

  def self.update(options)
    SqlRunner.run(  
      "UPDATE events SET 
      name='#{options['name']}',
      type='#{options['type']}', 
      gold_winner='#{options['gold_winner']}', 
      silver_winner='#{options['silver_winner']}', 
      bronze_winner='#{options['bronze_winner']}'
      WHERE id=#{options['id']};"
    )
  end

  def self.destroy( id )
    SqlRunner.run( 
      "DELETE FROM event 
      WHERE id=#{id};" 
    )
  end

end
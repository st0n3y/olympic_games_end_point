require 'pg'

require_relative './athlete.rb'
require_relative './event.rb'

class EventReg

  attr_reader :id, :event_id, :athlete_id

  def initialize( options )
    @id = options['id'].to_i
    @event_id = options['event_id'].to_i
    @athlete_id = options['athlete_id'].to_i
  end

  def save()
    sql = "INSERT INTO eventreg (
      event_id,
      athlete_id) 
      VALUES (
        #{@event_id}, 
        #{@athlete_id}
      ) RETURNING *;"
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
      eventregs = SqlRunner.run( 
        "SELECT * FROM eventreg 
        WHERE id=#{id};" 
      )
      result = EventReg.new( eventregs.first )
      return result
  end

    def self.update(options)
      SqlRunner.run(  
        "UPDATE eventreg SET 
        event_id='#{options['event_id']}',
        athlete_id='#{options['athlete_id']}'
        WHERE id=#{options['id']};"
      )
    end

  def self.destroy(id)
    SqlRunner.run( 'DELETE FROM eventreg WHERE id=#{id};' )
  end
  
end
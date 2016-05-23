require 'pg'

require_relative '../db/sql_runner.rb'
require_relative 'nation.rb'
require_relative 'event.rb'
require_relative 'event_reg.rb'

class Athlete

  attr_accessor :id, :name, :nation_id

    def initialize( options )
      @id = options['id'].to_i
      @name = options['name']
      @nation_id = options['nation_id'].to_i
    end

    def save()
      sql = "INSERT INTO athletes ( name, nation_id ) 
            VALUES ( '#{@name}', 
            #{ @nation_id } ) 
            RETURNING *;
          "
      return Athlete.map_item(sql)
    end

    def gold_medals_won()
      sql = "SELECT events.type FROM athletes 
            INNER JOIN events ON athletes.id = events.gold_winner 
            WHERE athletes.id = #{@id};
          "

      return Athlete.map_items( sql ).length
    end

    def silver_medals_won()
      sql = "SELECT events.type FROM athletes 
            INNER JOIN events ON athletes.id = events.silver_winner 
            WHERE athletes.id = #{@id};
          "

      return Athlete.map_items( sql ).length
    end

    def bronze_medals_won()
      sql = "SELECT events.type FROM athletes 
            INNER JOIN events ON athletes.id = events.bronze_winner 
            WHERE athletes.id = #{@id};
          "

      return Athlete.map_items( sql ).length
    end


    def self.all()
      sql = "SELECT * FROM athletes;"
      return athlete.map_items( sql )
    end

    def self.delete_all()
      sql = "DELETE FROM athletes;"
      SqlRunner.run( sql )
    end

    def self.map_items( sql )
      athletes = SqlRunner.run(sql)
      result = athletes.map { |athlete| Athlete.new( athlete ) }
      return result
    end

    def self.map_item( sql )
      result = Athlete.map_items( sql )
      return result.first
    end

    def self.find( id )
      athletes = SqlRunner.run( "SELECT * FROM athletes WHERE id=#{id};" ) 
      result = Athlete.new( athletes.first )
      return result
    end

    def self.update( options )
        SqlRunner.run(  
          "UPDATE athletes 
          SET name='#{options['name']}',
          nation_id=#{options['nation_id']}
          WHERE id=#{options['id']};"
        ) 
    end

    def self.destroy( id )
      SqlRunner.run( "DELETE FROM albums WHERE id=#{id};" )
    end

end
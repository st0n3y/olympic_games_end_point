require 'pg'

require_relative '../db/sql_runner.rb'
require_relative 'athlete.rb'

class Nation

  attr_accessor :id, :name, :flag, :athletes

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    if options['flag'].is_a? String
      @flag = options['flag']
    else
      @flag = options['flag'][:filename]
      File.open('public/flags/' + options['flag'][:filename], "w") do |f|
         f.write(options['flag'][:tempfile].read)
       end
     end
  end

  def save()
    sql = "INSERT INTO nations ( name, flag ) VALUES ( '#{@name}', '#{@flag}' ) RETURNING *;"
    return Nation.map_item( sql )
  end

  def athlete_team()
    sql = "SELECT athletes.* FROM athletes
          WHERE nation_id = #{@id};"
    return Athlete.map_items( sql )
  end

  def self.all()
    sql = "SELECT * FROM nations;"
    return Nation.map_items( sql )
  end

  def self.delete_all()
    sql = "DELETE FROM nations;"
    SqlRunner.run( sql )
  end

  def self.map_items( sql )
    nations = SqlRunner.run( sql )
    result = nations.map { |nation| Nation.new( nation ) }
    return result
  end

  def self.map_item( sql )
    result = Nation.map_items( sql )
    return result.first
  end

  def self.find( id )
    nations = SqlRunner.run( "SELECT * FROM nations WHERE id=#{id};" ) 
    result = Nation.new( nations.first )
    return result
  end

  def update( options )
      SqlRunner.run(  
        "UPDATE nations 
        SET name='#{options['name']}',
        flag='#{options['flag']}'
        WHERE id=#{options['id']};"
      ) 
  end

  def self.destroy( id )
    SqlRunner.run( "DELETE FROM nations WHERE id=#{id};" )
  end

end
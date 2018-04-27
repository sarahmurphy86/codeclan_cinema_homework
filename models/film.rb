require_relative("../db/sql_runner")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

# Instance Variable:
  def save()
    sql = 'INSERT INTO films (title, price)
    VALUES ($1, $2) RETURNING id'
    values = [@title, @price]
    film = SqlRunner.run(sql, values)[0]
    @id = film['id'].to_i
  end

# Class variables:
  def self.map_items(film_data)
    result = film_data.map { |film| Film.new(film) }
    return result
  end

  def self.all()
    sql = "SELECT * FROM films"
    film_data = SqlRunner.run(sql)
    return Film.map_items(film_data)
  end
end

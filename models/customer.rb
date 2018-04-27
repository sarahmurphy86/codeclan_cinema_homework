require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

# Instance Variable:
  def save()
    sql = 'INSERT INTO customers (name, funds)
    VALUES ($1, $2) RETURNING id'
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)[0]
    @id = customer['id'].to_i
   end


# Class
  def self.map_items(customer_data)
    result = customer_data.map { |customer| Customer.new(customer) }
    return result
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customer_data = SqlRunner.run(sql)
    return Customer.map_items(customer_data)
  end

end

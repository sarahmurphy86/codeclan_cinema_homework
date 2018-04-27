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
  def self.all()
    sql = 'SELECT * FROM customers'
    customer_hashes = SqlRunner.run(sql)
    customers = customer_hashes.map { |customer| Customer.new(customer)} 
    return customers
  end

end

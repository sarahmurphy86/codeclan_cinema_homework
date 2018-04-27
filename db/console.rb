require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')

require('pry-byebug')

Film.delete_all()
Ticket.delete_all()
Customer.delete_all()

customer1 = Customer.new({
  'name' => 'Brad Pitt',
  'funds'=> 100
  })
customer1.save()

customer2 = Customer.new({
  'name' => 'Angelina Jolie',
  'funds'=> 800
  })
customer2.save()

customer3 = Customer.new({
  'name' => 'Jennifer Aniston',
  'funds'=> 800
  })
customer3.save()

film1 = Film.new({
  'title' => 'Pulp Fiction',
  'price'=> 10
  })
film1.save()

film2 = Film.new({
  'title' => 'A Prophet',
  'price'=> 8
  })
film2.save()

film3 = Film.new({
  'title' => 'Drive',
  'price'=> 5
  })
film3.save()

ticket1 = Ticket.new({
  'film_id' => film1.id,
  'customer_id' => customer1.id
  })
ticket1.save()

ticket2 = Ticket.new({
  'film_id' => film2.id,
  'customer_id' => customer1.id
  })
ticket2.save()

ticket3 = Ticket.new({
  'film_id' => film3.id,
  'customer_id' => customer3.id
  })
ticket3.save()

ticket4 = Ticket.new({
  'film_id' => film2.id,
  'customer_id' => customer2.id
  })
ticket4.save()

binding.pry
nil

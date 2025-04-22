class Order
  attr_reader :meal, :customer, :employee
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @meal = attributes[:meal] # instance
    @customer = attributes[:customer] # instance
    @employee = attributes[:employee] # instance
    @delivered = attributes[:delivered] || false # boolean
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end

# require_relative 'meal'
# require_relative 'customer'
# meal = Meal.new(name: 'pizza', price: 600)
# customer = Customer.new(name: 'celso', address: '123 street')


# p Order.new(
#   meal: meal,
#   customer: customer
# )

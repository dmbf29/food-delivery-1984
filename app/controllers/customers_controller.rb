require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    # ask the repository to give me the customers instances in an array
    customers = @customer_repository.all
    # ask the view to display the customers
    @customers_view.display(customers)
  end

  def add
    # Ask the view to ask the user for a name and store it
    name = @customers_view.ask_for("name")
    # Ask the view to ask the user for a price and store it
    address = @customers_view.ask_for("address")
    # make a new customer instance
    customer = Customer.new(name: name, address: address)
    # ask the repo to store the instance
    @customer_repository.create(customer)
  end
end

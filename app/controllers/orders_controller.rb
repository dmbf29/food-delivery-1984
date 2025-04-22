require_relative '../views/orders_view'
require_relative '../views/employees_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
  end

  def list_undelivered_orders
    # ask the repo for the undelivered orders
    orders = @order_repository.undelivered_orders
    # tell the view to display them
    @orders_view.display(orders)
  end

  def add
    # get the meals from the meal_repo
    # display all the meals
    # ask manager for the index
    # get the meal instance using the index
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @meals_view.ask_for('number').to_i - 1
    meal = meals[index]

    # get the customers from the customer_repo
    # display all the customers
    # ask manager for the index
    # get the customer instance using the index
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @customers_view.ask_for('number').to_i - 1
    customer = customers[index]

    # get the riders from the empoyee_repo
    # display all the riders
    # ask manager for the index
    # get the rider instance using the index
    employees = @employee_repository.all_riders
    @employees_view.display(employees)
    index = @employees_view.ask_for('number').to_i - 1
    employee = employees[index]

    # create an instance of an order
    order = Order.new(
      meal: meal,
      customer: customer,
      employee: employee
    )
    # give the order to the order_repo
    @order_repository.create(order)
  end

  def list_my_undelivered_orders(employee)
    # ask the repo for the undelivered orders
    orders = @order_repository.my_undelivered_orders(employee)
    # tell the view to display them
    @orders_view.display(orders)
  end

  def mark_as_delivered(employee)
    # ask the repo for the undelivered orders
    orders = @order_repository.my_undelivered_orders(employee)
    # tell the view to display them
    @orders_view.display(orders)
    # tell view to ask for index
    index = @orders_view.ask_for('number').to_i - 1
    # get the instance of the order
    order = orders[index]
    # mark as delivereed
    @order_repository.mark_as_delivered(order)
  end
end

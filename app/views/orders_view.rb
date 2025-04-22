class OrdersView
  # a way to display the orders
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} - #{order.meal.name} - #{order.customer.name} @ #{order.customer.address}
      rider: #{order.employee.username}"
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}?"
    gets.chomp
  end
end

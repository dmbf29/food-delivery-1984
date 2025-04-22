class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      # if successful, it returns an employee instance
      # if NOT successful, it returns nil
      @employee = @sessions_controller.log_in
      while @employee
        if @employee.manager?
          choice = display_manager_menu
          print `clear`
          manager_action(choice)
        else
          choice = display_rider_menu
          print `clear`
          rider_action(choice)
        end
      end
    end
  end

  private

  def display_manager_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "9 - Quit"
    puts "0 - Log out"
    print "> "
    gets.chomp.to_i
  end

  def display_rider_menu
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all my undelivered orders"
    puts "2 - Mark an order as delivered"
    puts "9 - Quit"
    puts "0 - Log out"
    print "> "
    gets.chomp.to_i
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then quit
    when 0 then log_out
    else
      puts "Try again..."
    end
  end

  def rider_action(choice)
    case choice
    when 1 then '??'
    when 2 then '??'
    when 9 then quit
    when 0 then log_out
    else
      puts "Try again..."
    end
  end

  def log_out
    @employee = nil
  end

  def quit
    @employee = nil
    @running = false
  end
end

require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    load_csv if File.exist?(@csv_file_path)
  end

  def all_riders
    @employees.select do |employee|
      employee.rider?
    end
  end

  def find_by_username(username)
    @employees.find do |employee|
      employee.username == username
    end
  end

  # inside of the order repository
  # @employee.repository.find(1)
  # @employee.repository.find(id_from_the_csv)
  def find(id)
    @employees.find do |employee|
      employee.id == id
    end
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      attributes[:id] = attributes[:id].to_i
      @employees << Employee.new(attributes)
    end
  end
end



# display all meals
# ask which meal
# get the meal with the number
#
# display all customers
# ask which customer
# get the customer with the number

# display all riders
# ask which employee
# get the employee with the number

# Order.new(
#   meal: meal, #instance of a meal
#   customer: customer, #instance of a customer
#   employee: employee #instance of a employee (rider)
# )

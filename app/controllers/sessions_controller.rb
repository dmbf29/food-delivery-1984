require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def log_in
    # tell the view to ask for username
    username = @sessions_view.ask_for('username')
    # tell the view to ask for password
    password = @sessions_view.ask_for('password')
    # ask the repository for an employee by username
    employee = @employee_repository.find_by_username(username)
    # check if the given password is the same as the employee's password
    if employee && employee.password == password
      @sessions_view.welcome(employee)
      return employee
    else
      # tell them wrong info, try again
      @sessions_view.wrong_credentials
      log_in
    end
  end
end

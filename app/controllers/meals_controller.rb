require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # ask the repository to give me the meals instances in an array
    meals = @meal_repository.all
    # ask the view to display the meals
    @meals_view.display(meals)
  end

  def add
    # Ask the view to ask the user for a name and store it
    name = @meals_view.ask_for("name")
    # Ask the view to ask the user for a price and store it
    price = @meals_view.ask_for("price").to_i
    # make a new meal instance
    meal = Meal.new(name: name, price: price)
    # ask the repo to store the instance
    @meal_repository.create(meal)
  end
end

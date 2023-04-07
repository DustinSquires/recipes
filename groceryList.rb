# groceryList class that takes in recipes, adds them, sorts by aisle
class GroceryList
  def initialize(recipes)
    @recipeNames, @list, @totalCalories = [], {}, 0
    set_recipes(recipes)
  end

  def to_s()
    list.each do |k, v|
      puts "#{v} #{k}"
    end
  end

  private
  def set_recipes(recipes)
    recipes.each do |recipe|
      recipeNames << recipe.name
      totalCalories << recipe.calories
      recipe.ingredients.each do |ingr|
        if list.has_key?(ingr.label)
          list[ingr.label] += ingr.quantity.to_i
        else
          list[ingr.label] = ingr.quantity.to_i
        end
      end
    end
  end

  attr_reader :recipeNames, :list, :totalCalories
end
# groceryList class that takes in recipes, adds them, sorts by aisle
class GroceryList
  def initialize(recipes, aisleList)
    @recipeNames, @list, @totalCalories = [], {}, 0
    set_recipes(recipes, aisleList)
  end

  def to_s()
    list.each do |k, v|
      puts "#{v} #{k[:quantity]}"
    end
  end

  def print_by_aisle()
    list.sort_by { |k, v| v[:aisleNumber] }.each do |k, v|
      puts "#{v[:quantity]} #{k} on aisle #{v[:aisleNumber]}"
    end
  end

  attr_reader :list

  private
  def set_recipes(recipes, aisleList)
    recipes.each do |recipe|
      recipeNames << recipe.name
      totalCalories << recipe.calories
      recipe.ingredients.each do |ingr|
        aisleNumber = aisleList.get_aisle_number(ingr.name)
        if list.has_key?(ingr.label)
          list[ingr.label] = {:quantity => ingr.quantity.to_i + list[ingr.label][:quantity], :aisleNumber => aisleNumber}
        else
          list[ingr.label] = {:quantity => ingr.quantity.to_i, :aisleNumber => aisleNumber}
        end
      end
    end
  end

  attr_reader :recipeNames, :totalCalories
end
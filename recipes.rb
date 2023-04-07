# recipes.rb
require 'set'
load 'recipe.rb'
load 'ingredient.rb'
load 'groceryList.rb'
load 'aisleList.rb'

seen_recipes = Set.new(File.read("seen_recipes.txt").split)
recipe_book = {} # get recipes and load into hash

Dir["./recipes/*.txt"].each do |file_path|
  recipe_name = file_path.split('/').last.chomp('.txt') # get name from file
  recipe_book[recipe_name] = Recipe.new(recipe_name, file_path) # load recipe from file into recipe book
end


aisles = AisleList.new("aisle_key.txt") # attribute aisle to number in master list of current store
groceryList = GroceryList.new(recipe_book.values, aisles)
# puts aisles.get_aisle_number("chili powder")

groceryList.print_by_aisle
 


# when choosing recipes, present servings and calories added
# when new ingredient is recognized - ask for aisle and save
# email grocery list to me when done
# add description, aisle number, last eaten date (self db or update file?)
class Recipe
  def initialize(name, filePath)
    @calories, @servings, @ingredients, @name = 0, 0, [], name
    self.set_ingredients(filePath)
  end

  def set_ingredients(filePath)
    lines = File.open(filePath).readlines.map(&:chomp)
    calories, servings = lines[0], lines[1]

    lines.drop(2).each do |line|
      splits = line.split(' ', 3)
      ingr = splits.size == 1 ? Ingredient.new(nil, nil, line) : Ingredient.new(*splits)
      ingredients << ingr
    end
  end

  attr_reader :calories, :servings, :ingredients, :meat, :name
end
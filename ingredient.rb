class Ingredient
  def initialize(quantity, measurement, name)
    @quantity, @measurement, @name = quantity, measurement, name
  end

  def to_s
    "#{quantity} #{measurement} #{name}"
  end

  def label
    measurement ? "#{measurement} of #{name}" : "#{name}"
  end

  attr_reader :quantity, :measurement, :name
end
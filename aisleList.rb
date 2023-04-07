# aisleList class that takes in an aisleList, reads it and sets them to their aisle number
class AisleList
  def initialize(aisleFile)
    @list, @aisleFile = {}, aisleFile
    set_aisles(aisleFile)
  end

  def get_aisle_number(aisle)
    (list.has_key? aisle) ? list[aisle] : assign_aisle_number(aisle)
  end

  def assign_aisle_number(aisle)
    puts "Enter the aisle number for: #{aisle}" # error checking?
    aisle_number = gets.chomp.to_i
    File.open(aisleFile, 'a') {|f| f.puts "#{aisle} - #{aisle_number}"}
    aisle_number
  end

  def to_s()
    list.each do |k, v|
      puts "#{k} is on aisle #{v}"
    end
  end

  private
  def set_aisles(aisleFile)
    File.open(aisleFile).readlines.map(&:chomp).each do |aisles|
      name, number = aisles.split(' - ')
      list[name] = number.to_i
    end
  end
  attr_reader :list, :aisleFile
end
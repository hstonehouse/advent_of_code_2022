class CommonLetter
  def initialize(string_1, string_2)
    @string_1 = string_1
    @string_2 = string_2
  end

  def common_rucksack_item
    @string_1.each do |letter|
      if @string_2.include?(letter)
        return letter
      end
    end
  end
end

class SupplyItemPriority
  def initialize
    @priorities = []
  end

  def calculate_priority(item)
    if item == item.upcase
      @priorities << item.ord - 38
    else
      @priorities << item.ord - 96
    end
  end

  def sum
    @priorities.sum
  end
end

priority = SupplyItemPriority.new

File.foreach("day_3/input.txt") do |line|
  line_length_halved = line.length/2
  part_1, part_2 = line.slice(0, line_length_halved).split(""), line.slice(line_length_halved, line.length).split("")
  common_letter = CommonLetter.new(part_1, part_2)
  common_item = common_letter.common_rucksack_item
  priority.calculate_priority(common_item)
end

puts priority.sum

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

# Part 2

class BadgeLetter
  def initialize(items_from_three_elves)
    @items_from_three_elves = items_from_three_elves
  end

  def letter
    elf_1_items = @items_from_three_elves[0].split("")
    elf_1_items.each do |letter|
      if @items_from_three_elves[1].include?(letter) && @items_from_three_elves[2].include?(letter)
        return letter
      end
    end
  end
end

class BadgePriority
  def initialize
    @priorities = []
  end

  def calculate_priority(badge_letter)
    if badge_letter == badge_letter.upcase
      @priorities << badge_letter.ord - 38
    else
      @priorities << badge_letter.ord - 96
    end
  end

  def sum
    @priorities.sum
  end
end

counter = 0
items_from_three_elves = []
badge_priority = BadgePriority.new

File.foreach("day_3/input.txt") do |line|
  items_from_three_elves << line
  counter += 1
  if counter == 3
    badge_letter = BadgeLetter.new(items_from_three_elves).letter
    badge_priority.calculate_priority(badge_letter)
    counter = 0
    items_from_three_elves = []
  end
end

puts badge_priority.sum

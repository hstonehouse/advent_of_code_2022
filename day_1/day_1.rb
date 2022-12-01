elf_calories = []
calorie_tracker = 0
most_calories = 0

data = File.read("day_1/input.txt").lines

data.each do |num|
  if num == "\n"
    elf_calories << calorie_tracker
    calorie_tracker = 0
  else
    calorie_tracker += num.to_i
  end
end

elf_calories.each do |num|
  if num > most_calories
    most_calories = num
  end
end

puts most_calories

top_three = elf_calories.sort.slice(-3, 3)
top_three_combined = 0
top_three.each {|calories| top_three_combined += calories}

puts top_three_combined

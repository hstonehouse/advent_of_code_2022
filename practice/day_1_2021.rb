counter = 0
num = 141

data = File.read("practice/input.txt").split

data.each do |input|
  if num.to_i < input.to_i
    counter+=1
  end
  num = input
end

puts counter

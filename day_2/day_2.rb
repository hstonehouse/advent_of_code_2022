# Opponent: A for Rock, B for Paper, and C for Scissors
# Me: X for Rock, Y for Paper, and Z for Scissors
# 0 if you lost, 3 if the round was a draw, and 6 if you won

score = []

class Round
  def initialize(opponent_choice, my_choice)
    @opponent_choice = opponent_choice
    @my_choice = my_choice
  end

  def my_initial_score
    case @my_choice
      when "rock"
        return 1
      when "paper"
        return 2
      when "scissors"
        return 3
    end
  end

  def win_lose_or_draw
    if @opponent_choice == @my_choice
      return 3
    elsif @opponent_choice == "rock" && @my_choice == "paper" || @opponent_choice == "paper" && @my_choice == "scissors" || @opponent_choice == "scissors" && @my_choice == "rock"
      return 6
    else
      return 0
    end
  end

  def total_score
    my_initial_score + win_lose_or_draw
  end
end

File.foreach("day_2/strategy.txt") do |line|
  opponent_choice = ""
  my_choice = ""

  case line.split[0]
    when "A"
      opponent_choice = "rock"
    when "B"
      opponent_choice = "paper"
    else
      opponent_choice = "scissors"
  end

  case line.split[1]
    when "X"
      my_choice = "rock"
    when "Y"
      my_choice = "paper"
    else
      my_choice = "scissors"
  end

  this_round = Round.new(opponent_choice, my_choice)
  score << this_round.total_score
end

puts score.sum


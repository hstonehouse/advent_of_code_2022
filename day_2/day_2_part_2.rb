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

class MyChoice
  def initialize(opponent_choice, outcome)
    @opponent_choice = opponent_choice
    @outcome = outcome
  end

  def what_to_choose
    if @opponent_choice == "rock" && @outcome == "win" || @opponent_choice == "paper" && @outcome == "draw" || @opponent_choice == "scissors" && @outcome == "lose"
      return "paper"
    elsif @opponent_choice == "rock" && @outcome == "lose" || @opponent_choice == "scissors" && @outcome == "draw" || @opponent_choice == "paper" && @outcome == "win"
      return "scissors"
    else
      return "rock"
    end
  end
end

File.foreach("day_2/strategy.txt") do |line|
  opponent_choice = ""
  outcome = ""

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
      outcome = "lose"
    when "Y"
      outcome = "draw"
    else
      outcome = "win"
  end

  my_choice = MyChoice.new(opponent_choice, outcome).what_to_choose
  this_round = Round.new(opponent_choice, my_choice)
  score << this_round.total_score
end

puts score.sum

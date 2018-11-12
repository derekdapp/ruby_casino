require_relative 'deck'

class HighLow
  def initialize(player)
    @player = player
    @deck = Deck.new
    play
  end

  def play
    puts "How much do you want to wager?"
    wager = gets.strip.to_i
    if wager > 0
      first_card = @deck.pull_card
      second_card = @deck.pull_card
      puts "The card is #{first_card}"
      print "(higher/lower): "
      guess = gets.strip.downcase
      puts "The second card is #{second_card}"
      if guess == 'higher'
        if is_correct = first_card.to_i <= second_card.to_i
          puts "You won!"
        else
          puts "You lost"
        end
        wager *= -1 if !is_correct
        @player.money += wager
      else
        if is_correct = first_card.to_i > second_card.to_i
          puts "You won!"
        else
          puts "You lost"
        end
        wager *= -1 if !is_correct
        @player.money += wager
      end
    else
      puts "go home"
      return
    end
  end
end
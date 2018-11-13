class Slots
  def initialize(player)
    @player = player
    @options = ["X", "O", "K", "$"]
    @selected = [@options.sample, @options.sample, @options.sample]
    make_bets
  end

  def make_bets
    puts "How much do you want to bet?"
    print "> "
    bet = gets.to_i
    puts "[#{@selected[0]}] [] []"
    sleep(1)
    puts "[#{@selected[0]}] [#{@selected[1]}] []"
    sleep(1)
    puts "[#{@selected[0]}] [#{@selected[1]}] [#{@selected[2]}]"
    result(bet)
  end

  def result(bet)
    if @selected[0] == @selected[1] && @selected[1] == @selected[2]
      puts "You win #{bet}"
      @player.money += bet
    else 
      puts "You lose #{bet}"
      @player.money -= bet
    end
    sleep(1)
    play_again
  end

  def play_again
    puts "Play Again? (y) or (n)"
    print "> "
    case gets.strip.downcase
      when "y"
        Slots.new
      when "n"
        puts "Thanks for playing!"
      else 
        play_again
    end
  end
end
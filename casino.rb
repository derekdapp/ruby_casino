# -Start game player has a name and an initial bankroll
# -Player can go to different games via menu
#    Slots
#    High / Low
# -Player places bet and wins / loses
# -Player's bankroll goes up and down with 
# wins and losses

require_relative 'player'
require_relative 'high_low'

class Casino
  def initialize
    @player = Player.new
    show_menu
  end

  def show_menu
    begin
      puts 'What do you want to do?'
      puts '1. Slots'
      puts '2. High / Low'
      puts '3. Check wallet'
      puts '4. Exit'
      response = gets.strip.to_i
      raise "Bad Input" unless response > 0 && response < 5
      case response
      when 1
        # todo: slots
      when 2
        HighLow.new(@player)
      when 3
        puts "you have $#{@player.money}"
      when 4
        puts "Have a nice day!"
        exit
      else
        raise
      end
      show_menu
    rescue StandardError => e
      puts e
      retry
    end
  end
end

Casino.new
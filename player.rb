class Player
  attr_accessor :name, :money
  def initialize
    puts "What is your name?"
    @name = gets.strip
    @money = 100.0
  end
end
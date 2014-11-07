require 'faker'

class Game
  attr_reader :display_time

  def initialize
    @multiplier = 1
    @word_length = 2
    @display_time = @word_length
    @memory_string = ""
    @hacker_hash = {0 => Faker::Hacker.abbreviation, 1 => Faker::Hacker.adjective, 2 => Faker::Hacker.noun, 3 => Faker::Hacker.verb}
  end

  def generate_question
    @memory_string = ""
    @word_length.times do
      @memory_string += @hacker_hash[rand(4)] + " "
    end
    @word_length += 1
    @display_time = @word_length * @multiplier
    @multiplier - 0.05
    @memory_string
  end

end



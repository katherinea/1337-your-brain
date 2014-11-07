require 'faker'

class Game

  def initialize
    @word_length = 2
    @display_time = 5
    @memory_string = ""
    @hacker_hash = {0 => Faker::Hacker.abbreviation, 1 => Faker::Hacker.adjective, 2 => Faker::Hacker.noun, 3 => Faker::Hacker.verb}
  end

  def generate_question
    @word_length.times do
      @memory_string += @hacker_hash[rand(4)] + " "
    end
    @word_length += 1
    @memory_string
  end

end



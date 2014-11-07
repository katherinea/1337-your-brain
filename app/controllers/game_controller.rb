require_relative '../models/game'
require_relative '../models/score'
require_relative '../views/game_view'
require_relative 'score_controller'

class GameController

  def initialize
    @view = GameView.new
    @score = ScoreController.new
    @game = Game.new
    @death = false
  end

  def splash_screen
    @view.clear_screen
    @view.splash_screen
    input = gets
    if input == "\n"
      start_game
    else
      splash_screen
    end
  end

  def start_game
    until @death == true
      @view.clear_screen
      if current_score
        puts "Your current score is: #{current_score.to_s}"
      else
        puts "No score yet."
      end
      memory_words = @game.generate_question
      @view.display_memory_string(memory_words)
      sleep(@game.display_time)
      @view.clear_screen
      puts "Type all the words you can remember:"
      answer = @view.get_input
      check_answer(memory_words, answer)
    end
    @view.clear_screen
    save_name
    @view.clear_screen
    show_high_scores
  end

  def check_answer(memory_words, user_input)
    question_score = @score.calculate_score(memory_words, user_input)
    if question_score == 0
      @death = true
    end
    #otherwise continue

  end

  def current_score
    @score.show_score
  end

  def save_name
    puts "Sorry you aren't Hackey Enough"
    puts "        You Lost!!!"
    name = @view.get_input("Type Your Hacker Name")
    @score.save_name(name)
  end

  def show_high_scores
    scores = @score.high_scores
    @view.display_high_scores(scores)
  end

end

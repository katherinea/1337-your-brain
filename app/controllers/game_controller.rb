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
    @view.get_input
    start_game
  end

  def start_game
    until @death == true
      memory_words = @game.generate_question
      @view.display_memory_string(memory_words, @game.display_time)
      check_answer(memory_words, @view.get_input)
    end
  end

  def check_answer
    @score += calculate_score
    #if statement
    death
    #otherwise continue
  end

  def current_score

  end

  def high_score
    #scores = Score.order(:score).limit(3)
    score = Score.high_score
    @view.display_highscore(scores)
  end

  def death
    @death = true
  end

end

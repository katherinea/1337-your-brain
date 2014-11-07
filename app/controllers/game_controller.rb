require_relative '../models/game'
require_relative '../models/score'
require_relative '../views/game_view'
require_relative 'score_controller'

class GameController

  def initialize
    @view = GameView.new
    @score = ScoreController.new
    @death = false
  end

  def splash_screen
    @view.clear_screen
    @view.splash_screen
    start_game(@view.get_input)
  end

  def start_game()
    # starts the game
    until death == true
      generate_question
      check_anser(@view.get_input)
    end
  end

  def check_answer
    @score += calculate_score
    #if statement
    death
    #otherwise continue
  end


  def generate_question

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

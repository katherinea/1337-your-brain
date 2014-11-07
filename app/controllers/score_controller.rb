require_relative '../models/score'
require_relative '../views/score_view'

class ScoreController

  def initialize
    @score = Score.new
    @score.score = 0
    @score.name = "Player"
    @view = ScoreView.new
  end

  def calculate_score(words, user_words)
    words = words.downcase.split(" ")
    user_words = user_words.downcase.split(" ")

    question_score = 0

    user_words.each do |word|
      if words.include?(word)
        question_score += 5
      end
    end

    if user_words == words
       question_score *= 2
    end

    save_score(question_score)
  end

  def save_score(question_score)
    @score.score += question_score
    @score.save
  end

  def save_name(name)
    @score.name = name
    @score.save
  end

  def show_score
    @view.show_score(@score.score)
  end

  def high_scores
    Score.order('score DESC').limit(3)
  end

end




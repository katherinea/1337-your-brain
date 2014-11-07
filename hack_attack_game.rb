require_relative 'config/application'
require_relative 'app/controllers/game_controller'


game = GameController.new

game.splash_screen

class GameView

  def splash_screen

    puts %q{
 __  __                   __
/\ \/\ \                 /\ \
\ \ \_\ \     __      ___\ \ \/'\
 \ \  _  \  /'__`\   /'___\ \ , <
  \ \ \ \ \/\ \L\.\_/\ \__/\ \  \\`\
   \ \_\ \_\ \__/.\_\ \____ \\ \_\ \_\
    \/_/\/_/\/__/\/_/\/____/ \/_/\/_/


 ______  __    __                    __
/\  _  \/\ \__/\ \__                /\ \
\ \ \L\ \ \ ,_\ \ ,_\    __      ___\ \ \/'\
 \ \  __ \ \ \/\ \ \/  /'__`\   /'___\ \ , <
  \ \ \/\ \ \ \_\ \ \_/\ \L\.\_/\ \__/\ \ /\`\
   \ \_\ \_\ \___\ \__\ \__/.\_\ \_____\ \_\ \_\
    \/_/\/_/\/__/ \/__/\/__/\/_/\/____/ \/_/\/_/
    }
     puts "           Press any key to start game"

    # display_high_scores
  end

  def clear_screen
    print "\e[2J"
  end

  def display_memory_string(string, time)
    puts string
    sleep(time)
    self.clear_screen
    puts "Type all the words you can remember:"
  end

  def get_input(message = nil)
    puts message if message
    gets.chomp
  end

  def display_high_scores(scores)
    scores.each do |score|
      puts score
    end
  end




end

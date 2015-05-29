# Two players take turns answering math questions (addition at first).
# Pick two numbers between 1 and 20 and do a math to them. 

# Start the game. Initialize the player names and lives. (3 lives each.)

# Each time a player loses a life, print out the lives for both players. 

require_relative 'game'

def setup_game
  puts "How many players will be playing? (Please enter an integer from 2 to 9)"
  response = gets.chomp.to_i
  @game = Game.new(response)
  while @game.can_start? == false
    player_no = @game.next_empty_player_slot + 1
    puts "Please input a name for Player #{player_no}:"
    response = gets.chomp
    @game.add_new_player(response)
  end
end

def main_game_loop
  while @game.players.count > 1
    next_player
    check_answer
  end
end

def next_player
  @game.move_to_next_player
  current_player = @game.current_player.name
  puts "#{current_player}, it's your turn!"
  question = @game.ask_new_question
  puts question  
end

def check_answer
  response = gets.chomp.to_i
  passed = @game.answer_question(response)
  if passed
    success
  else
    failure
  end
end

def success
  puts "Correct! Congratulations!"
  @game.praise_current_player
  score = @game.current_player.score
  puts "Your score is now: #{score}"
end

def failure
  @game.hurt_current_player
  if @game.current_player.lives == 0
    puts "Wrong! You're out of the game!"
    @game.kill_current_player
  else
    puts "Wrong! You lose one life!"
    name = @game.current_player.name
    lives = @game.current_player.lives
    puts "#{name} has this many lives left: #{lives}"
  end
end

def end_game
  winner = @game.players[0].name
  puts "#{winner} wins!"
end



puts "Welcome to Math Game!"
setup_game
main_game_loop
end_game








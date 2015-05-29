require_relative 'question'
require_relative 'player'
class Game
  attr_reader   :players
  attr_reader   :dead_players
  attr_reader   :player_count
  attr_reader   :current_player_index
  attr_reader   :current_question

  def initialize(player_count)
    @players = []
    @dead_players = []
    @death_flag = false
    @current_question = nil
    @player_count = player_count
    @current_player_index = -1
  end

  def add_new_player(name)
    if next_empty_player_slot
      @players[next_empty_player_slot] = Player.new(name)
    else
      return false
    end
  end

  def can_start?
    return @players.count == @player_count
  end

  def next_empty_player_slot
    return @players.count if @players.count < @player_count
    return false
  end

  def move_to_next_player
    if @death_flag == false
      @current_player_index += 1
    end
    if @current_player_index >= @players.count
      @current_player_index = 0
    end
    @death_flag = false
  end

  def current_player
    return @players[@current_player_index]
  end

  def ask_new_question
    @current_question = Question.new
    return @current_question.string
  end

  def answer_question(int)
    passed = @current_question.answer(int)
    current_player.history << @current_question.dup
    return passed
  end

  def praise_current_player
    current_player.score += 1
  end

  def hurt_current_player
    current_player.lives -= 1
  end

  def kill_current_player
    if current_player.lives == 0
      @dead_players << @players.slice!(@current_player_index)
      @death_flag = true
    end
  end

end
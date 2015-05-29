class Player
  attr_accessor :name
  attr_accessor :lives
  attr_accessor :history
  attr_accessor :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
    @history = []
  end
end
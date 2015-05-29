class Question

  attr_reader   :num1
  attr_reader   :num2
  attr_reader   :answer
  attr_reader   :string
  attr_reader   :passed

  OPERATIONS = [:addition, :subtraction, :multiplication]

  def initialize
    make_new_question
    @passed = nil
  end

  def make_new_question(question_kind = nil)
    question_kind = OPERATIONS[rand(OPERATIONS.length)] unless question_kind
    case question_kind
    when :addition
      addition_question
    when :subtraction
      subtraction_question
    when :multiplication
      multiplication_question
    else
      @num1 = nil
      @num2 = nil
      @answer = nil
      @string = nil
    end
  end

  def addition_question
    @num1 = 1 + rand(20)
    @num2 = 1 + rand(20)
    @answer = @num1 + @num2
    @string = "#{@num1} + #{@num2} = ?"
  end

  def subtraction_question
    @num1 = 1 + rand(20)
    @num2 = 1 + rand(20)
    @answer = @num1 - @num2
    @string = "#{@num1} - #{@num2} = ?"
  end

  def multiplication_question
    @num1 = 1 + rand(8)
    @num2 = 1 + rand(8)
    @answer = @num1 * @num2
    @string = "#{@num1} x #{@num2} = ?"
  end

  def answer(int)
    if int == @answer
      @passed = true
    else
      @passed = false
    end
    return @passed
  end
end
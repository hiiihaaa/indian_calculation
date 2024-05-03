class CalculationsController < ApplicationController
  def whiteboard
    @type = rand(1..4)
    set_problem(@type)
  end

  def check

  end

  private
    def set_problem(ptype)
      if ptype == 1
        @a = rand(1..9)
        @b = rand(1..9)
        @c = @a
        @d = 10 - @b
        @fomula = "ab*ac"
        @answer = "a*(a+1)*100 + b*c"
      elsif ptype == 2
        @a = rand(1..9)
        @b = rand(1..9)
        @c = @a
        @d = ((1..9).to_a - [10-@b]).sample
        @fomula = "ab*ac"
        @answer = "a*(ab+c)*10 + b*c"
      elsif ptype == 3
        @a = rand(1..9)
        @b = rand(1..9)
        @c = 10 - @a
        @d = @b
        @fomula = "ac*bc"
        @answer = "(a*b+c)*100 + c^2"
      elsif ptype == 4
        tmp1 = rand(1..9)
        tmp2 = rand(1..9)
        @a = tmp1
        @b = tmp2
        @c = tmp1-1
        @d = 10-tmp2
        @fomula = "(x*10-y)(x*10+y)"
        @answer = "x^2*100 + y^2"
      end
    end
end

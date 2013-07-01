"(+ 1 1)"
"(+ 1 (+ 3 4))"
"(+ (* 2 2) (+ 3 4))"
"(+ (* 2 2) (+ 3 (+ 1 1)))"

class Number
  attr_accessor :integer

  def initialize(integer)
    self.integer = integer
  end

  def eval
    integer
  end
end

class Plus
  attr_accessor :expression_1, :expression_2

  def initialize(expression_1, expression_2)
    self.expression_1 = expression_1
    self.expression_2 = expression_2
  end

  def eval
    expression_1.eval + expression_2.eval
  end
end

class Multiply
  attr_accessor :expression_1, :expression_2

  def initialize(expression_1, expression_2)
    self.expression_1 = expression_1
    self.expression_2 = expression_2
  end

  def eval
    expression_1.eval * expression_2.eval
  end
end

def parse_number(string)
  [Number.new(Integer(string[0])), string[1..-1]]
rescue ArgumentError
  return [nil, string]
end

def parse_space(string)
  if string[0] = " "
     [true, string[1..-1]]
  else
    [nil, string]
  end
end

def close_paren(string)
  if string[0] = ")"
    [true, string[1..-1]]
  else
    [nil, string]
  end
end

def parse_expression(string)
  result, rest = parse_number(string)
  if result.nil?
    result, rest = parse_plus(string)
  end
  if result.nil?
    result, rest = parse_multiply(string)
  end

  raise "Parse error at #{string}" if result.nil?
  [result, rest]
end

def parse_plus(string)
  if string[0..1] == "(+"
    rest         = string[2..-1]
    result, rest = parse_space(rest)
    raise "Parse error at #{rest}" if result.nil?
    exp1, rest   = parse_expression(rest)
    raise "Parse error at #{rest}" if result.nil?
    result, rest = parse_space(rest)
    raise "Parse error at #{rest}" if result.nil?
    exp2, rest   = parse_expression(rest)
    raise "Parse error at #{rest}" if result.nil?
    result, rest = close_paren(rest)
    raise "Parse error at #{rest}" if result.nil?

    [Plus.new(exp1, exp2), rest]
  else
    [nil, string]
  end
end

def parse_multiply(string)
  if string[0..1] == "(*"
    rest           = string[2..-1]
    result, rest = parse_space(rest)
    raise "Parse error at #{rest}" if result.nil?
    exp1, rest   = parse_expression(rest)
    raise "Parse error at #{rest}" if result.nil?
    result, rest = parse_space(rest)
    raise "Parse error at #{rest}" if result.nil?
    exp2, rest   = parse_expression(rest)
    raise "Parse error at #{rest}" if result.nil?
    result, rest = close_paren(rest)
    raise "Parse error at #{rest}" if result.nil?

    [Multiply.new(exp1, exp2), rest]
  else
    [nil, string]
  end
end

def interpret(input)
  parse_expression(input).first.eval
end

# puts Plus.new(Multiply.new(Number.new(2), Number.new(2)),Plus.new(Number.new(3),(Plus.new(Number.new(1),Number.new(1))))).eval
puts interpret(ARGV.first)
#(Plus.new(Number.new(1),Number,new(1)).eval

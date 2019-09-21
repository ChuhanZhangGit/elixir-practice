defmodule Practice.Calc do
  def parse_float(text) do
    {num, _} = Float.parse(text)
    num
  end


  # def tag_tokens(expr) do
  #     map filter reduce foreach 
  # end

  def checkExpr(expr) do 
    String.match?(expr, ~r/^[[\d][\+|\-|\*|\/][\d]]*|[[\d]]$/)
  end

  def evaluate(a, b, op) do 
    case op do
      "+" -> a + b
      "-" -> a - b
      "*" -> a * b
      "/" -> a/b
      _-> raise ArgumentError, message: "invalid operator"   
    end
  end

  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    expr
    nospace= String.replace(expr, ~r" ", "")
    if checkExpr(nospace) == true do 
      numList = String.split(nospace, ~r/\+|\-|\*|\//) 
      |> Enum.filter(fn num -> num != "" end)
      operatorList = String.split(nospace, ~r/\d/) 
      |> Enum.filter(fn operator -> operator != "" end)
      IO.puts(inspect(numList))
      IO.puts(inspect(operatorList))
      Enum.reduce(numList, fn ele, acc -> [head | tail] = operatorList
        evaluate(elem, acc, head) operatorList = tail end)
  
    else
      "Invalid expression"
    end

  end
end


      # Hint:
    # expr
    # |> split
    # |> tag_tokens  (e.g. [+, 1] => [{:op, "+"}, {:num, 1.0}]
    # |> convert to postfix
    # |> reverse to prefix
    # |> evaluate as a stack calculator using pattern matching

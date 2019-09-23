defmodule Practice.Calc do

  def checkExpr(expr) do 
    String.match?(expr, ~r/^[[\d][\+|\-|\*|\/][\d]]*$|^[[\d]]$/)
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

  def recursive(numList, operatorList, result) do
    if length(numList) == 0 do
      result
    else 
      [secondNum | numListLeft] = numList
      [operator | operatorListLeft] = operatorList
      a = evaluate(result, secondNum, operator)
      recursive(numListLeft, operatorListLeft, a)
    end
  end 

  def calc(expr) do
    # This should handle +,-,*,/ with order of operations,
    # but doesn't need to handle parens.
    nospace= String.replace(expr, ~r" ", "")
    if checkExpr(nospace) == true do 
      numList = String.split(nospace, ~r/\+|\-|\*|\//) 
      |> Enum.filter(fn num -> num != "" end)
      |> Enum.map(fn num -> elem(Float.parse(num), 0) end)
      operatorList = String.split(nospace, ~r/\d/) 
      |> Enum.filter(fn operator -> operator != "" end)
      IO.puts(inspect(numList))
      IO.puts(inspect(operatorList))

      [a | tail] = numList
      recursive(tail, operatorList, a)
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

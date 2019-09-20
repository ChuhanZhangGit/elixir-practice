defmodule Practice.Factor do
  def parse_integer(text) do
    {num, _} = Integer.parse(text)
    num
  end

  def recursive(num) do
      Enum.reverse(recursive(num, 2, []))
  end

  def recursive(num, divideNum, primeList) do
    cond do
        num < divideNum*divideNum -> [num | primeList]
        rem(num, divideNum) == 0 -> 
            recursive(div(num, divideNum), divideNum, [divideNum | primeList])
        true -> recursive(num, divideNum+1, primeList)
    end
  end

  def factor(num) do
    parse_integer(num)
    |> recursive()
  end 
end





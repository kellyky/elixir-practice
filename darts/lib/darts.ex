defmodule Darts do
  def score({x, y}) do
    radius = :math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))

    cond do
      radius <= 1 -> 10
      radius <= 5 -> 5
      radius <= 10 -> 1
      true -> 0
    end
  end
end

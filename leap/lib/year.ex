defmodule Year do
  def leap_year?(year) do
    rem(year, 4) === 0 and (rem(year, 100) != 0 or rem(year, 400) == 0)
  end
end

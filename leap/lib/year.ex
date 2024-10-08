defmodule Year do
  def leap_year?(year) when rem(year, 400) === 0, do: true
  def leap_year?(year) when rem(year, 100) === 0, do: false
  def leap_year?(year) when rem(year, 4) === 0, do: true
  def leap_year?(_), do: false
end

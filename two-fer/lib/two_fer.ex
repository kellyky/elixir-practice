defmodule TwoFer do
  def two_fer(name \\ "you")
  def two_fer(name) when is_number(name), do: raise FunctionClauseError
  def two_fer(name) when is_atom(name), do: raise FunctionClauseError
  def two_fer(name) when is_list(name), do: raise FunctionClauseError
  def two_fer(name), do: "One for #{name}, one for me."
end

defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    first_language = first(list)
    List.delete(list, first_language)
  end

  def first(list) do
    hd(list)
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    Enum.any?(list, fn language -> language == "Elixir" end)
  end
end

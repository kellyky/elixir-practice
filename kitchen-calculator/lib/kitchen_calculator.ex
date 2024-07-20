defmodule KitchenCalculator do
  @milliliters_per_cup 240
  @milliliters_per_fluid_ounce 30
  @milliliters_per_tablespoon 15
  @milliliters_per_teaspoon 5

  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter(v = {:milliliter, _}), do: v
  def to_milliliter({:cup, volume}), do: {:milliliter, volume * @milliliters_per_cup}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, volume * @milliliters_per_fluid_ounce}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, volume * @milliliters_per_tablespoon}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, volume * @milliliters_per_teaspoon}

  def from_milliliter((v = {_, _}), :milliliter), do: v
  def from_milliliter({_, volume}, :cup), do: {:cup, volume / @milliliters_per_cup}
  def from_milliliter({_, volume}, :fluid_ounce), do: {:fluid_ounce, volume / @milliliters_per_fluid_ounce}
  def from_milliliter({_, volume}, :tablespoon), do: {:tablespoon, volume / @milliliters_per_tablespoon}
  def from_milliliter({_, volume}, :teaspoon), do: {:teaspoon, volume / @milliliters_per_teaspoon}

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end

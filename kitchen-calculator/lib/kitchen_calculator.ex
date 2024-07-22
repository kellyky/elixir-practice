defmodule KitchenCalculator do
  @milliliters_per_cup 240
  @milliliters_per_fluid_ounce 30
  @milliliters_per_tablespoon 15
  @milliliters_per_teaspoon 5

  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter(v = {:milliliter, _}), do: v
  def to_milliliter({:cup, cups}), do: {:milliliter, cups * @milliliters_per_cup}
  def to_milliliter({:fluid_ounce, fluid_ounces}), do: {:milliliter, fluid_ounces * @milliliters_per_fluid_ounce}
  def to_milliliter({:tablespoon, tablespoons}), do: {:milliliter, tablespoons * @milliliters_per_tablespoon}
  def to_milliliter({:teaspoon, teaspoons}), do: {:milliliter, teaspoons * @milliliters_per_teaspoon}

  def from_milliliter((v = {_, _}), :milliliter), do: v
  def from_milliliter({:milliliter, milliliters}, :cup), do: {:cup, milliliters / @milliliters_per_cup}
  def from_milliliter({:milliliter, milliliters}, :fluid_ounce), do: {:fluid_ounce, milliliters / @milliliters_per_fluid_ounce}
  def from_milliliter({:milliliter, milliliters}, :tablespoon), do: {:tablespoon, milliliters / @milliliters_per_tablespoon}
  def from_milliliter({:milliliter, milliliters}, :teaspoon), do: {:teaspoon, milliliters / @milliliters_per_teaspoon}

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end
end

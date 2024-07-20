defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair) do
    volume = get_volume(volume_pair)
    unit = elem(volume_pair, 0)

    ml_vol = cond do
      unit == :milliliter -> volume * 1
      unit == :cup -> volume * 240
      unit == :teaspoon -> volume * 5
      unit == :tablespoon -> volume * 15
      unit == :fluid_ounce -> volume * 30
    end

    { :milliliter, ml_vol}
  end

  def from_milliliter(volume_pair, unit) do
    ml_vol = get_volume(volume_pair)
    
    vol = cond do
      unit == :milliliter -> ml_vol / 1
      unit == :cup -> ml_vol / 240
      unit == :teaspoon -> ml_vol / 5
      unit == :tablespoon -> ml_vol / 15
      unit == :fluid_ounce -> ml_vol / 30
    end 

    { unit, vol }
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end

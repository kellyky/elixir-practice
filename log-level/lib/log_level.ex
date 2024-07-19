defmodule LogLevel do

  def to_label(level, legacy?) do
    cond do
      level == 0 && !legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 && !legacy? -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label == :trace -> :false
      label == :debug -> :false
      label == :info -> :false
      label == :warning -> :false
      label == :error -> :ops
      label == :fatal -> :ops
      label == :unknown && legacy? == true -> :dev1
      true -> :dev2
    end
  end
end

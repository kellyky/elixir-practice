defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.at(0)
  end

  def initial(name) do
    first_letter(name)
    |> String.upcase()
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    full_name
    |> String.split(" ")
    |> Enum.map(fn name -> initial(name) end)
    |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    both_initials = initials(full_name1) <> "  +  " <> initials(full_name2)
    initials_string = "**" <> "     " <> both_initials <> "     "<>"**"

    heart_lines = [
        "     ******       ******",
        "   **      **   **      **",
        " **         ** **         **",
        "**            *            **",
        "**                         **",
        initials_string,
        " **                       **",
        "   **                   **",
        "     **               **",
        "       **           **",
        "         **       **",
        "           **   **",
        "             ***",
        "              *"
    ]

    heart_lines
    |> Enum.join("\n")
    |> Kernel.<>("\n")
  end
end

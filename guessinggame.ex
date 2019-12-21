defmodule GuessingGame do
  # guess between a low number and a high number -> guess the middle number
  # tell the user our guess and react to input
  # "yes" -> game over
  # "bigger" -> bigger(low, high)
  # "smaller" -> smaller(low, high)
  # "_" -> tell user to enter valid response

  def guess(a, b) when a > b, do: guess(b, a)

  def guess(low, high) do
    response = IO.gets("Hmm, maybe you are thinking of #{mid(low, high)}?\n")

    case String.trim(response) do
      "b" ->
        bigger(low, high)

      "s" ->
        smaller(low, high)

      "y" ->
        IO.puts("I knew I could!")

      _ ->
        IO.puts(~s{"please enter "b", "s", or "y""})
        guess(low, high)
    end
  end

  def mid(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end

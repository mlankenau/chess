defmodule BoardUtils do
  def ascii_to_board(str) do
    str
    |> String.codepoints
    |> Enum.map(fn(char) ->
      case char do
        " " -> {:free, nil}
        "x" -> {:blocked, nil}
        "P" -> {:pawn, 0}
        "R" -> {:rook, 0}
        "N" -> {:knight, 0}
        "B" -> {:bishop, 0}
        "Q" -> {:queen, 0}
        "K" -> {:king, 0}
        "p" -> {:pawn, 1}
        "r" -> {:rook, 1}
        "n" -> {:knight, 1}
        "b" -> {:bishop, 1}
        "q" -> {:queen, 1}
        "k" -> {:king, 1}
      end
    end)
    |> List.to_tuple
  end

  def pos_to_row(pos), do: 10 - div(pos, 10)

  def field_to_pos(<< cc, rc >>) do
    col =  cc - 65
    row = rc - 49;
    (9 - row) * 10 + col + 1
  end
end

defmodule Board do
  defstruct board: [], next: 0

  def start_board do
    "xxxxxxxxxx" <>
    "xxxxxxxxxx" <>
    "xrnbqkbnrx" <>
    "xppppppppx" <>
    "x        x" <>
    "x        x" <>
    "x        x" <>
    "x        x" <>
    "xPPPPPPPPx" <>
    "xRNBQKBNRx" <>
    "xxxxxxxxxx" <>
    "xxxxxxxxxx"
  end

  def pos_to_row(pos), do: 10 - div(pos, 10)

  def field_to_pos(field) do
    col = 'A' - String.uppercase(String.at(field, 0))
    row = '1' - String.at(field, 1)
    (9 - row) * 10 + col
  end

  def moves(board, player) do
    board
    |> String.codepoints
    |> Stream.with_index
    |> Enum.map fn({piece, pos}) ->
      moves(board, player, piece, is_player(piece, player), pos)
    end
  end

  def moves(board, player, piece, false, pos), do: []

  def moves(board, player, piece, true, pos) do
  end



  def is_player(c, 0), do: String.contains?("RNBQKP", c)
  def is_player(c, 1), do: String.contains?("rnbqkp", c)

  def empty(c), do: c == ' '
end

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
    |> BoardUtils.ascii_to_board
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

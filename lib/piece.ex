defmodule Piece do

  def moves(board, player, 'p', pos) do
    cond do
      Board.pos_to_row(pos) == 7 -> [10,20]
      true                       -> [10]
    end
  end

  def moves(board, player, 'P', pos) do
    cond do
      Board.pos_to_row(pos) == 2 -> [-10,-20]
      true                       -> [-10]
    end
  end

  def moves(board, player, 'r', pos) do
    repeated_move(board, player, 10, 10, pos) ++
    repeated_move(board, player, -10, -10, pos) ++
    repeated_move(board, player, 1, 1, pos) ++
    repeated_move(board, player, -1, -1, pos)
  end
  def moves(board, player, 'R', pos), do: moves(board, player, 'r', pos)

  defp repeated_move(board, player, delta, inc, pos) do
    cond do
      String.at(board, pos + delta) == " " -> [inc | repeated_move(board, player, delta+inc, inc, pos)]
      true                                 -> []
    end
  end
end

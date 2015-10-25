defmodule Piece do

  def moves(board, pos) when is_binary(pos) do
    moves(board, BoardUtils.field_to_pos(pos))
  end

  def moves(board, pos) when is_integer(pos) do
    field = elem(board, pos)
    moves(board, elem(field, 1), elem(field, 0), pos)
  end

  def moves(board, 1, :pawn, pos) do
    cond do
      BoardUtils.pos_to_row(pos) == 7 -> [10,20]
      true                            -> [10]
    end
  end

  def moves(board, 0, :pawn, pos) do
    cond do
      BoardUtils.pos_to_row(pos) == 2 -> [-10,-20]
      true                            -> [-10]
    end
  end

  def moves(board, player, :root, pos) do
    repeated_move(board, player, 10, 10, pos) ++
    repeated_move(board, player, -10, -10, pos) ++
    repeated_move(board, player, 1, 1, pos) ++
    repeated_move(board, player, -1, -1, pos)
  end

  defp repeated_move(board, player, delta, inc, pos) do
    cond do
      String.at(board, pos + delta) == " " -> [inc | repeated_move(board, player, delta+inc, inc, pos)]
      true                                 -> []
    end
  end
end

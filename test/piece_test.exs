defmodule PieceTest do
  use ExUnit.Case
  doctest Piece

  test "the truth" do

    moves = Board.start_board
            |> Piece.moves(0, 'P', 81)

    assert moves == [-10, -20]
  end
end

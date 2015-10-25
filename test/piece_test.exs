defmodule PieceTest do
  use ExUnit.Case
  doctest Piece

  test "the white pawn" do
    moves = Board.start_board |> Piece.moves("A2")
    assert moves == [-10, -20]
  end

  test "the black pawn" do
    moves = Board.start_board |> Piece.moves("A7")
    assert moves == [10, 20]
  end
end

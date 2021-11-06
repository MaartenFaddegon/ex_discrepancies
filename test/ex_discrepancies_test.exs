defmodule ExDiscrepanciesTest do
  use ExUnit.Case

  test "discrepancy 1" do
    Discrepancy1.start_link() |> Discrepancy1.my_api(42)
  end

  test "discrepancy 2" do
    s = Discrepancy2.start_link() |> Discrepancy2.my_api(42)
    # is_binary returns true if s is a string
    assert is_binary(s)
  end
end

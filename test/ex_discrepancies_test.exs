defmodule ExDiscrepanciesTest do
  use ExUnit.Case

  test "discrepancy 1" do
    Discrepancy1.start_link |> Discrepancy1.my_api(42)
  end

end

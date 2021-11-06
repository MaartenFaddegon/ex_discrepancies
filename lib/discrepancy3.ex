defmodule Discrepancy3 do
  @spec safe_div(integer, integer) :: {:ok, integer} | {:error, String.t()}
  def safe_div(_, 0) do
    {:error, 0}
  end

  def safe_div(x, y) do
    {:ok, div(x, y)}
  end
end

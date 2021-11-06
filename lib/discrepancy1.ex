defmodule Discrepancy1 do
  use GenServer

  # client APIs

  @spec start_link :: pid
  def start_link do
    {:ok, pid} = GenServer.start_link(__MODULE__, :ok)
    pid
  end

  @spec my_api(pid, integer) :: String.t()
  def my_api(pid, arg) do
    GenServer.call(pid, {:my_api, arg})
  end

  # server implementation

  @impl true
  def init(:ok) do
    {:ok, :my_state}
  end

  @impl true
  def handle_call({:my_api, arg}, _from, state) do
    res = uppercase(arg)
    {:reply, res, state}
  end

  @spec uppercase(String.t()) :: String.t()
  defp uppercase(arg) do
    String.upcase(arg)
  end
end

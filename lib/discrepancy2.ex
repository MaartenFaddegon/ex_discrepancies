defmodule Discrepancy2 do
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
  @spec handle_call({:my_api, integer}, GenServer.from(), :my_state) ::
          {:reply, integer, :my_state}
  def handle_call({:my_api, arg}, _from, state) do
    res = arg + 1
    {:reply, res, state}
  end
end

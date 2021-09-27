defmodule Forge.Handler do
  def start(_type, _args) do
    children = [
      ExAbci.Listener.child_spec(Forge.Server),
      {Forge.Server, YourAwesomeChain.Handler}
    ]

    opts = [strategy: :one_for_one, name: Forge.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @callback verify(TransactionMessage.t(), Account.t(), AccountState.t()) :: true | false
  @callback update_state(String.t(), Any.t(), Account.t(), map()) :: Account.t()
end

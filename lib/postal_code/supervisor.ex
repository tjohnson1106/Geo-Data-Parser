defmodule ElhexDelivery.PostalCode.Supervisor do
  use Supervisor
  alias ElhexDelivery.PostalCode.Store

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  # define what children need to be monitored in init
  # pass children in supervise method and define strategy

  def init(_) do
    children = [
      worker(Store, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
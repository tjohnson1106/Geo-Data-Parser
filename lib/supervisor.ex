defmodule ElhexDelivery.Supervisor do
  use Supervisor

  # top level of supervision tree

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  # define what children need to be monitored in init
  # child supervisions should be defined in init
  # stategy should be one_for_all since 
  # ^this is top level and can have multiple children

  def init(_) do
    children = [
      supervisor(ElhexDelivery.PostalCode.Supervisor, [])
    ]

    supervise(children, strategy: :one_for_all)
  end
end

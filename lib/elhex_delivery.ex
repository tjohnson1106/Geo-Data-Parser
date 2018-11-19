defmodule ElhexDelivery do
  use Application

  # remember module must be specified in mix file

  def start(_type, _args) do
    ElhexDelivery.Supervisor.start_link()
  end
end

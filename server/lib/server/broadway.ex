defmodule Server.Broadway do
  @id __MODULE__

  def child_spec(_opts) do
    hosts = [localhost: 9092]
    client_config = [auto_start_producers: true]

    %{
      id: @id,
      start: {:brod, :start_link_client, [hosts, @id, client_config]}
    }
  end
end

defmodule Server do
  @moduledoc """
  Produce messages for Kafka using `:brod`.
  """

  def produce(message) do
    server_id = Server.Broadway
    topic = "test"
    partition = 0

    :brod.produce_sync(server_id, topic, partition, _key = "", message)
  end
end

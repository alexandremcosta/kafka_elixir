defmodule Server do
  @moduledoc """
  Produce messages for Kafka using `:brod`.
  """

  def topic, do: "test"
  def client_id, do: :my_client
  def hosts, do: [localhost: 9092]

  def produce(message) do
    partition = 0
    :brod.produce_sync(client_id(), topic(), partition, _key = "", message)
  end
end

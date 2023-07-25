defmodule Client.Broadway do
  @moduledoc """
  Refer to [BroadwayKafka](https://github.com/dashbitco/broadway_kafka#usage) docs.
  """
  use Broadway

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module:
          {BroadwayKafka.Producer,
           [
             hosts: [localhost: 9092],
             group_id: "group_1",
             topics: ["test"]
           ]},
        concurrency: 1
      ],
      processors: [
        default: [
          concurrency: 10
        ]
      ]
    )
  end

  @doc """
  Receives a message from Kafka.

  ## Example

  Start client with

      $ iex -S mix

  Then produce messages in another terminal

      $ kafka-console-producer --bootstrap-server localhost:9092 --topic test 
      >{"foo": "bar"}

  Finally you should see the output in the IEx session.
  """
  def handle_message(processor, message, context) do
    IO.puts("""
    * Processor: #{inspect(processor)}
    * Context: #{inspect(context)}
    * Message
      - Key: #{inspect(message.metadata.key)}
      - Data: #{inspect(message.data)}
      - Offset: #{inspect(message.metadata.offset)}
      - Timestamp: #{inspect(message.metadata.ts)}
      - Topic: #{inspect(message.metadata.topic)}
    """)

    message
  end
end

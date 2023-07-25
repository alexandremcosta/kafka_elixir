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

      $ iex -S mix` session.

  Then produce messages

      $ kafka-console-producer --bootstrap-server localhost:9092 --topic test 
      >{"foo": "bar"}

  Finally you should see the output in the IEx session.
  """
  def handle_message(processor, message, context) do
    IO.inspect(processor, label: "Processor")
    IO.inspect(message.data, label: "Message")
    IO.inspect(message.metadata.topic, label: "Topic")
    IO.inspect(message.metadata.key, label: "Key")
    IO.inspect(message.metadata.offset, label: "Offset")
    IO.inspect(message.metadata.ts, label: "Timestamp")
    IO.inspect(context, label: "Context")
    IO.puts("")

    message
  end
end

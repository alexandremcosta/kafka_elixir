## Usage

1. Start kafka (and its dependency zookeeper)

    $ devenv up

1. Wait 20 seconds to see kafka initialization output

1. Start elixir client

    $ cd client && iex -S mix

1. Produce a kafka message

    $ kafka-console-producer --bootstrap-server localhost:9092 --topic test 
    >{"foo": "bar"}

And voilá! You should see the messages on the IEx session.

## Other commands

- Stop kafka

    $ devenv_down

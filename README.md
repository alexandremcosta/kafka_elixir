## Usage

1. Start kafka (and its dependency zookeeper)

        $ devenv up

    Wait 20 seconds to see kafka initialization output

1. Start elixir client

        $ cd client && iex -S mix

1. Produce a kafka message

        $ kafka-console-producer --bootstrap-server localhost:9092 --topic test 
        >{"foo": "bar"}

And voilá! You should see the messages on the IEx session.

## Other commands

- Stop kafka with `ctrl-c` on its terminal window, or use `devenv_down` if you have closed the window


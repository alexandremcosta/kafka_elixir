## Usage

1. Start kafka (and its dependency zookeeper)

        $ devenv up

    Wait 20 seconds to see kafka initialization output

1. Start elixir client in another terminal

        $ cd client/ && iex -S mix

1. Start elixir server in another terminal

        $ cd server/ && iex -S mix

1. Inside server console, send message from server to client

        iex> Server.produce("foobar")

And voilá! You should see the message on the client IEx session.

## Other commands

- Stop kafka with `ctrl-c` on its terminal window, or use `devenv_down` if you have closed the window


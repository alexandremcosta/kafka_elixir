{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv kafka_elixir";

  # https://devenv.sh/scripts/
  scripts.greeting.exec = "echo You are in $GREET";

  # https://devenv.sh/packages/
  packages = [
    pkgs.confluent-platform
    pkgs.git
  ];

  enterShell = ''
    greeting
    elixir --version | tail -n +3
  '';

  # https://devenv.sh/languages/
  languages.nix.enable = true;
  languages.elixir.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  processes = {
    # Start zookeeper, which is required by kafka
    zookeeper.exec = "zookeeper-server-start zookeeper.properties";

    # Wait 20s after zookeeper initializes to start kafka
    # https://github.com/wurstmeister/kafka-docker/issues/389#issuecomment-800814529
    kafka.exec = "while ! nc -z localhost 2181; do sleep 1; done && sleep 20 && kafka-server-start kafka.properties";
  };

  # Stop processes
  scripts.devenv_down.exec = ''
    processes=("zookeeper" "kafka")

    # Loop through the list and kill each process
    for process in "''${processes[@]}"; do
        pid=$(pgrep -f $process | head -n 1)
        if [ -n "$pid" ]; then
            echo "Killing $process | PID: $(pgrep -l -f kafka | head -n 1)"
            kill "$pid"
        else
            echo "$process is not running."
        fi
    done
  '';

  # See full reference at https://devenv.sh/reference/options/
}

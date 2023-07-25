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
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}

set positional-arguments

# print all available commands by default
default:
  just --list

clean:
  rm **/*.rb.bak
  rm binaries/*

update:
  # downloads the release binaries, calculates the hashes, and updates the Formula file
  ./update.sh Formula/nix-search-cli.rb nix-search-cli nix-search
  ./update.sh Formula/localias.rb localias localias
  ./update.sh Formula/pgmigrate.rb pgmigrate pgmigrate

test-install formula_name:
  #!/usr/bin/env bash
  set -e
  formula_file=$1 # ./Formula/localias.rb
  HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_FROM_API=1 brew uninstall --debug --force --verbose $formula_file
  HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_INSTALL_FROM_API=1 brew install --debug --force --verbose $formula_file

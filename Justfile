set positional-arguments

# print all available commands by default
default:
  just --list

update:
  # download the templated formula from a bottle zip
  # download all the other bottle zips
  # update the hashes and stuff with sha256
  ./update-formula.sh peterldowns/nix-search-cli Formula/nix-search-cli.rb
  ./update-formula.sh peterldowns/localias Formula/localias.rb
  ./update-formula.sh peterldowns/localias Formula/pgmigrate.rb

test-install formula_name:
  #!/usr/bin/env bash
  set -e
  formula_name=$1
  HOMEBREW_NO_INSTALL_FROM_API=1 \
    brew install --build-from-source --verbose --debug \
    ./Formula/${formula_name}.rb

test-uninstall formula_name:
  #!/usr/bin/env bash
  set -e
  formula_name=$1
  brew uninstall --formula --debug --force ./Formula/${formula_name}.rb

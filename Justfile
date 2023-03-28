set positional-arguments

# print all available commands by default
default:
  just --list

update:
  ./update-formula.sh peterldowns/nix-search-cli Formula/nix-search-cli.rb
  ./update-formula.sh peterldowns/localias Formula/localias.rb
